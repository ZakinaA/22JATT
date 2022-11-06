<%@page import="model.Membre"%>
<%@page import="model.Titre"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%
    String pageName = "Liste des groupes";
    String pageID = "groupeSection"; 
    Groupe unGroupe = (Groupe)request.getAttribute("pGroupe");
    Membre leMembreContact = (Membre)request.getAttribute("pMembreContact");
    ArrayList<Titre> lesTitres = (ArrayList) request.getAttribute("pTitreGroupe");    
    ArrayList<Membre> lesMembresGroupe = (ArrayList) request.getAttribute("pMembreGroupe");    
%>
    <%@ include file="../inclus/head.jsp" %>
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="card card-body border-0 shadow-sm py-5 mt-4" style="background-color: #FD841F;">
            <h1 class="mb-0" style="margin-left: 3%;"><% out.print(unGroupe.getNom()); %></h1>
        </div>
        <div class="card mt-4">
            <table class="table table-striped mb-0">
                <tbody>
                    <tr>
                        <td>Lieu de répetition</td>
                        <td><% out.print(unGroupe.getLieuRepetition()); %></td>
                    </tr>
                    <tr>
                        <td>Membre Contact</td>
                        <td><% out.print(leMembreContact.getPrenom()); %> <% out.println(leMembreContact.getNom()); %></td>
                    </tr>
                    <tr>
                        <td>Date de création</td>
                        <td><% out.print(unGroupe.getDateCreation()); %></td>
                    </tr>
                    <tr>
                        <td>Prochain concert</td>
                        <td>Non renseigné</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="row mt-2">
            <div class="col-md-4">
                <div class="card card-body shadow-sm mb-3 border-0 fw-bold"  style="background-color: #FD841F;">
                    <h4 class="mb-0 fw-bold">Les membres</h4>       
                </div>
            </div>
            <div class="col-md-8">
            </div>                  
        </div>             

         <table class="table table-striped">
             <thead class="bg-light">
             <th>Nom du membre</th>
         </thead>
         <tbody>
        <%
    for (Membre unMembre : lesMembresGroupe) {
        out.print("<tr><td><a href='"+getServletContext().getContextPath()+"/ServletMembre/consulter?idMembre="+unMembre.getId()+"' class='text-decoration-none'>"+unMembre.getPrenom()+" "+unMembre.getNom()+"</a></td></tr>");
 
    }
    %>    
    </tbody>
</table>
            <div class="row mt-2">
            <div class="col-md-4">
                <div class="card card-body shadow-sm mb-3 border-0 fw-bold"  style="background-color: #FD841F;">
                    <h4 class="mb-0 fw-bold">Les titres</h4>       
                </div>
            </div>
            <div class="col-md-8">
            </div>                  
        </div>      
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
    <%@ include file="../inclus/footer.jsp" %>