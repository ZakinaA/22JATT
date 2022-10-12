<%-- 
    Document   : modifier
    Created on : 10 oct. 2022, 13:03:39
    Author     : sio2
--%>
<%@page import="model.Statut"%>
<%@page import="model.Instrument"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pageName = "Modification d'un membre ";
    String pageID = "ModificationMembre"; 
%> 
    <%@ include file="../inclus/head.jsp" %>
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>

     <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="card card-body mt-4 shadow-sm">
            
            <form class="form-inline" action="ajouter" method="POST">
                <h3>Création d'un compte membre</h3>
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
                    <select id="instrumentPrincipalID" name="instrumentPrincipalID" class="form-select" onchange="selectInstrumentPrincipal()">
                    
                    <option value="instrumentNotExist">Ajouter un instrument</option>
                    </select>
                </div>
                <div class="mb-3">                    
                    <label for="genre" class="form-label">Statut : </label>
                    <select name="statutID" class="form-select">
                       
                    </select>
                </div>
                <div class="mb-3">
                    <label for="formFile" class="form-label">Téleversement d'une image de profil</label>
                    <input class="form-control" type="file" id="formFile">
                </div>
                <button type="submit" class="btn btn-light float-end">Valider mon inscription</button>  
            </form> 
          
        </div>
        <%@ include file="../inclus/footer.jsp" %>            
    </body>
</html>

