<%-- 
    Document   : lister
    Created on : 21 sept. 2022, 08:39:33
    Author     : sio2
--%>
<%@page import="model.Dispositif"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Dispositif> lesDispositif = (ArrayList)request.getAttribute("pLesDispositif");    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
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
<body>
<body class="body">
    <div class="card mb-0 SpaceText tipo rounded-0 border-0" style="font-size: 2em;height: 3em;background-color: #FD841F; text-transform: uppercase; "><div style="margin-top: 1.3%; padding-left: 3em;"><img src="http://185.163.126.183/2JATT/libs/images/Logo_Normazk.png" width="60">Norman'Zik</div></div>
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
   
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nom</th>
      <th scope="col">Annee</th>
    </tr>
  </thead>
  <tbody>   
    <%
                for (Dispositif unDispositif : lesDispositif) { %>
    <tr>
      <th scope="row"><% out.println(unDispositif.getId()); %> </th>
      <td><% out.println("<a href='../ServletDispositif/lister-groupe?idDispositif="+unDispositif.getId()+"'>");%><% out.println(unDispositif.getLibelle()); %></td>
      <td><% out.println(unDispositif.getAnnee()); %></td>
    </tr>
    <% }%>
  </tbody>  
</table>
    </body>
</html>
