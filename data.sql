/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5, 'Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (6, 'Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (7, 'Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (8, 'Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (9, 'Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10, 'Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (11, 'Ditto', '2022-05-14', 4, true, 22);

INSERT INTO animals VALUES 
  (5, 'Charmander', '02-08-2020', 0, 'False', -11),
  (6, 'Plantmon', '11-15-2021', 2, 'True', -5.7),
  (7, 'Squirtle', '04-02-1993', 3, 'False', -12.13),
  (8, 'Angemon', '06-12-2005', 1, 'True', -45),
  (9, 'Boarmon', '06-07-2005', 7, 'True', 20.4),
  (10, 'Blossom', '10-13-1998', 3, 'True', 17),
  (11, 'Ditto', '05-14-2022', 4, 'True', 22);

INSERT INTO owners (full_name, age) VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES
  ('Pokemon'),
  ('Digimon');

INSERT INTO animals (name, species_id, owner_id) VALUES
  ('Agumon', 2, 1),
  ('Gabumon', 2, 2),
  ('Pikachu', 1, 2),
  ('Devimon', 2, 3),
  ('Plantmon', 1, 3),
  ('Charmander', 1, 4),
  ('Squirtle', 1, 4),
  ('Blossom', 1, 4),
  ('Angemon', 2, 5),
  ('Boarmon', 1, 5);


INSERT INTO vets (name,age,date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (species_id, vets_id) VALUES (1, 1);
INSERT INTO specializations (species_id, vets_id) VALUES (2, 3);
INSERT INTO specializations (species_id, vets_id) VALUES (1, 3);
INSERT INTO specializations (species_id, vets_id) VALUES (2, 4);

INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (1, 1, '2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (1, 3, '2020-07-22');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (2, 4, '2021-02-02');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (5, 2, '2020-01-05');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (5, 2, '2020-03-08');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (5, 2, '2020-05-14');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (3, 3, '2021-05-04');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (9, 4, '2021-02-24');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (7, 2, '2019-12-21');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (7, 1, '2020-08-10');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (7, 2, '2021-04-07');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (10, 3, '2019-09-29');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (8, 4, '2020-10-03');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (8, 4, '2020-11-04');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (4, 2, '2019-01-24');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (4, 2, '2019-05-15');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (4, 2, '2020-02-27');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (4, 2, '2020-08-03');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (6, 3, '2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_the_visit) VALUES (6, 1, '2021-01-11');