-- sql/03_baseline/04_baseline_queries.sql
-- Phase 4.8: descriptive baseline. Total/mean load-shedding by year, by month,
-- by division, and demand growth over time.

-- Query 1: total and mean load-shedding by year.
-- Finding: shedding is near-zero 2019-2021 (avg 0-0.2 MW/day), then jumps
-- ~300x in 2022 (avg 25.9 MW/day) and stays elevated through 2023-2024
-- (21.2, 25.1 MW/day). This is a level shift, not a gradual trend.
-- Note: 2019 (41 days) and 2023-2024 (359, 357 days) are not full years,
-- consistent with the 17 missing calendar days found in Phase 3 audit -
-- use avg_daily_load_shed_mw, not totals, when comparing across years.
SELECT
    EXTRACT(YEAR FROM record_date) AS year,
    SUM(load_mw)                   AS total_load_shed_mw,
    ROUND(AVG(load_mw), 1)         AS avg_daily_load_shed_mw,
    COUNT(DISTINCT record_date)    AS days_in_year
FROM clean.daily_division
GROUP BY EXTRACT(YEAR FROM record_date)
ORDER BY year;

-- Query 2: by month, all years pooled - the seasonal shape.
-- Finding: shedding is low Jan-Mar, climbs sharply from April, peaks
-- Jul-Sep (26-30 MW/day avg), then drops steeply by Nov-Dec (near zero).
-- This is the summer/monsoon window - peak cooling demand combined with
-- typically worst fuel-supply constraints, not the dry season.
-- Caveat: table pools all six years, and 2022-2024 dominate total volume,
-- so this reflects the seasonal shape during the crisis years specifically.
SELECT
    EXTRACT(MONTH FROM record_date) AS month,
    SUM(load_mw)                    AS total_load_shed_mw,
    ROUND(AVG(load_mw), 1)          AS avg_daily_load_shed_mw
FROM clean.daily_division
GROUP BY EXTRACT(MONTH FROM record_date)
ORDER BY month;

-- Query 3: by division, all years pooled - raw MW, not yet the equity ratio.
-- Finding: raw MW ranking does not track demand size. Mymensingh has the
-- lowest demand among the top four divisions (1.72M) but the HIGHEST total
-- shedding (64,900), exceeding Dhaka (7.35M demand, 48,020 shedding).
-- Barishal has near-zero shedding (1,395 total, 0.8 MW/day avg) despite
-- being the smallest division - flagged for a sanity check in Phase 5.
-- This ambiguity (raw MW can't separate "large division" from "unfairly
-- treated division") is exactly why Phase 5's % of demand metric is needed.
SELECT
    division,
    SUM(demand_mw)          AS total_demand_mw,
    SUM(load_mw)            AS total_load_shed_mw,
    ROUND(AVG(load_mw), 1)  AS avg_daily_load_shed_mw
FROM clean.daily_division
GROUP BY division
ORDER BY total_load_shed_mw DESC;

-- Query 4: total demand by year - context for query 1.
-- Finding: demand grew smoothly and continuously every year (877 -> 1,376
-- MW/day avg, 2019-2024, roughly 8-10% YoY, no jumps or plateaus). This
-- does NOT match the shape of query 1's shedding jump, which is flat
-- through 2021 then jumps abruptly in 2022. Conclusion: the 2022 crisis
-- was not demand outpacing a slowly-growing system - demand grew steadily
-- throughout. Something changed on the supply side in 2022 (consistent
-- with the 2022 global fuel-price shock hitting Bangladesh's gas/import-
-- dependent generation).
SELECT
    EXTRACT(YEAR FROM record_date) AS year,
    SUM(demand_mw)                 AS total_demand_mw,
    ROUND(AVG(demand_mw), 1)       AS avg_daily_demand_mw
FROM clean.daily_division
GROUP BY EXTRACT(YEAR FROM record_date)
ORDER BY year;