use COVID

CREATE TABLE CONTINENT(
ID_CONTINENT  int primary key identity(1,1) not null,
CONTINENT VARCHAR(30),
);
DROP TABLE CONTINENT;


CREATE TABLE COUNTRY(
ISO_CODE VARCHAR(10),
LOCATION VARCHAR(30) NOT NULL,
ID_CONTINENT INT,
PRIMARY KEY (ISO_CODE),
CONSTRAINT FK_CONTINENT_COUNTRY
    FOREIGN KEY (ID_CONTINENT)
    REFERENCES CONTINENT (ID_CONTINENT)
);

DROP TABLE COUNTRY;

CREATE TABLE CONFIRMED_CASES(
id_cc int primary key identity(1,1) not null,
date_cc varchar(30),
total_cases INT,
new_cases INT,
new_cases_smoothed FLOAT, 
total_cases_per_million FLOAT, 
new_cases_per_million FLOAT,
new_cases_smoothed_per_million FLOAT,
iso_code_cc VARCHAR(10) NOT NULL,
CONSTRAINT FK_CONFIRMED_CASES_COUNTRY
    FOREIGN KEY (iso_code_cc)
    REFERENCES COUNTRY (iso_code)
);
DROP TABLE CONFIRMED_CASES;

CREATE TABLE CONFIRMED_DEATH(
id_cd int primary key identity(1,1) not null,
date TIMESTAMP,
total_deaths INT,
new_deaths INT,
new_deaths_smoothed FLOAT,
total_deaths_per_million FLOAT,
new_deaths_per_million FLOAT,
new_deaths_smoothed_per_million FLOAT,
iso_code_cd VARCHAR(10) NOT NULL,
CONSTRAINT FK_CONFIRMED_DEATH_COUNTRY
    FOREIGN KEY (iso_code_cd)
    REFERENCES COUNTRY (iso_code)
);
DROP TABLE CONFIRMED_DEATH;

CREATE TABLE ICU(
id_icu int primary key identity(1,1) not null,
date TIMESTAMP,
icu_patients FLOAT, 
icu_patients_per_million FLOAT, 
weekly_icu_admissions FLOAT, 
weekly_icu_admissions_per_million FLOAT, 
iso_code_icu VARCHAR(10) NOT NULL,
CONSTRAINT FK_ICU_COUNTRY
    FOREIGN KEY (iso_code_icu)
    REFERENCES COUNTRY (iso_code)
);
DROP TABLE ICU;

CREATE TABLE HOSPITAL(
id_h int primary key identity(1,1) not null,
date TIMESTAMP,
hosp_patients FLOAT, 
hosp_patients_per_million FLOAT, 
weekly_hosp_admissions FLOAT,
weekly_hosp_admissions_per_million FLOAT,
iso_code_h VARCHAR(10) NOT NULL,
CONSTRAINT FK_HOSPITAL_COUNTRY
    FOREIGN KEY (iso_code_h)
    REFERENCES COUNTRY (iso_code)
);
DROP TABLE HOSPITAL;

CREATE TABLE TEST_UNIT(
ID_TEST_UNIT int primary key identity(1,1) not null,
tests_units VARCHAR(50),
);
DROP TABLE TEST_UNIT;


CREATE TABLE TESTS(
id_ts int primary key identity(1,1) not null,
date TIMESTAMP,
total_tests FLOAT,
new_tests FLOAT,
total_tests_per_thousand FLOAT,
new_tests_per_thousand FLOAT,
new_tests_smoothed FLOAT,
new_tests_smoothed_per_thousand FLOAT,
positive_rate FLOAT,
tests_per_case FLOAT,
id_test_unit int,
iso_code_t VARCHAR(10) NOT NULL,
CONSTRAINT FK_TESTS_COUNTRY
    FOREIGN KEY (iso_code_t)
    REFERENCES COUNTRY (iso_code),
CONSTRAINT FK_TESTS_TEST_UNIT
    FOREIGN KEY (id_test_unit)
    REFERENCES TEST_UNIT (id_test_unit)    
);
DROP TABLE TESTS;

CREATE TABLE VACCINATIONS(
id_v int primary key identity(1,1) not null,
date TIMESTAMP,
total_vaccinations FLOAT,
people_vaccinated FLOAT,
people_fully_vaccinated FLOAT,
total_boosters FLOAT,
new_vaccinations FLOAT,
new_vaccinations_smoothed FLOAT,
total_vaccinations_per_hundred FLOAT,
people_vaccinated_per_hundred FLOAT,
people_fully_vaccinated_per_hundred FLOAT,
total_boosters_per_hundred FLOAT,
new_vaccinations_smoothed_per_million FLOAT,
iso_code_v VARCHAR(10) NOT NULL,
CONSTRAINT FK_VACCINATED_COUNTRY
    FOREIGN KEY (iso_code_v)
    REFERENCES COUNTRY (iso_code)
);
DROP TABLE VACCINATIONS;

CREATE TABLE OTHERS(
id_o int primary key identity(1,1) not null,
date TIMESTAMP,
stringency_index FLOAT, 
reproduction_rate FLOAT,
population INT,
population_density FLOAT,
median_age FLOAT,
aged_65_older FLOAT,
aged_70_older FLOAT,
gdp_per_capita FLOAT, 
extreme_poverty FLOAT,
cardiovasc_death_rate FLOAT,
diabetes_prevalence FLOAT,
female_smokers FLOAT,
male_smokers FLOAT,
handwashing_facilities FLOAT,
hospital_beds_per_thousand FLOAT,
life_expectancy FLOAT,
human_development_index FLOAT,
excess_mortality VARCHAR(30),
excess_mortality_cumulative VARCHAR(30), 
excess_mortality_cumulative_absolute VARCHAR(30), 
excess_mortality_cumulative_per_million VARCHAR(30),
iso_code_o VARCHAR(10) NOT NULL,
CONSTRAINT FK_OTHER_COUNTRY
    FOREIGN KEY (iso_code_o)
    REFERENCES COUNTRY (iso_code)
);
drop table others;