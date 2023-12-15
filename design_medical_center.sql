DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    specialty TEXT,
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    visit_date DATE,
    patient INT NOT NULL REFERENCES patients,
    doctor INT NOT NULL REFERENCES doctors,
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit INT NOT NULL REFERENCES visits,
    diagnosis TEXT,
);