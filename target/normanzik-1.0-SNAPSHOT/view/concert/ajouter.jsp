<%@page import="model.LieuConcert"%>
<%@page import="model.Groupe"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Concert"%>
<%@ page import="java.util.ArrayList" %>
<%
    int cardOrder = 0;
    String pageName = "Liste des Concerts";
    String pageID = "listesConcerts"; 
   ArrayList<Concert> lesConcerts = (ArrayList)request.getAttribute("pLesConcert");    
    %>
    <%@ include file="../inclus/head.jsp" %>
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>
    <body>
        
        
          <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="card card-body mt-4 shadow-sm">
            
            <form class="form-inline" action="ajouter" method="POST">
                <h3>Création d'un concert</h3>
                <div class="mb-3">
                    <label for="nomInput" class="form-label">Date : </label>
                    <input id="nomInput" type="text" name="nom"  class="form-control">
                    <span style="color: blue;">${form.erreurs['nom']}</span>
                </div>
                <div class="mb-3">
                    <label for="prenomInput" class="form-label">Heure Debut : </label>
                    <input id="prenomInput" type="text" name="prenom"  size="70" maxlength="70" class="form-control">
                    <span style="color: blue;">${form.erreurs['prenom']}</span>     
                </div>
                <div class="mb-3">
                    <label for="prenomInput" class="form-label">Heure Fin : </label>
                    <input id="prenomInput" type="text" name="motdePasse"  size="70" maxlength="70" class="form-control">
                    <span style="color: blue;">${form.erreurs['motdePasse']}</span>     
                </div>
               
                <div class="mb-3">
                    <label for="genre" class="form-label">Groupe : </label>
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
                <div class="mb-3">                    
                    <label for="genre" class="form-label">Localisation : </label>
                    <select name="statutID" class="form-select">
                     <%
                        ArrayList<LieuConcert> lesLieuConcerts = (ArrayList)request.getAttribute("pLesLieuConcerts");
                        for (int i=0; i<lesLieuConcerts.size();i++){
                            LieuConcert lieuconcert = lesLieuConcerts.get(i);
                            out.println("<option value='" + lieuconcert.getId()+"'> Nom : " + lieuconcert.getNom()+"/ Ville : "+lieuconcert.getVille()+" / CP : "+lieuconcert.getCp()+"/ Nom de la salle : "+lieuconcert.getSalleNom()+"</option>" );
                        }
                    %>

                    </select>
                </div>
              
                <button type="submit" class="btn btn-light float-end">Ajout concert</button>  
            </form> 
                    
                    

                        
                  
        </div>