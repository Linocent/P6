INSERT INTO Pizza (nom, recette)
    VALUES('Pizza_1', 'Recette Pizza_1'),
           ('Pizza_2', 'Recette Pizza_2'),
           ('Pizza_3', 'Recette Pizza_3'),
           ('Pizza_4', 'Recette Pizza_4');

INSERT INTO Livreur(nom, prenom)
    VALUES('Livreur', 'numero 1');

INSERT INTO Caissier(nom, prenom)
    VALUES('Caissier', 'numero 1');

INSERT INTO Pizzaiolo(nom, prenom)
    VALUES('Pizzaiolo', 'numero 1');

INSERT INTO Client(nom, prenom)
    VALUES('Client1', 'numero 1'),
           ('Client2', 'numero 2'),
           ('Client3', 'numero 3');

INSERT INTO Restaurant(nom_restaurant)
    VALUES('Restaurant 1'),
           ('Restaurant 2'),
           ('Restaurant 3');

INSERT INTO Ingredient(nom, description)
    VALUES('Ingrédient 1', 'Description 1'),
           ('Ingrédient 2', 'Description 2'),
           ('Ingrédient 3', 'Description 3');

INSERT INTO Information(rue, ville, code_postal, information_complementaire, adresse_email, numero_utilisateur)
    VALUES('rue 1', 'Ville 1', 'code postal 1', 'information 1', 'email 1', Client.Numero_Utilisateur(Client1)),
           ('rue 1', 'Ville 2', 'code postal 2', 'information 2', 'email 2', Client.Numero_Utilisateur(Client2)),
           ('rue 1', 'Ville 3', 'code postal 3', 'information 3', 'email 3', Client.Numero_Utilisateur(Client3));