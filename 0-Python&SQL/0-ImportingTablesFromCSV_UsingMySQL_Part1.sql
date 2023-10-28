CREATE DATABASE countries; 

USE countries; 

CREATE TABLE cities (
  name                    VARCHAR(150)   PRIMARY KEY,
  country_code            VARCHAR(150),
  city_proper_pop         REAL,
  metroarea_pop           REAL,
  urbanarea_pop           REAL
);

CREATE TABLE countries (
  code                  VARCHAR(150)     PRIMARY KEY,
  name                  VARCHAR(150),
  continent             VARCHAR(150),
  region                VARCHAR(150),
  surface_area          REAL,
  indep_year            INTEGER,
  local_name            VARCHAR(150),
  gov_form              VARCHAR(150),
  capital               VARCHAR(150),
  cap_long              REAL,
  cap_lat               REAL
);

CREATE TABLE languages (
  lang_id               INTEGER     PRIMARY KEY,
  code                  VARCHAR(150),
  name                  VARCHAR(150),
  percent               REAL,
  official              BOOLEAN
);

CREATE TABLE economies (
  econ_id               INTEGER     PRIMARY KEY,
  code                  VARCHAR(150),
  year                  INTEGER,
  income_group          VARCHAR(150),
  gdp_percapita         REAL,
  gross_savings         REAL,
  inflation_rate        REAL,
  total_investment      REAL,
  unemployment_rate     REAL,
  exports               REAL,
  imports               REAL
);

CREATE TABLE currencies (
  curr_id               INTEGER     PRIMARY KEY,
  code                  VARCHAR(150),
  basic_unit            VARCHAR(150),
  curr_code             VARCHAR(150),
  frac_unit             VARCHAR(150),
  frac_perbasic         REAL
);

CREATE TABLE populations (
  pop_id                INTEGER     PRIMARY KEY,
  country_code          VARCHAR(150),
  year                  INTEGER,
  fertility_rate        REAL,
  life_expectancy       REAL,
  size                  REAL
);

CREATE TABLE economies2015 (
  code                  VARCHAR(150)     PRIMARY KEY,
  year                  INTEGER,
  income_group          VARCHAR(150),
  gross_savings         REAL
);

CREATE TABLE economies2019 (
  code                  VARCHAR(150)     PRIMARY KEY,
  year                  INTEGER,
  income_group          VARCHAR(150),
  gross_savings         REAL
);

CREATE TABLE eu_countries (
  code                  VARCHAR(150)     PRIMARY KEY,
  name                  VARCHAR(150)
);
