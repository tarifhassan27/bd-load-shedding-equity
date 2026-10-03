-- 03_sql/01_load/03_load_clean_from_raw.sql
-- Phase 4.4: reshape raw.daily_power_wide (wide) into clean.daily_division (long).
-- Grain: one row per (record_date, division). Expected: 1,850 x 9 = 16,650 rows.
-- Result: Updated Rows = 16650. Confirmed correct.

INSERT INTO clean.daily_division (record_date, division, demand_mw, supply_mw, load_mw)

SELECT to_date("Date", 'DD.MM.YY') AS record_date, 'Dhaka' AS division,
       "Dhaka_demand"::numeric AS demand_mw, "Dhaka_supply"::numeric AS supply_mw, "Dhaka_load"::numeric AS load_mw
FROM raw.daily_power_wide

UNION ALL

SELECT to_date("Date", 'DD.MM.YY'), 'Chattogram',
       "Chattogram_demand"::numeric, "Chattogram_supply"::numeric, "Chattogram_load"::numeric
FROM raw.daily_power_wide

UNION ALL

SELECT to_date("Date", 'DD.MM.YY'), 'Rajshahi',
       "Rajshahi_demand"::numeric, "Rajshahi_supply"::numeric, "Rajshahi_load"::numeric
FROM raw.daily_power_wide

UNION ALL

SELECT to_date("Date", 'DD.MM.YY'), 'Mymensingh',
       "Mymensingh_demand"::numeric, "Mymensingh_supply"::numeric, "Mymensingh_load"::numeric
FROM raw.daily_power_wide

UNION ALL

SELECT to_date("Date", 'DD.MM.YY'), 'Sylhet',
       "Sylhet_demand"::numeric, "Sylhet_supply"::numeric, "Sylhet_load"::numeric
FROM raw.daily_power_wide

UNION ALL

SELECT to_date("Date", 'DD.MM.YY'), 'Barishal',
       "Barishal_demand"::numeric, "Barishal_supply"::numeric, "Barishal_load"::numeric
FROM raw.daily_power_wide

UNION ALL

SELECT to_date("Date", 'DD.MM.YY'), 'Rangpur',
       "Rangpur_demand"::numeric, "Rangpur_supply"::numeric, "Rangpur_load"::numeric
FROM raw.daily_power_wide

UNION ALL

SELECT to_date("Date", 'DD.MM.YY'), 'Cumilla',
       "Cumilla_demand"::numeric, "Cumilla_supply"::numeric, "Cumilla_load"::numeric
FROM raw.daily_power_wide

UNION ALL

SELECT to_date("Date", 'DD.MM.YY'), 'Khulna',
       "Khulna_demand"::numeric, "Khulna_supply"::numeric, "Khulna_load"::numeric
FROM raw.daily_power_wide;