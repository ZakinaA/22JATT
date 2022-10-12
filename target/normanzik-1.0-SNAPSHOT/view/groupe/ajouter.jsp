<%@page import="model.Dispositif"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%@ page import="form.FormGroupe" %>
<%@ page import="model.Genre" %>
<%@ page import="java.util.ArrayList" %>
<%
    String pageID = "listesGroupes"; 
%>
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
  <style>
    body {
        background: #E3E0E0
    }

    .SpaceText {
        font-family: 'Space Grotesk', sans-serif;
    }

    
    .tipo {
            text-transform: uppercase;
            font-size: calc(1.375rem + 1.5vw);
            font-weight: 00;
            -webkit-text-stroke-width: 1.3px;
            -webkit-text-stroke-color: rgba(255, 255, 255, 0.9);
            color: transparent;
        }

@media (min-width: 1200px) {
  .tipo {
    font-size: 3.5rem;
  }
}
  </style>
  <body style="background-size: cover;-webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-image: url('https://github.com/ZakinaA/22JATT/blob/design/bg_nouvelle2.png?raw=true'); ">
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>
    
      <%
      //Client client=(Client)request.getAttribute("client");
      FormGroupe form = (FormGroupe)request.getAttribute("form");
  %>
      <section class="vh-100 bg-image"
      >
      <div class="mask d-flex align-items-center h-100 gradient-custom-3 ">
        <div class="container h-100 ">
          <div class="row d-flex justify-content-center align-items-center h-100"style="padding-top: 2em">
            <div class="col-12 col-md-9 col-lg-7 ">
              <div class="card" style="  ">
                <div class="card-body p-5">
                  <h2 class="text-uppercase text-center mb-5">Inscription des groupes</h2>
    
                  <form>
    
                    <div class="form-outline mb-4">
                      <label class="form-label" for="nom">Nom</label>
                      <input type="text" id="nom" class="form-control form-control-lg" />
                      <span style="color: blue;">${form.erreurs['nom']}</span>
                    </div>
    
                    <div class="form-outline mb-4">
                      <label class="form-label" for="dateCreation">Date de création</label>
                      <input type="date" id="dateCreation" class="form-control form-control-lg" />
                      <span style="color: blue;">${form.erreurs['dateCreation']}</span>
                    </div>
    
                    <div class="form-outline mb-4">
                      <label class="form-label" for="numTelInput">Téléphone</label>
                      <input type="text" id="numTelInput" class="form-control form-control-lg" />
                      <span style="color: blue;">${form.erreurs['numTel']}</span>
                    </div>

                    <div class="form-outline mb-4">
                      <label class="form-label" for="mailAddressInput">Mail / Site web</label>
                      <input type="mail" id="mailAddressInput" class="form-control form-control-lg" />
                      <span style="color: blue;">${form.erreurs['addressMail']}</span>
                    </div>
 <!--
                    <div class="form-outline mb-4">
                      <label class="form-label" for="form3Example4cg">Lieu de répétition</label>
                      <input type="text" id="form3Example4cg" class="form-control form-control-lg" />
                    </div>

                    comment
                    <div class="form-outline mb-4">
                      <label class="form-label" for="form3Example4cg">Dispositif</label> 
                    <select class="form-select" aria-label="Default select example">
                      <option selected>Open this select menu</option>
                      <option value="1">One</option>
                      <option value="2">Two</option>
                      <option value="3">Three</option>
                    </select>
                  
                  </div> -->

                  <div class="form-outline mb-4">
                    <label class="form-label" for="genre">Genre</label> 
                    <select class="form-select" aria-label="Default select example" name="idGenre">
                      <%
                      ArrayList<Genre> lesGenres = (ArrayList)request.getAttribute("pLesGenres");
                      for (int i=0; i<lesGenres.size();i++){
                          Genre g = lesGenres.get(i);
                          out.println("<option value='" + g.getId()+"'>" + g.getLibelle()+"</option>" );
                      }
                  %>
                    </select> 
                  </div>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="dispositifSelect">Membre Contact</label> 
                    <select class="form-select" aria-label="Default select example" name="dispositifID">
                      <%
                      ArrayList<Dispositif> lesDispositifsForm = (ArrayList)request.getAttribute("pLesDispositifsForm");
                      for (int dispositifOrder=0; dispositifOrder<lesDispositifsForm.size();dispositifOrder++){
                          Dispositif d = lesDispositifsForm.get(dispositifOrder);
                          out.println("<option value='" + d.getId()+"'>" + d.getLibelle()+"</option>" );
                      }
                  %>
                    </select>
                   </div>
                  
    
                    <div class="d-flex justify-content-center">
                      <button type="submit" name="valider" id="valider" value="Valider"
                        class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Enregistrer</button>
                    </div>
    
                    
    
                  </form>
    
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section >

      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              ...
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
          </div>
        </div>
      </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
  </body>
</html>