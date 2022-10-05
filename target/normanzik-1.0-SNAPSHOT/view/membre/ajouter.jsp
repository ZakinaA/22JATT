<%-- 
    Document   : ajouter
    Created on : 26 sept. 2022, 13:41:07
    Author     : sio2
--%>

<%@page import="model.Statut"%>
<%@page import="model.Instrument"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pageName = "Création d'un compte membre";
    String pageID = "inscriptionMembre"; 
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
                    <span style="color: blue;">${form.erreurs['motDePasse']}</span>     
                </div>
                <div class="mb-3">
                    <label for="prenomInput" class="form-label">Vérification du mot de passe : </label>
                    <input id="prenomInput" type="password" name="verifMotDePasse"  size="70" maxlength="70" class="form-control">
                    <span style="color: blue;">${form.erreurs['motDePasse']}</span>     
                </div>
                <div class="mb-3">
                    <label for="genre" class="form-label">Instrument principal : </label>
                    <select id="instrumentPrincipalID" name="instrumentPrincipalID" class="form-select" onchange="selectInstrumentPrincipal()">
                    <%
                        ArrayList<Instrument> lesInstruments = (ArrayList)request.getAttribute("pLesInstruments");
                        for (int i=0; i<lesInstruments.size();i++){
                            Instrument ins = lesInstruments.get(i);
                            out.println("<option value='" + ins.getId()+"'>" + ins.getLibelle()+"</option>" );
                        }
                    %>
                    <option value="instrumentNotExist">Ajouter un instrument</option>
                    </select>
                </div>
                <div class="mb-3">                    
                    <label for="genre" class="form-label">Statut : </label>
                    <select name="statutID" class="form-select">
                        <%
                            ArrayList<Statut> lesStatuts = (ArrayList)request.getAttribute("pLesStatuts");
                            for (int i=0; i<lesStatuts.size();i++){
                                Statut statut = lesStatuts.get(i);
                                out.println("<option value='" + statut.getId()+"'>" + statut.getLibelleStatut()+"</option>" );
                            }
                        %>
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

