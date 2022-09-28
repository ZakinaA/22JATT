<%@page import="model.Membre"%>
<%@page import="model.Titre"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
</head>
<body>
<h1>Consulter Groupe</h1>
<br/>


<%
    Groupe unGroupe = (Groupe)request.getAttribute("pGroupe");
    ArrayList<Titre> lesTitres = (ArrayList) request.getAttribute("pTitreGroupe");    
    ArrayList<Membre> lesMembresGroupe = (ArrayList) request.getAttribute("pMembreGroupe");

    
%>
<h3><% out.println(unGroupe.getNom()); %></h3>
<p>Lieu de répetition : <% out.println(unGroupe.getLieuRepetition()); %></p>
<p>Membre contact : <% out.println(unGroupe.getMembreContact().getPrenom()); %> <% out.println(unGroupe.getMembreContact().getNom()); %></p>
<p>Date de création : <% out.println(unGroupe.getDateCreation()); %></p>

<h4>Liste des membres</h4>
<table>
    <thead>
        <th>Nom du membre</th>
    </thead>
    <tbody>
    <%
    for (Membre unMembre : lesMembresGroupe) {
        out.println("<tr><td><a href='../ServletMembre/consulter?idMembre="+unMembre.getId()+"'>");
        out.println(unMembre.getPrenom());
        out.println(""); 
        out.println(unMembre.getNom());
        out.println("</a></td></tr>");     
    }
    %>    
    </tbody>
</table>


<h4>Liste des titres</h4>
<table>
    <thead>
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
</body>
</html>