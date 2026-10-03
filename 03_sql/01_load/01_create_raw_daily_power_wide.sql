-- raw.daily_power_wide definition

-- Drop table

-- DROP TABLE raw.daily_power_wide;

CREATE TABLE raw.daily_power_wide (
	"Date" varchar(50) NULL,
	"Day of the week" varchar(50) NULL,
	"Max. Demand at eve. peak (Generation end)" varchar NULL,
	"Max. Demand at eve. peak (Sub-station end)" varchar NULL,
	"Highest Generation (Generation end)" varchar NULL,
	"Minimum Generation (Generation end)" varchar NULL,
	"Day-peak Generation (Generation end)" varchar NULL,
	"Evening-peak Generation (Generation end)" varchar NULL,
	"Minimum Generation Forecast up to 8:00 hrs." varchar NULL,
	"Maximum Temperature in Dhaka was" varchar NULL,
	"Gas/LF limitation" varchar NULL,
	"Coal supply Limitation" varchar NULL,
	"Low water level in Kaptai lake" varchar NULL,
	"Plants under shut down/ maintenance" varchar NULL,
	"Dhaka_demand" varchar NULL,
	"Dhaka_supply" varchar NULL,
	"Dhaka_load" varchar NULL,
	"Chattogram_demand" varchar NULL,
	"Chattogram_supply" varchar NULL,
	"Chattogram_load" varchar NULL,
	"Rajshahi_demand" varchar NULL,
	"Rajshahi_supply" varchar NULL,
	"Rajshahi_load" varchar NULL,
	"Mymensingh_demand" varchar NULL,
	"Mymensingh_supply" varchar NULL,
	"Mymensingh_load" varchar NULL,
	"Sylhet_demand" varchar NULL,
	"Sylhet_supply" varchar NULL,
	"Sylhet_load" varchar NULL,
	"Barishal_demand" varchar NULL,
	"Barishal_supply" varchar NULL,
	"Barishal_load" varchar NULL,
	"Rangpur_demand" varchar NULL,
	"Rangpur_supply" varchar NULL,
	"Rangpur_load" varchar NULL,
	"Cumilla_demand" varchar NULL,
	"Cumilla_supply" varchar NULL,
	"Cumilla_load" varchar NULL,
	"Khulna_demand" varchar NULL,
	"Khulna_supply" varchar NULL,
	"Khulna_load" varchar NULL
);