INSERT INTO pizza (nom, recette)
    VALUES('Pizza_1', 'Recette Pizza_1'),
           ('Pizza_2', 'Recette Pizza_2'),
           ('Pizza_3', 'Recette Pizza_3'),
           ('Pizza_4', 'Recette Pizza_4');

INSERT INTO livreur(nom, prenom)
    VALUES('Livreur', 'numero 1');

INSERT INTO caissier(nom, prenom)
    VALUES('Caissier', 'numero 1');

INSERT INTO pizzaiolo(nom, prenom)
    VALUES('Pizzaiolo', 'numero 1');

INSERT INTO client(nom, prenom)
    VALUES('Client1', 'numero 1'),
           ('Client2', 'numero 2'),
           ('Client3', 'numero 3');

INSERT INTO restaurant(nom_restaurant)
    VALUES('Restaurant 1'),
           ('Restaurant 2'),
           ('Restaurant 3');

INSERT INTO ingredient(nom, description)
    VALUES('Ingrédient 1', 'Description 1'),
           ('Ingrédient 2', 'Description 2'),
           ('Ingrédient 3', 'Description 3');

INSERT INTO information(rue, ville, code_postal, information_complementaire, adresse_email, numero_utilisateur)
    VALUES('rue 1', 'Ville 1', 'code postal 1', 'information 1', 'email 1',
           (SELECT numero_utilisateur FROM client WHERE nom=Client1)),
           ('rue 1', 'Ville 2', 'code postal 2', 'information 2', 'email 2',
           (SELECT numero_utilisateur FROM client WHERE nom=Client2)),
           ('rue 1', 'Ville 3', 'code postal 3', 'information 3', 'email 3',
           (SELECT numero_utilisateur FROM client WHERE nom=Client3));