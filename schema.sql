/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id              INT,
    name            CHAR(20),
    date_of_birth   DATE,
    escape_attempts INT, 
    neutered        BOOLEAN,
    weight_kg       DECIMAL
);

ALTER TABLE animals ADD species CHAR(20);
CREATE TABLE owners (
   id SERIAL PRIMARY KEY,
    full_name TEXT,
    age INTEGER
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name TEXT
);

ALTER TABLE animals
    ADD COLUMN species_id INTEGER,
    ADD COLUMN owner_id INTEGER,
    DROP COLUMN species,
    ADD FOREIGN KEY (species_id) REFERENCES species (id),
    ADD FOREIGN KEY (owner_id) REFERENCES owners (id);
  
CREATE TABLE vets (
    id                 INT  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name               CHAR(30),
    age                INT,
    date_of_graduation date
);

CREATE TABLE specializations (
    species_id  INT,
    vets_id     INT
);

CREATE TABLE visits (
    animals_id        INT,
    vets_id           INT,
    date_of_the_visit date
);