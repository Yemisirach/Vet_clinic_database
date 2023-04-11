/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int NOT NULL IDENTITY(1,1),
    name            CHAR(20),
    date_of_birth   DATE,
    escape_attempts INT, 
    neutered        BOOLEAN,
    weight_kg       DECIMAL
);
