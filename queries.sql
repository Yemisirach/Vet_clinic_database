/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name ilike '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.3 AND 17.4;

/* Transaction 1 */

BEGIN;

UPDATE animals SET species='unspecified';

SELECT species FROM animals;
ROLLBACK;

SELECT species FROM animals;

UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species NOT LIKE '%mon';

COMMIT;

SELECT * FROM animals;

/* Transaction 2 */

BEGIN;

DELETE FROM animals;

ROLLBACK;

/* Transaction 3 */

BEGIN;
 
SAVEPOINT SP1;
 
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
 
SAVEPOINT SP2;
 
UPDATE animals SET weight_kg = weight_kg * -1;
 
ROLLBACK TO SP2;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

SELECT * FROM animals;

/* Answer of the Questions */

SELECT COUNT (*) FROM animals;
SELECT COUNT (*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered,SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT neutered,MIN(weight_kg),MAX(weight_kg) FROM animals GROUP BY neutered;
SELECT neutered,AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY neutered;


SELECT name, full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.id = 4;
SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 1;
SELECT full_name, name FROM owners LEFT JOIN animals ON animals.owner_id = owners.id;
SELECT COUNT (animals) as pokemons FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 1;
SELECT COUNT (animals) as digimons FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 2;
SELECT animals.name, owners.full_name FROM animals JOIN owners ON owner_id = owners.id WHERE owners.id = 2 AND species_id = 2;
SELECT animals.name FROM animals JOIN owners ON owner_id = owners.id WHERE owners.id = 5 ;
SELECT owners.full_name FROM animals JOIN owners ON owners.id = owner_id GROUP BY owners.full_name ORDER BY count(*) DESC LIMIT 1;