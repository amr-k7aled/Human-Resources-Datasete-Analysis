
DROP TABLE IF EXISTS fact_employment;
DROP TABLE IF EXISTS dim_employee;
DROP TABLE IF EXISTS dim_department;
DROP TABLE IF EXISTS dim_job_role;
DROP TABLE IF EXISTS dim_education_field;

CREATE TABLE dim_department (
    department_id INTEGER PRIMARY KEY,
    department    TEXT NOT NULL UNIQUE
);
CREATE TABLE dim_job_role (
    job_role_id INTEGER PRIMARY KEY,
    job_role    TEXT NOT NULL UNIQUE
);
CREATE TABLE dim_education_field (
    education_field_id INTEGER PRIMARY KEY,
    education_field    TEXT NOT NULL UNIQUE
);
CREATE TABLE dim_employee (
    employee_id        INTEGER PRIMARY KEY,
    age                INTEGER NOT NULL CHECK (age >= 18),
    age_group          TEXT,
    gender             TEXT,
    marital_status     TEXT,
    education          INTEGER CHECK (education BETWEEN 1 AND 5),
    education_label    TEXT,
    education_field_id INTEGER REFERENCES dim_education_field(education_field_id),
    distance_from_home INTEGER,
    distance_band      TEXT
);
CREATE TABLE fact_employment (
    employee_id                 INTEGER PRIMARY KEY REFERENCES dim_employee(employee_id),
    department_id               INTEGER NOT NULL REFERENCES dim_department(department_id),
    job_role_id                 INTEGER NOT NULL REFERENCES dim_job_role(job_role_id),
    job_level                   INTEGER,
    business_travel             TEXT,
    overtime                    TEXT,
    overtime_flag               INTEGER,
    attrition                   TEXT,
    attrition_flag              INTEGER,
    monthly_income              INTEGER,
    income_band                 TEXT,
    daily_rate                  INTEGER,
    hourly_rate                 INTEGER,
    monthly_rate                INTEGER,
    percent_salary_hike         INTEGER,
    stock_option_level          INTEGER,
    total_working_years         INTEGER,
    num_companies_worked        INTEGER,
    years_at_company            INTEGER,
    tenure_band                 TEXT,
    years_in_current_role       INTEGER,
    years_since_last_promotion  INTEGER,
    years_with_curr_manager     INTEGER,
    training_times_last_year    INTEGER,
    job_satisfaction            INTEGER,
    environment_satisfaction    INTEGER,
    relationship_satisfaction   INTEGER,
    job_involvement             INTEGER,
    work_life_balance           INTEGER,
    performance_rating          INTEGER
);
CREATE INDEX idx_fact_dept ON fact_employment(department_id);
CREATE INDEX idx_fact_role ON fact_employment(job_role_id);
