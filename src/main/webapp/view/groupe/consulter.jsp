<%@page import="model.Membre"%>
<%@page import="model.Titre"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%
    Groupe unGroupe = (Groupe)request.getAttribute("pGroupe");
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
    <div class="card mb-0 SpaceText tipo rounded-0 border-0" style="font-size: 2em;height: 3em;background-color: #FD841F; text-transform: uppercase; "><div style="margin-top: 1.3%; padding-left: 3em;">Norman'Zik</div></div>
    <nav class="navbar navbar-expand-lg bg-light shadow-sm">
      <div class="container-fluid">
        <button class="navbar-toggler border-0 w-100 rounded-0 text-dark" style="color: #000" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fa-solid fa-down-left-and-up-right-to-center"></i>
      </button>
        <div class="collapse navbar-collapse" id="navbarMain">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Accueil</a>
            </li>
          </ul>
          <div class="btn-group">
            <button type="button" class="btn border-0 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              Accès organisation
            </button>
            <ul class="dropdown-menu dropdown-menu-end">
              <li><button class="dropdown-item" type="button">Management des concerts</button></li>
              <li><button class="dropdown-item" type="button">Management des festivales</button></li>
              <li><button class="dropdown-item" type="button">Management des groupes</button></li>
            </ul>
          </div>
          <!--<button type="button" class="btn ml-2 btn-light border rounded-pill btnConnexion" data-bs-toggle="modal" data-bs-target="#exampleModal">Connexion</button>-->
        </div>
      </div>
    </nav>
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
                        <td><% out.println(unGroupe.getMembreContact().getPrenom()); %> <% out.println(unGroupe.getMembreContact().getNom()); %></td>
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



</body>
</html>