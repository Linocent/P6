
CREATE TABLE utilisateur(
    nom varchar(255) NOT NULL,
    prenom varchar(255) NOT NULL,
	identifiant serial PRIMARY KEY
);

CREATE TABLE caissier(
    identifiant SERIAL PRIMARY KEY,
    CONSTRAINT fk_numero_utilisateur
        FOREIGN KEY (identifiant)
        REFERENCES utilisateur(identifiant)
);

CREATE TABLE livreur(
    identifiant SERIAL PRIMARY KEY,
    CONSTRAINT fk_numero_utilisateur
        FOREIGN KEY (identifiant)
        REFERENCES utilisateur(identifiant)
);

CREATE TABLE pizzaiolo(
    identifiant SERIAL PRIMARY KEY,
    CONSTRAINT fk_numero_utilisateur
        FOREIGN KEY (identifiant)
        REFERENCES utilisateur(identifiant)
);

CREATE TABLE client(
    identifiant SERIAL PRIMARY KEY,
    CONSTRAINT fk_numero_client
        FOREIGN KEY (identifiant)
        REFERENCES utilisateur(identifiant)
);

CREATE TABLE information(
    rue VARCHAR(255) NOT NULL,
    ville VARCHAR (255) NOT NULL,
    code_postal INT NOT NULL,
    information_complementaire VARCHAR (255) NOT NULL,
    adresse_email VARCHAR(255) NOT NULL,
    identifiant SERIAL PRIMARY KEY,
    CONSTRAINT fk_numero_utilisateur
        FOREIGN KEY (identifiant)
        REFERENCES client(identifiant)
);

CREATE TABLE commande(
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
        REFERENCES livreur(identifiant),
    CONSTRAINT fk_client_numero_utilisateur
        FOREIGN KEY (client_numero_utilisateur)
        REFERENCES client(identifiant),
    CONSTRAINT fk_caissier_numero_utilisateur
        FOREIGN KEY (caissier_numero_utilisateur)
        REFERENCES caissier(identifiant),
    CONSTRAINT fk_pizzaiolo_numero_utilisateur
        FOREIGN KEY (pizzaiolo_numero_utilisateur)
        REFERENCES pizzaiolo(identifiant)
);

CREATE TABLE restaurant(
    nom_restaurant VARCHAR(255) NOT NULL,
    id SERIAL PRIMARY KEY
);

CREATE TABLE ingredient(
    nom VARCHAR(255)NOT NULL,
    description VARCHAR(255) NOT NULL,
    id SERIAL PRIMARY KEY
);

CREATE TABLE pizza(
    nom VARCHAR(255) NOT NULL,
    statut VARCHAR(20) NOT NULL,
    recette VARCHAR(255) NOT NULL,
    id SERIAL PRIMARY KEY
);

CREATE TABLE pizza_commande(
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

CREATE TABLE pizza_restaurant(
    pizza_id INT,
    restaurant_id INT,
    CONSTRAINT fk_pizza_id
        FOREIGN KEY (pizza_id)
        REFERENCES pizza(id),
    CONSTRAINT fk_restaurant_id
        FOREIGN KEY (restaurant_id)
        REFERENCES restaurant(id)
);

CREATE TABLE ingredient_restaurant(
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

CREATE TABLE pizza_ingredient(
    pizza_id INT,
    ingredient_id INT,
    CONSTRAINT fk_pizza_id
        FOREIGN KEY (pizza_id)
        REFERENCES pizza(id),
    CONSTRAINT fk_ingredient_id
        FOREIGN KEY (ingredient_id)
        REFERENCES ingredient(id)
);
