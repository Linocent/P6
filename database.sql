# lancer le script: source C:/Cours/P6/database.sql;

CREATE DATABASE IF NOT EXISTS p6 CHARACTER SET 'utf8';
USE p6;



CREATE TABLE IF NOT EXISTS Caissier(
    Nom VARCHAR(255) NOT NULL,
    Prenom VARCHAR(255) NOT NULL,
    Numero_Utilisateur INTEGER(10) ZEROFILL NOT NULL,
    PRIMARY KEY (Numero_Utilisateur)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Livreur(
    Nom VARCHAR(255) NOT NULL,
    Prenom VARCHAR(255) NOT NULL,
    Numero_Utilisateur INTEGER(10) ZEROFILL NOT NULL,
    PRIMARY KEY (Numero_Utilisateur)
)
ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Pizzaiolo(
    Nom VARCHAR(255) NOT NULL,
    Prenom VARCHAR(255) NOT NULL,
    Numero_Utilisateur INTEGER(10) ZEROFILL NOT NULL,
    PRIMARY KEY (Numero_Utilisateur)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Client(
    Nom VARCHAR(255) NOT NULL,
    Prenom VARCHAR(255) NOT NULL,
    Numero_Utilisateur INTEGER(10) ZEROFILL NOT NULL,
    PRIMARY KEY (Numero_Utilisateur)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Information(
    Rue VARCHAR(255) NOT NULL,
    Ville VARCHAR (255) NOT NULL,
    Code_Postal SMALLINT (5) NOT NULL,
    Information_Complementaire VARCHAR (255) NOT NULL,
    Adresse_Email VARCHAR(255) NOT NULL,
    Numero_Utilisateur INTEGER(10) ZEROFILL,
    Id SMALLINT(10) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Id),
    CONSTRAINT fk_numero_utilisateur
        FOREIGN KEY (Numero_Utilisateur)
        REFERENCES Client(Numero_Utilisateur)
)
ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Commande(
    Date_Time DATETIME NOT NULL,
    Etat_Paiement VARCHAR(6),
    Statut_Commande VARCHAR(20),
    Numero_De_Commande INTEGER(10) ZEROFILL NOT NULL AUTO_INCREMENT,
    Livreur_Numero_Utilisateur INTEGER(10),
    Client_Numero_Utilisateur INTEGER(10),
    Caissier_Numero_Utilisateur INTEGER(10),
    Pizzaiolo_Numero_Utilisateur INTEGER(10),
    PRIMARY KEY (Numero_De_Commande),
    CONSTRAINT fk_Livreur_Numero_Utilisateur
        FOREIGN KEY (Livreur_Numero_Utilisateur)
        REFERENCES Livreur(Numero_Utilisateur),
    CONSTRAINT fk_Client_Numero_Utilisateur
        FOREIGN KEY (Client_Numero_Utilisateur)
        REFERENCES Client(Numero_Utilisateur),
    CONSTRAINT fk_Caissier_Numero_Utilisateur
        FOREIGN KEY (Caissier_Numero_Utilisateur)
        REFERENCES Caissier(Numero_Utilisateur),
    CONSTRAINT fk_Pizzaiolo_Numero_Utilisateur
        FOREIGN KEY (Pizzaiolo_Numero_Utilisateur)
        REFERENCES Pizzaiolo(Numero_Utilisateur)
)
ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Restaurant(
    Nom_Restaurant VARCHAR(255) NOT NULL,
    Id INTEGER(10) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Id)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Ingredient(
    Nom VARCHAR(255)NOT NULL,
    Description VARCHAR(255) NOT NULL,
    Id INTEGER(10) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Id)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Pizza(
    Nom VARCHAR(255) NOT NULL,
    Statut VARCHAR(20) NOT NULL,
    Recette VARCHAR(255) NOT NULL,
    Id INTEGER(10) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Id)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Pizza_Commande(
    Quantite INTEGER(10) NOT NULL,
    Date DATETIME,
    Pizza_Id INTEGER(10),
    Commande_Numero_De_Commande INTEGER(10),
    CONSTRAINT fk_Pizza_Id
        FOREIGN KEY (Pizza_Id)
        REFERENCES Pizza(Id),
    CONSTRAINT fk_Commande_Numero_De_Commande
        FOREIGN KEY (Commande_Numero_De_Commande)
        REFERENCES Commande(Numero_De_Commande)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Pizza_Restaurant(
    Pizza_Id INTEGER(10),
    Restaurant_Id INTEGER(10),
    CONSTRAINT fk_Pizza_Id
        FOREIGN KEY (Pizza_Id)
        REFERENCES Pizza(Id),
    CONSTRAINT fk_Restaurant_Id
        FOREIGN KEY (Restaurant_Id)
        REFERENCES Restaurant(Id)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Ingredient_Restaurant(
    Quantite INTEGER(10),
    Date DATETIME,
    Ingredient_Id INTEGER(10),
    Restaurant_Id INTEGER(10),
    CONSTRAINT fk_Ingredient_Id
        FOREIGN KEY (Ingredient_Id)
        REFERENCES Ingredient(Id),
    CONSTRAINT fk_Restaurant_Id
        FOREIGN KEY (Restaurant_Id)
        REFERENCES Restaurant(Id)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Pizza_Ingredient(
    Pizza_Id INTEGER(10),
    Ingredient_Id INTEGER(10),
    CONSTRAINT fk_Pizza_Id
        FOREIGN KEY (Pizza_Id)
        REFERENCES Pizza(Id),
    CONSTRAINT fk_Ingredient_Id
        FOREIGN KEY (Ingredient_Id)
        REFERENCES Ingredient(Id)
)
ENGINE = InnoDB;
