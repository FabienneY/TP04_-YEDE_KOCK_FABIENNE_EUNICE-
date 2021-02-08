<%-- 
    Document   : newAccount
    Created on : 5 févr. 2021, 20:10:58
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Formulaire d'enregistrement de comptes</h1>
        <form action="servlet" method="post">
                Nom : <input type="text" name="nom"/><br>
                Prénom : <input type="text" name="prenom"/><br>
                Numero de compte : <input type="text" name="compte"/><br>
                Balance : <input type="text" name="balance"/><br>
                <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->
                <input type="hidden" name="action" value="createAccount"/>
                <input type="submit" value="Créer le compte" name="submit"/>
            </form>
    </body>
</html>
