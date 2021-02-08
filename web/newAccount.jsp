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
        <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
    </head>
    <body>
        <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading"></div>
                <div class="card-body">
        <h3>Formulaire d'enregistrement de comptes</h3>
        <br><br>
        <form action="servlet" method="post">
                 <div class="input-group"> Nom : <input class="input--style-1" type="text" name="nom"/></div><br>
                <div class="input-group"> Prénom : <input type="text" name="prenom"/></div><br>
                <div class="input-group"> Numero de compte : <input type="text" name="compte"/></div><br>
                <div class="input-group"> Balance : <input type="text" name="balance"/></div><br>
                <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->
                <input type="hidden" name="action" value="createAccount"/>
                <div class="p-t-20"> <input class="btn btn--radius btn--green" type="submit" value="Créer le compte" name="submit"/></div>
            </form>
        </div>
            </div>
        </div>
    </div>
         <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
    </body>
</html>
