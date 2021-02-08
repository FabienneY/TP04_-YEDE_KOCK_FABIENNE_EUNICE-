<%-- 
    Document   : listAccount
    Created on : 5 févr. 2021, 20:11:29
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
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    </head>
    <body>
        <div>
        <center>
        <c:if test="${param['action'] == 'listeAccount'}" >
            <h1>Liste des comptes</h1>
<br><br>
            <table classe="table table-dark">
                <!-- La ligne de titre du tableau des comptes -->
                <tr>
                    <th scope="col">Nom</th>
                    <th scope="col">Prénom</th>
                    <th scope="col">Numéro de compte</th>
                   <th scope="col">Balance</th>
                </tr>
                

                <!-- Ici on affiche les lignes, une par utilisateur -->
                <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->
                <c:set var="total" value="0"/>

                <c:forEach var="u" items="${requestScope['listeDesAccount']}">
                    <tr>
                        <td>${u.firstName}</td>
                        <td>${u.lastName}</td>
                        <td>${u.accountNumber}</td>
                        <td>${u.balance}</td>
                        <!-- On compte le nombre de users -->
                        <c:set var="total" value="${total+1}"/>
                    </tr>
                </c:forEach>

                <!-- Affichage du solde total dans la dernière ligne du tableau -->
                <tr><td><b>TOTAL</b></td><td></td><td><b>${total}</b></td><td></td></tr>
            </table>

        </c:if>
            </center>
            </div>
    </body>
</html>
