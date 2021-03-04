CREATE DATABASE p6 IF NOT EXISTS CHARACTER SET 'utf8';
USE p6;



CREATE TABLE IF NOT EXISTS Caissier(
    Nom VARCHAR(255) NOT NULL,
    Prénom VARCHAR(255) NOT NULL,
    Numéro_Utilisateur INTEGER(10) ZEROFILL,
    PRIMARY KEY (Numéro_Utilisateur)
)
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Livreur(
    Nom VARCHAR(255) NOT NULL,
    Prénom VARCHAR(255) NOT NULL,
    Numéro_Utilisateur INTEGER(10) ZEROFILL,
    PRIMARY KEY (Numéro_Utilisateur)
)
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Pizzaïolo(
    Nom VARCHAR(255) NOT NULL,
    Prénom VARCHAR(255) NOT NULL,
    Numéro_Utilisateur INTEGER(10) ZEROFILL,
    PRIMARY KEY (Numéro_Utilisateur)
)
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Client(
    Nom VARCHAR(255) NOT NULL,
    Prénom VARCHAR(255) NOT NULL,
    Numéro_Utilisateur INTEGER(10) ZEROFILL,
    PRIMARY KEY (Numéro_Utilisateur)
)
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Information(
    Rue VARCHAR(255) NOT NULL,
    Ville VARCHAR (255) NOT NULL,
    Code_Postal SMALLINT (5) NOT NULL,
    Information_Complémentaire VARCHAR (255) NOT NULL,
    Adresse_Email VARCHAR(255) NOT NULL,
    Numero_Utilisateur INTEGER(10) ZEROFILL,
    Id SMALLINT(10) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Id)
    CONSTRAINT fk_numero_utilisateur
    FOREIGN KEY (Numero_Utilisateur)
    REFERENCES Client(Numéro_Utilisateur)
)
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Commande(
    Date_Time DATETIME NOT NULL,
    Etat_Paiement VARCHAR(6),
    Statut_Commande VARCHAR(20),
    Numéro_De_Commande INTEGER(10) ZEROFILL NOT NULL AUTO_INCREMENT,
    Livreur_Numéro_Utilisateur INTEGER(10),
    Client_Numéro_Utilisateur INTEGER(10),
    Caissier_Numéro_Utilisateur INTEGER(10),
    Pizzaïolo_Numéro_Utilisateur INTEGER(10),
    PRIMARY KEY (Numéro_De_Commande)
    CONSTRAINT fk_Livreur_Numéro_Utilisateur
    FOREIGN KEY (Livreur_Numéro_Utilisateur)
    REFERENCES Livreur(Numéro_Utilisateur)
    CONSTRAINT fk_Client_Numéro_Utilisateur
    FOREIGN KEY (Client_Numéro_Utilisateur)
    REFERENCES Client(Numéro_Utilisateur)
    CONSTRAINT fk_Caissier_Numéro_Utilisateur
    FOREIGN KEY (Caissier_Numéro_Utilisateur)
    REFERENCES Caissier(Numéro_Utilisateur)
    CONSTRAINT fk_Pizzaïolo_Numéro_Utilisateur
    FOREIGN KEY (Pizzaïolo_Numéro_Utilisateur)
    REFERENCES Pizzaïolo(Numéro_Utilisateur)
)
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Restaurant(
    Nom_Restaurant VARCHAR(255),
    Id INTEGER(10) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Id)
)
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Ingrédient(
    Nom VARCHAR(255),
    Description VARCHAR(255)
    Id INTEGER(10) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Id)
)
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Pizza(
    Nom VARCHAR(255),
    Statut VARCHAR(20),
    Recette VARCHAR(255),
    Id INTEGER(10) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Id)
)
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Pizza_Commande(
    Quantité INTEGER(10),
    Date DATETIME,
    Pizza_Id INTEGER(10),
    Commande_Numéro_De_Commande INTEGER(10),
    CONSTRAINT fk_Pizza_Id
    FOREIGN KEY (Pizza_Id)
    REFERENCES Pizza(Id)
    CONSTRAINT fk_Commande_Numéro_De_Commande
    FOREIGN KEY (Commande_Numéro_De_Commande)
    REFERENCES Commande(Numéro_De_Commande)
)
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Pizza_Restaurant(
    Pizza_Id INTEGER(10),
    Restaurant_Id INTEGER(10)
    CONSTRAINT fk_Pizza_Id
    FOREIGN KEY (Pizza_Id)
    REFERENCES Pizza(Id)
    CONSTRAINT fk_Restaurant_Id
    FOREIGN KEY (Restaurant_Id)
    REFERENCES Restaurant(Id)
)
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Ingrédient_Restaurant(
    Quantité INTEGER(10),
    Date DATETIME,
    Ingrédient_Id INTEGER(10),
    Restaurant_Id INTEGER(10),
    CONSTRAINT fk_Ingrédient_Id
    FOREIGN KEY (Ingrédient_Id)
    REFERENCES Ingrédient(Id)
    CONSTRAINT fk_Restaurant_Id
    FOREIGN KEY (Restaurant_Id)
    REFERENCES Restaurant(Id)
)
ENGINE = INNODB;

CREATE TABLE IF EXISTS Pizza_Ingrédient(
    Pizza_Id INTEGER(10),
    Ingrédient_Id INTEGER(10),
    CONSTRAINT fk_Pizza_Id
    FOREIGN KEY (Pizza_Id)
    REFERENCES Pizza(Id)
    CONSTRAINT fk_Ingrédient_Id
    FOREIGN KEY (Ingrédient_Id)
    REFERENCES Ingrédient(Id)
)
ENGINE = INNODB;
