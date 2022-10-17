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
                <h3>Ajout d'un lieu</h3>
                <div class="mb-3">
                    <label for="dateInput" class="form-label">Nom : </label>
                    <input id="dateInput" type="text" name="date"  class="form-control">
                    <span style="color: blue;">${form.erreurs['nom']}</span>
                </div>
                <div class="mb-3">
                    <label for="HeureDInput" class="form-label">Ville : </label>
                    <input id="HeureDInput" type="text" name="HeureD"  size="70" maxlength="70" class="form-control">
                    <span style="color: blue;">${form.erreurs['prenom']}</span>     
                </div>
                <div class="mb-3">
                    <label for="HeureFInput" class="form-label">Code Postal : </label>
                    <input id="HeureFInput" type="text" name="HeureF"  size="70" maxlength="70" class="form-control">
                    <span style="color: blue;">${form.erreurs['motdePasse']}</span>     
                </div>
                
                 <div class="mb-3">
                    <label for="HeureFInput" class="form-label">Nom de la salle : </label>
                    <input id="HeureFInput" type="text" name="HeureF"  size="70" maxlength="70" class="form-control">
                    <span style="color: blue;">${form.erreurs['motdePasse']}</span>     
                </div>
               
             
             
                <button type="submit" class="btn btn-light float-end">Ajout lieu</button>  
            </form> 
                    
                    

                        
                  
        </div>