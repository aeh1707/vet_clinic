/* Vet clinic database: create animals table */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR NOT NULL,
    date DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    PRIMARY KEY(id)
);

/* Vet clinic database: query and update animals table */

ALTER TABLE animals
ADD species VARCHAR;