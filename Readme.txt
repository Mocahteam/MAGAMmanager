This code is an HTML/PHP implementation of MAGAM : the Multi-Aspect Generic Adaptation Model.

This application was initially developped during a post-doc at LIP6, Paris.

How to install :
(1) Create a SQL database and load the content of the file mfa.sql to initialize the database.
(2) Edit the following files to connect the php code to your database with PDO.
 > propriete.php (line 13)
 > activite.php (line 13)
 > utilisateur.php (line 13)
 > valeur.php (line 13)
 > recommandation.php (line 13)
 > aide.php (line 13)
(3) Upload the php files on a server or a local server like Wamp