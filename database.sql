DROP DATABASE IF EXISTS p6;

CREATE DATABASE p6
WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'French_France.1252'
    LC_CTYPE = 'French_France.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


CREATE TABLE IF NOT EXISTS utilisateur(
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    id SERIAL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS caissier(
    nom_utilisateur VARCHAR(255) NOT NULL,
    prenom_utilisateur VARCHAR(255) NOT NULL,
    numero_utilisateur SERIAL PRIMARY KEY,
    CONSTRAINT fk_nom_client
        FOREIGN KEY (nom_utilisateur)
        REFERENCES utilisateur(prenom),
    CONSTRAINT fk_prenom_client
        FOREIGN KEY (prenom_utilisateur)
        REFERENCES utilisateur(prenom)
);

CREATE TABLE IF NOT EXISTS livreur(
    nom_utilisateur VARCHAR(255) NOT NULL,
    prenom_utilisateur VARCHAR(255) NOT NULL,
    numero_utilisateur SERIAL PRIMARY KEY,
    CONSTRAINT fk_nom_client
        FOREIGN KEY (nom_utilisateur)
        REFERENCES utilisateur(prenom),
    CONSTRAINT fk_prenom_client
        FOREIGN KEY (prenom_utilisateur)
        REFERENCES utilisateur(prenom)
);

CREATE TABLE IF NOT EXISTS pizzaiolo(
    nom_utilisateur VARCHAR(255) NOT NULL,
    prenom_utilisateur VARCHAR(255) NOT NULL,
    numero_utilisateur SERIAL PRIMARY KEY,
    CONSTRAINT fk_nom_client
        FOREIGN KEY (nom_utilisateur)
        REFERENCES utilisateur(prenom),
    CONSTRAINT fk_prenom_client
        FOREIGN KEY (prenom_utilisateur)
        REFERENCES utilisateur(prenom)
);

CREATE TABLE IF NOT EXISTS client(
    nom_client VARCHAR(255) NOT NULL,
    prenom_client VARCHAR(255) NOT NULL,
    numero_utilisateur SERIAL PRIMARY KEY,
    CONSTRAINT fk_nom_client
        FOREIGN KEY (nom_client)
        REFERENCES utilisateur(prenom),
    CONSTRAINT fk_prenom_client
        FOREIGN KEY (prenom_client)
        REFERENCES utilisateur(prenom)
);

CREATE TABLE IF NOT EXISTS information_utilisateur(
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    id SERIAL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS information(
    rue VARCHAR(255) NOT NULL,
    ville VARCHAR (255) NOT NULL,
    code_postal INT NOT NULL,
    information_complementaire VARCHAR (255) NOT NULL,
    adresse_email VARCHAR(255) NOT NULL,
    numero_utilisateur INT NOT NULL,
    id SERIAL PRIMARY KEY,
    CONSTRAINT fk_numero_utilisateur
        FOREIGN KEY (numero_utilisateur)
        REFERENCES client(numero_utilisateur)
);

CREATE TABLE IF NOT EXISTS commande(
    date_time timestamp NOT NULL,
    etat_paiement VARCHAR(6),
    statut_commande VARCHAR(20),
    numero_de_commande SERIAL PRIMARY KEY ,
    livreur_numero_utilisateur INT,
    client_numero_utilisateur INT,
    caissier_numero_utilisateur INT,
    pizzaiolo_numero_utilisateur INT,
    CONSTRAINT fk_livreur_numero_utilisateur
        FOREIGN KEY (livreur_numero_utilisateur)
        REFERENCES livreur(numero_utilisateur),
    CONSTRAINT fk_client_numero_utilisateur
        FOREIGN KEY (client_numero_utilisateur)
        REFERENCES client(numero_utilisateur),
    CONSTRAINT fk_caissier_numero_utilisateur
        FOREIGN KEY (caissier_numero_utilisateur)
        REFERENCES caissier(numero_utilisateur),
    CONSTRAINT fk_pizzaiolo_numero_utilisateur
        FOREIGN KEY (pizzaiolo_numero_utilisateur)
        REFERENCES pizzaiolo(numero_utilisateur)
);

CREATE TABLE IF NOT EXISTS restaurant(
    nom_restaurant VARCHAR(255) NOT NULL,
    id SERIAL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS ingredient(
    nom VARCHAR(255)NOT NULL,
    description VARCHAR(255) NOT NULL,
    id SERIAL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS pizza(
    nom VARCHAR(255) NOT NULL,
    statut VARCHAR(20) NOT NULL,
    recette VARCHAR(255) NOT NULL,
    id SERIAL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS pizza_commande(
    quantite INT NOT NULL,
    date date,
    pizza_id INT,
    commande_numero_de_commande INT,
    CONSTRAINT fk_pizza_id
        FOREIGN KEY (pizza_id)
        REFERENCES pizza(id),
    CONSTRAINT fk_commande_numero_de_commande
        FOREIGN KEY (commande_numero_de_commande)
        REFERENCES commande(numero_de_commande)
);

CREATE TABLE IF NOT EXISTS pizza_restaurant(
    pizza_id INT,
    restaurant_id INT,
    CONSTRAINT fk_pizza_id
        FOREIGN KEY (pizza_id)
        REFERENCES pizza(id),
    CONSTRAINT fk_restaurant_id
        FOREIGN KEY (restaurant_id)
        REFERENCES restaurant(id)
);

CREATE TABLE IF NOT EXISTS ingredient_restaurant(
    quantite INT,
    date date,
    ingredient_id INT,
    restaurant_id INT,
    CONSTRAINT fk_ingredient_id
        FOREIGN KEY (ingredient_id)
        REFERENCES ingredient(id),
    CONSTRAINT fk_restaurant_id
        FOREIGN KEY (restaurant_id)
        REFERENCES restaurant(id)
);

CREATE TABLE IF NOT EXISTS pizza_ingredient(
    pizza_id INT,
    ingredient_id INT,
    CONSTRAINT fk_pizza_id
        FOREIGN KEY (pizza_id)
        REFERENCES pizza(id),
    CONSTRAINT fk_ingredient_id
        FOREIGN KEY (ingredient_id)
        REFERENCES ingredient(id)
);
