-- 03_sql/04_equity/05_equity_analysis.sql
-- Phase 5: the equity analysis (the core).
-- Load-shedding as a percentage of each division's own demand, per division,
-- per year. Tests whether the divisional ordering is stable over time.

-- Query 1: equity ratio by division and year, ratio-of-sums (not sum-of-ratios)
-- to avoid letting individual low-demand days distort the average.
-- Finding: 2022-2024 shows a clear, consistent pattern. Mymensingh has the
-- highest pct_demand_shed every year (5.66% in 2022, 5.41% in 2023, 6.78%
-- in 2024). Dhaka is consistently near the bottom (1.37%, 0.58%, 1.14%).
-- 2019-2021 percentages are mostly 0, consistent with the near-zero
-- shedding found in Phase 4 - the equity story lives in 2022 onward.
SELECT
    division,
    EXTRACT(YEAR FROM record_date)               AS year,
    SUM(demand_mw)                                AS total_demand_mw,
    SUM(load_mw)                                  AS total_load_shed_mw,
    ROUND(SUM(load_mw) / SUM(demand_mw) * 100, 2) AS pct_demand_shed
FROM clean.daily_division
GROUP BY division, EXTRACT(YEAR FROM record_date)
ORDER BY year, pct_demand_shed DESC;

-- Query 2: same ratio, with an explicit RANK() per year to formalize the
-- stability claim (rank 1 = most-shed division that year).
-- Finding: Mymensingh ranks #1 (most-shed) every year from 2022-2024,
-- without exception. Dhaka ranks last or near-last across the same three
-- years (7th in 2022, 9th/last in 2023, 6th in 2024) - never in the upper
-- half. This is a stable, structural pattern, not year-to-year noise.
-- RANK() (not DENSE_RANK()) used deliberately - correctly reflects genuine
-- ties in the low-shedding years (2019, 2021) by skipping rank numbers.
SELECT
    division,
    year,
    pct_demand_shed,
    RANK() OVER (PARTITION BY year ORDER BY pct_demand_shed DESC) AS rank_in_year
FROM (
    SELECT
        division,
        EXTRACT(YEAR FROM record_date)               AS year,
        ROUND(SUM(load_mw) / SUM(demand_mw) * 100, 2) AS pct_demand_shed
    FROM clean.daily_division
    GROUP BY division, EXTRACT(YEAR FROM record_date)
) AS division_year_ratios
ORDER BY year, rank_in_year;

-- Query 3: all years pooled - the single headline ratio per division.
-- Finding: Mymensingh 3.77% vs Dhaka 0.65% over 2019-2024, over 5x.
-- Barishal lowest of all nine at 0.23%. Note this pooled figure is diluted
-- by the near-zero 2019-2021 years - the 2023 single-year gap (5.41% vs
-- 0.58%, ~9x) is a sharper picture of the actual crisis-period disparity,
-- and should be presented alongside this number, not in place of it.
SELECT
    division,
    ROUND(SUM(load_mw) / SUM(demand_mw) * 100, 2) AS pct_demand_shed_all_years
FROM clean.daily_division
G