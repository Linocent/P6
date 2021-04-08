INSERT INTO utilisateur(nom, prenom)
    VALUES('Livreur', 'numero 1'),
           ('Caissier', 'numero 1'),
           ('Pizzaiolo', 'numero 1'),
           ('Client1', 'numero 1'),
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

INSERT INTO information(rue, ville, code_postal, information_complementaire, adresse_email, identifiant)
    VALUES('rue 1', 'Ville 1', '01', 'information 1', 'email 1', '1'),
           ('rue 1', 'Ville 2', '02', 'information 2', 'email 2', '1'),
           ('rue 1', 'Ville 3', '03', 'information 3', 'email 3', '1');

INSERT INTO pizza (nom, recette, statut)
    VALUES('Pizza_1', 'Recette Pizza_1', 'En stock'),
           ('Pizza_2', 'Recette Pizza_2', 'En stock'),
           ('Pizza_3', 'Recette Pizza_3', 'En stock'),
           ('Pizza_4', 'Recette Pizza_4', 'En stock');

INSERT INTO client (identifiant)
    VALUES('1'),
           ('2'),
           ('3');

INSERT INTO caissier (identifiant)
    VALUES('2'),
           ('8');

INSERT INTO livreur (identifiant)
    VALUES('1'),
           ('7');

INSERT INTO pizzaiolo (identifiant)
    VALUES('3'),
           ('9');

INSERT INTO commande (date_time, etat_paiement, statut_commande, client_numero_utilisateur)
    VALUES('2021-04-08 19:10:25', 'paye', 'en preparation', '1'),
           ('2021-04-08 19:10:25', 'impaye', 'en preparation', '2');

INSERT INTO commande (date_time, etat_paiement, statut_commande, caissier_numero_utilisateur)
    VALUES('2021-04-08 19:10:25', 'paye', 'en preparation', '2');