/* Vet clinic database: create animals table */

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT * FROM animals WHERE date BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered IS true AND escape_attempts < 3;
SELECT date FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Vet clinic database: query and update animals table */

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT COUNT(*), neutered FROM animals GROUP BY neutered;
SELECT MAX(weight_kg), MIN(weight_kg), species FROM animals GROUP BY species;
SELECT AVG(escape_attempts), species FROM animals
WHERE date BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;