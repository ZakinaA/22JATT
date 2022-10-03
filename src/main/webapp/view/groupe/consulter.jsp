<%@page import="model.Membre"%>
<%@page import="model.Titre"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>

<%
    String pageID = "consulterGroupe"; 
    Groupe unGroupe = (Groupe)request.getAttribute("pGroupe");
    Membre leMembreContact = (Membre)request.getAttribute("pMembreContact");
    ArrayList<Titre> lesTitres = (ArrayList) request.getAttribute("pTitreGroupe");    
    ArrayList<Membre> lesMembresGroupe = (ArrayList) request.getAttribute("pMembreGroupe");    
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
      <body class="body">
          

    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="card card-body border-0 shadow-sm py-5 mt-4">
            <h1 class="mb-0" style="margin-left: 3%;"><% out.println(unGroupe.getNom()); %></h1>
        </div>
        <div class="card mt-4">
            <table class="table table-striped mb-0">
                <tbody>
                    <tr>
                        <td>Lieu de répetition</td>
                        <td><% out.println(unGroupe.getLieuRepetition()); %></td>
                    </tr>
                    <tr>
                        <td>Membre Contact</td>
                        <td><% out.println(leMembreContact.getPrenom()); %> <% out.println(leMembreContact.getNom()); %></td>
                    </tr>
                    <tr>
                        <td>Date de création</td>
                        <td><% out.println(unGroupe.getDateCreation()); %></td>
                    </tr>
                    <tr>
                        <td>Prochain concert</td>
                        <td>Non renseigné</td>
                    </tr>
                </tbody>
            </table>
        </div>
         <h4 class="mt-4">Les membres</h4>
         <table class="table table-striped">
             <thead class="bg-light">
             <th>Nom du membre</th>
         </thead>
         <tbody>
             <%
    for (Membre unMembre : lesMembresGroupe) {
        out.println("<tr><td><a href='../ServletMembre/consulter?idMembre="+unMembre.getId()+"'>");
        out.println(unMembre.getPrenom());
        out.println(""); 
        out.println(unMembre.getNom());
        out.println("</a></td></tr>");     
    }
    %>    
    </tbody>
</table>
        <h4 class="mt-4">Les titres</h4> 
        <table class="table table-striped">
    <thead class="bg-light">
        <th>Nom du titre</th>
        <th>Durée du titre</th>
    </thead>
    <tbody>
    <%
    for (Titre unTitre : lesTitres) {
        out.println("<tr><td>");
        out.println(unTitre.getIntitule());
        out.println("</td><td>"); 
        out.println(unTitre.getDuree());
        out.println("</td></tr>");     
    }
    %>
    </tbody>
</table>
    </div>
<br/>
    <%@ include file="../inclus/footer.jsp" %>
  

</body>
</html>