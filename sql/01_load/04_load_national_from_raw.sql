-- sql/01_load/04_load_national_from_raw.sql
-- Phase 4.6: straight typed load of clean.daily_national from raw.daily_power_wide.
-- Grain: one row per record_date. Expected: 1,850 rows.
-- Result: Updated Rows = 1850. Confirmed correct.

INSERT INTO clean.daily_national (
    record_date,
    day_of_week,
    max_demand_gen_end_mw,
    max_demand_substation_end_mw,
    highest_generation_mw,
    minimum_generation_mw,
    day_peak_generation_mw,
    evening_peak_generation_mw,
    min_generation_forecast_mw,
    max_temp_dhaka,
    gas_lf_limitation_mw,
    coal_supply_limitation_mw,
    low_water_kaptai_mw,
    plants_shutdown_maintenance_mw
)
SELECT
    to_date("Date", 'DD.MM.YY'),
    "Day of the week",
    "Max. Demand at eve. peak (Generation end)"::numeric,
    "Max. Demand at eve. peak (Sub-station end)"::numeric,
    "Highest Generation (Generation end)"::numeric,
    "Minimum Generation (Generation end)"::numeric,
    "Day-peak Generation (Generation end)"::numeric,
    "Evening-peak Generation (Generation end)"::numeric,
    NULLIF("Minimum Generation Forecast up to 8:00 hrs.", '')::numeric,
    NULLIF("Maximum Temperature in Dhaka was", '')::numeric,
    NULLIF("Gas/LF limitation", '')::numeric,
    NULLIF("Coal supply Limitation", '')::numeric,
    NULLIF("Low water level in Kaptai lake", '')::numeric,
    NULLIF("Plants under shut down/ maintenance", '')::numeric
FROM raw.daily_power_wide;