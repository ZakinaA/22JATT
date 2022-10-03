<%-- 
    Document   : ajouter
    Created on : 26 sept. 2022, 13:41:07
    Author     : sio2
--%>

<%@page import="model.Statut"%>
<%@page import="model.Instrument"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pageID = "inscriptionMembre"; 
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="http://185.163.126.183/2JATT/libs/css/NormanZikStyle.css" rel="stylesheet">
    <link href="http://185.163.126.183/2JATT/libs/css/bootstrap.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e43d5fbf75.js" crossorigin="anonymous"></script>
  </head>
<body class="body">        
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="card card-body mt-4 shadow-sm">
            
            <form class="form-inline" action="ajouter" method="POST">
                <h3>Création d'un espace membre</h3>
                <div class="mb-3">
                    <label for="nomInput" class="form-label">Nom : </label>
                    <input id="nomInput" type="text" name="nom"  class="form-control">
                    <span style="color: blue;">${form.erreurs['nom']}</span>
                </div>
                <div class="mb-3">
                    <label for="prenomInput" class="form-label">Prenom : </label>
                    <input id="prenomInput" type="text" name="prenom"  size="70" maxlength="70" class="form-control">
                    <span style="color: blue;">${form.erreurs['prenom']}</span>     
                </div>
                <div class="mb-3">
                    <label for="prenomInput" class="form-label">Mot de passe : </label>
                    <input id="prenomInput" type="password" name="motdePasse"  size="70" maxlength="70" class="form-control">
                    <span style="color: blue;">${form.erreurs['motdePasse']}</span>     
                </div>
                <div class="mb-3">
                    <label for="prenomInput" class="form-label">Vérification du mot de passe : </label>
                    <input id="prenomInput" type="password" name="verifMotDePasse"  size="70" maxlength="70" class="form-control">
                    <span style="color: blue;">${form.erreurs['verifMotDePasse']}</span>     
                </div>
                <div class="mb-3">
                    <label for="genre" class="form-label">Instrument principal : </label>
                    <select name="instrumentPrincipalID" class="form-select">
                    <%
                        ArrayList<Instrument> lesInstruments = (ArrayList)request.getAttribute("pLesInstruments");
                        for (int i=0; i<lesInstruments.size();i++){
                            Instrument ins = lesInstruments.get(i);
                            out.println("<option value='" + ins.getId()+"'>" + ins.getLibelle()+"</option>" );
                        }
                    %>
                    </select>
                </div>
                <div class="mb-3">                    
                    <label for="genre" class="form-label">Statut : </label>
                    <select name="statutID" class="form-select">
                        <%
                            ArrayList<Statut> lesStatuts = (ArrayList)request.getAttribute("pLesStatuts");
                            for (int i=0; i<lesStatuts.size();i++){
                                Statut statut = lesStatuts.get(i);
                                out.println("<option value='" + statut.getId()+"'>" + statut.getLibelleStatut()+"</option>" );
                            }
                        %>
                    </select>
                </div>
                <button type="submit" class="btn btn-light float-end">Valider mon inscription</button>  
            </form> 
        </div>   
    </body>
</html>
