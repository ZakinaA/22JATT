<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Festival"%>
<%@ page import="form.FormFestival" %>
<%@ page import="model.Groupe" %>
<%@ page import="java.util.ArrayList" %>
<%
    String pageName = "Création d'un festival";
    String pageID = "creerFestival"; 
%>

    <%@ include file="../inclus/head.jsp" %>
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>
    
      <%
      //Client client=(Client)request.getAttribute("client");
      FormFestival form = (FormFestival)request.getAttribute("form");
  %>
      <section class="vh-100 bg-image"
      >
      <div class="mask d-flex align-items-center h-100 gradient-custom-3 ">
        <div class="container h-100 ">
          <div class="row d-flex justify-content-center align-items-center h-100"style="padding-top: 2em">
            <div class="col-12 col-md-9 col-lg-7 ">
              <div class="card" style="  ">
                <div class="card-body p-5">
                  <h2 class="text-uppercase text-center mb-5">Nouveau festival</h2>
                      <form class="form-inline" action="ajouter" method="POST">    
                    <div class="form-outline mb-4">
                      <label class="form-label" for="nom">Nom du festival :</label>
                      <input type="text" id="nom" name="nom" class="form-control form-control-lg" />
                      <span style="color: blue;">${form.erreurs['nom']}</span>
                    </div>
    
                    <div class="form-outline mb-4">
                      <label class="form-label" for="dateCreation">Date de début :</label>
                      <input type="date" id="dateDebut" name="dateDebut" class="form-control form-control-lg" />
                      <span style="color: blue;">${form.erreurs['dateCreation']}</span>
                    </div>
    
                    <div class="form-outline mb-4">
                      <label class="form-label" for="numTelInput">Date de Fin :</label>
                      <input type="date" id="dateFin" name="dateFin" class="form-control form-control-lg" />
                      <span style="color: blue;">${form.erreurs['numTel']}</span>
                    </div>
            
                    
                       <div class="mb-3">
                    <label for="genre" class="form-label">Tete d'affiche : </label>
                    <select id="instrumentPrincipalID" name="instrumentPrincipalID" class="form-select" onchange="selectInstrumentPrincipal()">
                    <%
                        ArrayList<Groupe> lesGroupes = (ArrayList)request.getAttribute("pLesGroupes");
                        for (int i=0; i<lesGroupes.size();i++){
                            Groupe ins = lesGroupes.get(i);
                            out.println("<option value='" + ins.getId()+"'>" + ins.getNom()+"</option>" );
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

    <%@ include file="../inclus/footer.jsp" %>   