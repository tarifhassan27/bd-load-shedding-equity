-- sql/02_audit/03_reconciliation_checks.sql
-- Phase 4.5 + 4.6: reconciliation of clean schema loads against raw.daily_power_wide.

-- Check 1: row count per division in clean.daily_division. Expected 1,850 each.
-- Result: all nine divisions returned exactly 1,850. Confirmed.
SELECT division, COUNT(*) AS row_count
FROM clean.daily_division
GROUP BY division
ORDER BY division;

-- Check 2: total row count. Expected 16,650.
-- Result: 16,650. Confirmed.
SELECT COUNT(*) FROM clean.daily_division;

-- Check 3a: Dhaka demand sum, clean vs raw. Must match exactly.
-- Result: 7,352,150 = 7,352,150. Confirmed.
SELECT
    (SELECT SUM(demand_mw) FROM clean.daily_division WHERE division = 'Dhaka') AS clean_dhaka_demand,
    (SELECT SUM("Dhaka_demand"::numeric) FROM raw.daily_power_wide) AS raw_dhaka_demand;

-- Check 3b: Sylhet demand sum, clean vs raw. Must match exactly.
-- Result: 819,819 = 819,819. Confirmed.
SELECT
    (SELECT SUM(demand_mw) FROM clean.daily_division WHERE division = 'Sylhet') AS clean_sylhet_demand,
    (SELECT SUM("Sylhet_demand"::numeric) FROM raw.daily_power_wide) AS raw_sylhet_demand;

-- Check 3c: Khulna demand sum, clean vs raw. Must match exactly.
-- Result: 2,534,446 = 2,534,446. Confirmed.
SELECT
    (SELECT SUM(demand_mw) FROM clean.daily_division WHERE division = 'Khulna') AS clean_khulna_demand,
    (SELECT SUM("Khulna_demand"::numeric) FROM raw.daily_power_wide) AS raw_khulna_demand;

-- Check 4: clean.daily_national row count. Expected 1,850.
-- Result: 1,850. Confirmed (via Updated Rows on insert).

-- Check 5: highest_generation_mw sum, clean vs raw. Must match exactly.
-- Result: 21,421,225.7 = 21,421,225.7. Confirmed.
SELECT
    (SELECT SUM(highest_generation_mw) FROM clean.daily_national) AS clean_highest_gen,
    (SELECT SUM("Highest Generation (Generation end)"::numeric) FROM raw.daily_power_wide) AS raw_highest_gen;

-- Check 6: max_temp_dhaka NULL count vs raw blank-string count. Expected 5 = 5.
-- Result: 5 = 5. Confirmed.
SELECT
    (SELECT COUNT(*) FROM clean.daily_national WHERE max_temp_dhaka IS NULL) AS clean_nulls,
    (SELECT COUNT(*) FROM raw.daily_power_wide WHERE "Maximum Temperature in Dhaka was" = '') AS raw_blanks;

-- Overall conclusion: all reconciliation checks passed exactly. Both clean tables
-- (daily_division, daily_national) are verified correct against raw.daily_power_wide.