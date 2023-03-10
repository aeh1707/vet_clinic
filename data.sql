/* Vet clinic database: create animals table */

INSERT INTO animals (id, name, date, weight_kg, neutered, escape_attempts) 
VALUES (1, 'Agumon', '2020-02-03', 10.23, true, 0);

INSERT INTO animals (id, name, date, weight_kg, neutered, escape_attempts) 
VALUES (2, 'Gabumon', '2018-11-15', 8, true, 2);

INSERT INTO animals (id, name, date, weight_kg, neutered, escape_attempts) 
VALUES (3, 'Pikachu', '2021-01-07', 15.04, false, 1);

INSERT INTO animals (id, name, date, weight_kg, neutered, escape_attempts) 
VALUES (4, 'Devimon', '2017-05-12', 11, false, 5);

/* Vet clinic database: query and update animals table */

INSERT INTO animals (id, name, date, weight_kg, neutered, escape_attempts)
VALUES (5, 'Charmander', '2020-02-08', -11, false, 0);

INSERT INTO animals (id, name, date, weight_kg, neutered, escape_attempts)
VALUES (6, 'Plantmon', '2021-11-15', -5.7, true, 2);

INSERT INTO animals (id, name, date, weight_kg, neutered, escape_attempts)
VALUES (7, 'Squirtle', '1993-04-02', -12.13, false, 3);

INSERT INTO animals (id, name, date, weight_kg, neutered, escape_attempts)
VALUES (8, 'Angemon', '2005-06-12', -45, true, 1);

INSERT INTO animals (id, name, date, weight_kg, neutered, escape_attempts)
VALUES (9, 'Boarmon', '2005-06-07', 20.4, true, 7);

INSERT INTO animals (id, name, date, weight_kg, neutered, escape_attempts)
VALUES (10, 'Blossom', '1998-10-13', 17, true, 3);

INSERT INTO animals (id, name, date, weight_kg, neutered, escape_attempts)
VALUES (11, 'Blossom', '2022-05-14', 22, true, 4);

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals
WHERE date > '2022-01-01';
SELECT * FROM animals;
SAVEPOINT s1;
UPDATE animals
SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO s1;
SELECT * FROM animals;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

/* Vet clinic database: query multiple tables */

INSERT INTO owners ( full_name, age )
VALUES ( 'Sam Smith', 34 );

INSERT INTO owners ( full_name, age )
VALUES ( 'Jennifer Orwell', 19 );

INSERT INTO owners ( full_name, age )
VALUES ( 'Bob ', 45 );

INSERT INTO owners ( full_name, age )
VALUES ( 'Melody Pond', 77 );

INSERT INTO owners ( full_name, age )
VALUES ( 'Dean Winchester', 14 );

INSERT INTO owners ( full_name, age )
VALUES ( 'Jodie Whittaker ', 38 );

INSERT INTO species ( name )
VALUES ( 'Pokemon' );

INSERT INTO species ( name )
VALUES ( 'Digimon' );

UPDATE animals
SET species_id = ( SELECT id FROM species WHERE name = 'Digimon' )
WHERE name LIKE '%mon%';

UPDATE animals
SET species_id = ( SELECT id FROM species WHERE name = 'Digimon' )
WHERE name LIKE '%mon%';

UPDATE animals
SET species_id = ( SELECT id FROM species WHERE name = 'Pokemon' )
WHERE species_id IS NULL;

UPDATE animals
SET owners_id = ( SELECT id FROM owners WHERE full_name = 'Sam Smith' )
WHERE name = 'Agumon';

UPDATE animals
SET owners_id = ( SELECT id FROM owners WHERE full_name = 'Jennifer Orwell' )
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owners_id = ( SELECT id FROM owners WHERE full_name = 'Bob' )
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owners_id = ( SELECT id FROM owners WHERE full_name = 'Melody Pond' )
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owners_id = ( SELECT id FROM owners WHERE full_name = 'Dean Winchester' )
WHERE name = 'Angemon' OR name = 'Boarmon';