<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%@ page import="java.util.ArrayList" %>
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
    <%
    ArrayList<Groupe> lesGroupes = (ArrayList)request.getAttribute("pLesGroupes");    
    %>
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
        <div class="row">
                        <%
                for (Groupe unGroupe : lesGroupes) {
                %>
        <div class="col-md-3">
          <div class="card mt-4">
            <div class="card-body">
              <h4 class="mb-0">
                <a href="/evenement/52/" class="text-decoration-none text-dark fw-bold mb-0">
                  <% out.println(unGroupe.getNom()); %>
                </a>
              </h4>                
              <div class="card bg-light mt-4 mb-2 shadow-none">
                <table class="table table-borderless mb-0 ">
                  <tbody>
                    <tr class="mb-0 align-middle">
                      <td class="align-middle fw-bold" style="width: 60%">
                        Membre Contact
                      </td>
                      <td class="align-middle fw-bold float-end text-end">
                        <h6 class="mb-0">
                          Lorem Ipsum
                        </h4>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

            <div class="card bg-light mt-4 mb-2 shadow-none">
              <table class="table table-borderless mb-0 ">
                <tbody>
                  <tr class="mb-0 align-middle">
                    <td class="align-middle fw-bold" style="width: 60%">
                      Date de création
                    </td>
                    <td class="align-middle fw-bold float-end text-end">
                      <h6 class="mb-0">
                        <% out.println(unGroupe.getDateCreation()); %>
                      </h6>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
           </div>
        </div>
      </div>  
         <% } %>
            
        </div>
    </div>





<!--<div class="container px-4 px-lg-5">
    <table  class="table table-bordered table-striped table-condensed">
        <thead>
        <tr>
            <th>Id</th>
            <th>Nom</th>
            <th>dateCreation</th>
            <th>Genre</th>
            <th>Numéro de téléphone</th>
            <th>Adresse mail</th>
            <th>Lieu de répétion</th>
            <th>Membre contact</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <%
                /*for (Groupe unGroupe : lesGroupes) {
                    out.println("<tr><td>");
                    out.println(unGroupe.getId());
                    out.println("</a></td>");

                    out.println("<td>");
                    out.println("<a href ='../ServletGroupe/consulter?idGroupe=" + unGroupe.getId() + "'>");
                    out.println(unGroupe.getNom());
                    out.println("</td>");

                    out.println("<td>");
                    out.println(unGroupe.getDateCreation());
                    out.println("</td>");

                    out.println("<td>");
                    out.println(unGroupe.getGenre().getLibelle());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println(unGroupe.getTelephone());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println(unGroupe.getMelSiteWeb());
                    out.println("</td>");     
                    
                    out.println("<td>");
                    out.println(unGroupe.getLieuRepetition());
                    out.println("</td>");

                }*/
            %>
        </tr>
        </tbody>
    </table>
</div>-->
</body>
</html>