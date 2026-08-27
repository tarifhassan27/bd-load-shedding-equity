select
    count(*) filter (where "Max. Demand at eve. peak (Generation end)" !~ '^-?[0-9]+(\.[0-9]+)?$') as max_demand_at_eve_peak_generation_end_nonnumeric,
    count(*) filter (where "Max. Demand at eve. peak (Sub-station end)" !~ '^-?[0-9]+(\.[0-9]+)?$') as max_demand_at_eve_peak_sub_station_end_nonnumeric,
    count(*) filter (where "Highest Generation (Generation end)" !~ '^-?[0-9]+(\.[0-9]+)?$') as highest_generation_generation_end_nonnumeric,
    count(*) filter (where "Minimum Generation (Generation end)" !~ '^-?[0-9]+(\.[0-9]+)?$') as minimum_generation_generation_end_nonnumeric,
    count(*) filter (where "Day-peak Generation (Generation end)" !~ '^-?[0-9]+(\.[0-9]+)?$') as day_peak_generation_generation_end_nonnumeric,
    count(*) filter (where "Evening-peak Generation (Generation end)" !~ '^-?[0-9]+(\.[0-9]+)?$') as evening_peak_generation_generation_end_nonnumeric,
    count(*) filter (where "Minimum Generation Forecast up to 8:00 hrs." !~ '^-?[0-9]+(\.[0-9]+)?$') as minimum_generation_forecast_up_to_8_00_hrs_nonnumeric,
    count(*) filter (where "Maximum Temperature in Dhaka was" !~ '^-?[0-9]+(\.[0-9]+)?$') as maximum_temperature_in_dhaka_was_nonnumeric,
    count(*) filter (where "Gas/LF limitation" !~ '^-?[0-9]+(\.[0-9]+)?$') as gas_lf_limitation_nonnumeric,
    count(*) filter (where "Coal supply Limitation" !~ '^-?[0-9]+(\.[0-9]+)?$') as coal_supply_limitation_nonnumeric,
    count(*) filter (where "Low water level in Kaptai lake" !~ '^-?[0-9]+(\.[0-9]+)?$') as low_water_level_in_kaptai_lake_nonnumeric,
    count(*) filter (where "Plants under shut down/ maintenance" !~ '^-?[0-9]+(\.[0-9]+)?$') as plants_under_shut_down_maintenance_nonnumeric,
    count(*) filter (where "Dhaka_demand" !~ '^-?[0-9]+(\.[0-9]+)?$') as dhaka_demand_nonnumeric,
    count(*) filter (where "Dhaka_supply" !~ '^-?[0-9]+(\.[0-9]+)?$') as dhaka_supply_nonnumeric,
    count(*) filter (where "Dhaka_load" !~ '^-?[0-9]+(\.[0-9]+)?$') as dhaka_load_nonnumeric,
    count(*) filter (where "Chattogram_demand" !~ '^-?[0-9]+(\.[0-9]+)?$') as chattogram_demand_nonnumeric,
    count(*) filter (where "Chattogram_supply" !~ '^-?[0-9]+(\.[0-9]+)?$') as chattogram_supply_nonnumeric,
    count(*) filter (where "Chattogram_load" !~ '^-?[0-9]+(\.[0-9]+)?$') as chattogram_load_nonnumeric,
    count(*) filter (where "Rajshahi_demand" !~ '^-?[0-9]+(\.[0-9]+)?$') as rajshahi_demand_nonnumeric,
    count(*) filter (where "Rajshahi_supply" !~ '^-?[0-9]+(\.[0-9]+)?$') as rajshahi_supply_nonnumeric,
    count(*) filter (where "Rajshahi_load" !~ '^-?[0-9]+(\.[0-9]+)?$') as rajshahi_load_nonnumeric,
    count(*) filter (where "Mymensingh_demand" !~ '^-?[0-9]+(\.[0-9]+)?$') as mymensingh_demand_nonnumeric,
    count(*) filter (where "Mymensingh_supply" !~ '^-?[0-9]+(\.[0-9]+)?$') as mymensingh_supply_nonnumeric,
    count(*) filter (where "Mymensingh_load" !~ '^-?[0-9]+(\.[0-9]+)?$') as mymensingh_load_nonnumeric,
    count(*) filter (where "Sylhet_demand" !~ '^-?[0-9]+(\.[0-9]+)?$') as sylhet_demand_nonnumeric,
    count(*) filter (where "Sylhet_supply" !~ '^-?[0-9]+(\.[0-9]+)?$') as sylhet_supply_nonnumeric,
    count(*) filter (where "Sylhet_load" !~ '^-?[0-9]+(\.[0-9]+)?$') as sylhet_load_nonnumeric,
    count(*) filter (where "Barishal_demand" !~ '^-?[0-9]+(\.[0-9]+)?$') as barishal_demand_nonnumeric,
    count(*) filter (where "Barishal_supply" !~ '^-?[0-9]+(\.[0-9]+)?$') as barishal_supply_nonnumeric,
    count(*) filter (where "Barishal_load" !~ '^-?[0-9]+(\.[0-9]+)?$') as barishal_load_nonnumeric,
    count(*) filter (where "Rangpur_demand" !~ '^-?[0-9]+(\.[0-9]+)?$') as rangpur_demand_nonnumeric,
    count(*) filter (where "Rangpur_supply" !~ '^-?[0-9]+(\.[0-9]+)?$') as rangpur_supply_nonnumeric,
    count(*) filter (where "Rangpur_load" !~ '^-?[0-9]+(\.[0-9]+)?$') as rangpur_load_nonnumeric,
    count(*) filter (where "Cumilla_demand" !~ '^-?[0-9]+(\.[0-9]+)?$') as cumilla_demand_nonnumeric,
    count(*) filter (where "Cumilla_supply" !~ '^-?[0-9]+(\.[0-9]+)?$') as cumilla_supply_nonnumeric,
    count(*) filter (where "Cumilla_load" !~ '^-?[0-9]+(\.[0-9]+)?$') as cumilla_load_nonnumeric,
    count(*) filter (where "Khulna_demand" !~ '^-?[0-9]+(\.[0-9]+)?$') as khulna_demand_nonnumeric,
    count(*) filter (where "Khulna_supply" !~ '^-?[0-9]+(\.[0-9]+)?$') as khulna_supply_nonnumeric,
    count(*) filter (where "Khulna_load" !~ '^-?[0-9]+(\.[0-9]+)?$') as khulna_load_nonnumeric
from raw.daily_power_wide;

-- Finding: 6 columns contain blank values not caught by the NULL check.
-- Minimum Generation Forecast up to 8:00 hrs. (1 blank), Maximum Temperature in
-- Dhaka (5 blanks), Gas/LF limitation (1), Coal supply Limitation (1),
-- Low water level in Kaptai lake (1), Plants under shut down/maintenance (1).
-- These are true blanks in the source file, stored as empty strings ('') rather
-- than NULL during import, so the earlier IS NULL check did not detect them.
-- All demand/supply/load columns across all 9 divisions are fully clean --
-- zero nulls, zero non-numeric values. These blanks are limited to secondary
-- metadata fields and do not affect the core Phase 5 equity metric.
-- =============================================================
-- Phase 3 Audit Findings — raw.daily_power_wide
-- =============================================================
--
-- 1. ROW COUNT
--    1,850 rows. Confirmed consistent across Phase 1 (source file),
--    Phase 2 (load into Postgres), and here.
--
-- 2. NULLS
--    Zero NULL values across all 41 columns.
--
-- 3. NON-NUMERIC / BLANK VALUES
--    Zero non-numeric values in any demand, supply, or load column
--    (all 9 divisions) or in the generation/temperature columns.
--    6 blank cells found, stored as empty strings ('') rather than
--    NULL (the CSV import did not have "set empty strings to NULL"
--    enabled), so the NULL check above did not catch them:
--      - Minimum Generation Forecast up to 8:00 hrs. : 1 blank
--      - Maximum Temperature in Dhaka                : 5 blanks
--      - Gas/LF limitation                            : 1 blank
--      - Coal supply Limitation                       : 1 blank
--      - Low water level in Kaptai lake               : 1 blank
--      - Plants under shut down/ maintenance          : 1 blank
--    All 6 are secondary metadata fields, not part of the core
--    demand/supply/load data used in the Phase 5 equity metric.
--
-- 4. DATE RANGE AND GAPS
--    Date range: 2019-11-21 to 2024-12-30 (1,867 calendar days
--    inclusive). Actual row count is 1,850, meaning 17 calendar
--    days have no row at all. This resolves the discrepancy
--    noted in Phase 1 between this dataset (1,850 rows) and the
--    1,867 figure cited in the source paper.
--    The 17 missing dates:
--      2020-01-02
--      2020-03-27, 2020-03-28
--      2023-01-23, 2023-03-15, 2023-04-01, 2023-05-08,
--      2023-05-16, 2023-07-05
--      2024-06-03
--      2024-07-01
--      2024-07-18, 2024-07-19, 2024-07-20, 2024-07-21,
--      2024-07-22, 2024-07-23
--    Most gaps are isolated single days, consistent with ordinary
--    reporting gaps. The exception is 2024-07-18 through 2024-07-23,
--    six consecutive missing days, which more plausibly reflects a
--    genuine reporting interruption than random missingness — this
--    period coincides with major civil unrest and nationwide
--    internet shutdowns in Bangladesh, though that connection is
--    not confirmed and is noted here as a plausible explanation
--    only, not fact.
--
-- 5. IMPOSSIBLE VALUES
--    Across all 9 divisions: zero negative values in demand,
--    supply, or load; zero rows where load exceeds demand.
--
-- 6. CONSISTENCY CHECK (demand - supply = load)
--    5 mismatches out of 16,650 data points (1,850 rows x 9
--    divisions), a 0.03% discrepancy rate. Two distinct patterns:
--      a) Three simple +/-1 MW discrepancies, likely rounding or
--         transcription slips:
--           - Dhaka,  26.07.22: 4676 - 4399 = 277, recorded as 276
--           - Sylhet, 26.07.22: 478  - 424  = 54,  recorded as 53
--           - Cumilla,18.08.22: 1055 - 994  = 61,  recorded as 60
--         Dhaka and Sylhet share the same date (26.07.22), which
--         may indicate a shared national-level reporting artifact
--         on that specific day rather than two unrelated errors.
--      b) Two more substantial anomalies in Khulna, on consecutive
--         days in July 2020:
--           - Khulna, 30.07.20: demand 1506, supply 1515 (supply
--             EXCEEDS demand), load recorded as 0
--           - Khulna, 31.07.20: demand 1506, supply 1483, gap of
--             23 MW, load recorded as 0 (not 23)
--         These are not rounding-level errors and are flagged as
--         a distinct, more serious anomaly type.
--
-- 7. DAY-OF-WEEK ACCURACY
--    6 rows where the stated "Day of the week" does not match the
--    actual weekday computed from "Date" (verified against a real
--    calendar, e.g. 27.02.20 is confirmed Thursday). Mostly off by
--    one day, no single consistent direction or cause identified.
--    Does not affect the Phase 5 equity metric, which does not use
--    this column, but is a genuine source-data quality issue worth
--    disclosing.
--
-- =============================================================
-- OVERALL: raw.daily_power_wide is high quality. No nulls, no
-- non-numeric junk, no impossible values, and only 5 small
-- arithmetic inconsistencies out of 16,650 core data points.
-- Known limitations: 17 missing calendar days (incl. a 6-day
-- cluster in Jul 2024), 6 blank secondary metadata cells, and
-- 6 day-of-week labeling errors in the source file. None of
-- these materially threaten the Phase 5 equity analysis.
-- =============================================================