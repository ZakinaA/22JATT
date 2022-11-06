<%@page import="model.Membre"%>
<%@page import="model.Dispositif"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%@ page import="form.FormGroupe" %>
<%@ page import="model.Genre" %>
<%@ page import="java.util.ArrayList" %>
<%
    String pageName = "Création d'un groupe";
    String pageID = "creerGroupe"; 
    ArrayList<Membre> lesMembresDisponible = (ArrayList)request.getAttribute("pLesMembres");
%>

    <%@ include file="../inclus/head.jsp" %>
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
                      <form class="form-inline" action="ajouter" method="POST">    
                    <div class="form-outline mb-4">
                      <label class="form-label" for="nom">Nom</label>
                      <input type="text" id="nom" name="nom" class="form-control form-control-lg" />
                      <span style="color: blue;">${form.erreurs['nom']}</span>
                    </div>
    
                    <div class="form-outline mb-4">
                      <label class="form-label" for="dateCreation">Date de création</label>
                      <input type="date" id="dateCreation" name="dateCreation" class="form-control form-control-lg" />
                      <span style="color: blue;">${form.erreurs['dateCreation']}</span>
                    </div>
    
                    <div class="form-outline mb-4">
                      <label class="form-label" for="numTelInput">Téléphone</label>
                      <input type="text" id="numTelInput" name="numTel" class="form-control form-control-lg" />
                      <span style="color: blue;">${form.erreurs['numTel']}</span>
                    </div>

                    <div class="form-outline mb-4">
                      <label class="form-label" for="mailAddressInput">Mail / Site web</label>
                      <input type="mail" id="mailAddressInput" name="mailAddress" class="form-control form-control-lg" />
                      <span style="color: blue;">${form.erreurs['addressMail']}</span>
                    </div>
                    <div class="form-outline mb-4">
                      <label class="form-label" for="lieuRepetitionInput">Lieu de répétion</label>
                      <input type="text" id="lieuRepetitionInput" name="lieuRepetition" class="form-control form-control-lg" />
                      <span style="color: blue;">${form.erreurs['lieuRepetition']}</span>
                    </div>
                    <div class="form-outline mb-4">
                      <label class="form-label" for="genre">Genre</label> 
                      <select class="form-select" name="idGenre">
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
                      <label class="form-label" for="selectMembreContact">Membre Contact</label> 
                      <select class="form-select" id="selectMembreContact" name="membreContactID">
                        <%                        
                        for (Membre unMembre : lesMembresDisponible) {  
                            out.print("<option value='" + unMembre.getId()+"'>" + unMembre.getPrenom()+ " " + unMembre.getNom()+ "</option>" );
                        }
                    %>
                      </select> 
                    </div>      
  

                       
    
                    <div class="d-flex justify-content-center">
                      <button type="submit" name="valider" id="valider" value="Valider"
                        class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Enregistrer</button>
                    </div>
    
                    
                    <input type="hidden" name="formType" value="0">
                  </form>
    
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </section >

    <%@ include file="../inclus/footer.jsp" %>   

