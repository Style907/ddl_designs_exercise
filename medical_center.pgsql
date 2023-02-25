DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL
    
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    date_of_visit TEXT NOT NULL, 
    patient_id INTEGER REFERENCES patients NOT NULL,
    doctor_id INTEGER REFERENCES doctors NOT NULL,
    diagnosed_disease_id INTEGER REFERENCES diseases NOT NULL,
    other_diagnoses_id INTEGER REFERENCES diseases

);

INSERT INTO doctors (first_name, last_name)VALUES 
('james', 'wilson'), 
('linda', 'reeves'),
('morgan', 'taylor'); 

INSERT INTO patients (first_name, last_name)VALUES 
('john', 'thompson'), 
('mark', 'nolan'),
('ray', 'jones');

INSERT INTO diseases (disease_name) VALUES
('herpes'),
('chlamydia'),
('gonorrhea'),
('flu'),
('pubic lice');

INSERT INTO visits (date_of_visit, patient_id, doctor_id, diagnosed_disease_id, other_diagnoses_id) VALUES
('1/3/22', 1, 2, 2, 4),
('1/6/22', 2, 2, 4, 5),
('1/23/22', 3, 1, 1, 2),
('2/4/22', 1, 3, 1, 5);