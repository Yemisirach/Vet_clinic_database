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


SELECT animals.name FROM visits JOIN animals ON animals_id = animals.id WHERE vets_id = 1 ORDER BY date_of_the_visit DESC LIMIT 1;
SELECT animals.name FROM visits JOIN animals ON animals_id = animals.id WHERE vets_id = 2;
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets_id = vets.id LEFT JOIN species ON species_id = species.id;

SELECT animals.name FROM animals JOIN visits ON animals.id = animals_id WHERE vets_id = 3 AND date_of_the_visit BETWEEN '2020-04-01' AND '2020-08-30';
SELECT animals.name FROM animals JOIN visits ON animals.id = animals_id GROUP BY animals.name ORDER BY COUNT(*) DESC LIMIT 1;

 SELECT animals.* FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id 
WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_the_visit DESC 
LIMIT 1;
SELECT COUNT(DISTINCT animals.id) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name as specialties FROM vets LEFT JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species ON specializations.species_id = species.id GROUP BY vets.id;
SELECT animals.* FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id 
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_the_visit >= '2020-04-01' AND visits.date_of_the_visit <= '2020-08-30';

SELECT animals.id, animals.name, COUNT(*) as num_visits FROM animals JOIN visits ON animals.id = visits.animals_id GROUP BY animals.id ORDER BY num_visits DESC 
LIMIT 1;

SELECT animals.* FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id 
WHERE vets.name = 'Maisy Smith' 
LIMIT 1;
SELECT animals.*, vets.*, visits.date_of_the_visit FROM visits JOIN animals ON visits.animals_id = animals.id JOIN vets ON visits.vets_id = vets.id 
ORDER BY visits.date_of_the_visit DESC 
LIMIT 1;

SELECT COUNT(*) FROM visits JOIN animals ON visits.animals_id = animals.id JOIN vets ON visits.vets_id = vets.id 
LEFT JOIN specializations ON vets.id = specializations.vets_id 
WHERE specializations.species_id != animals.species_id OR specializations.species_id IS NULL;

SELECT species.name, COUNT(*) as num_visits FROM species JOIN animals ON species.id = animals.species_id JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id LEFT JOIN specializations ON vets.id = specializations.vets_id AND specializations.species_id = species.id WHERE vets.name = 'Maisy Smith' GROUP BY species.id ORDER BY num_visits DESC 
LIMIT 1;