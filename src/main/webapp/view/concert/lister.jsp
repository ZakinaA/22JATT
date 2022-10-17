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
        
        
            
           <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Numéro Concert</th>  
      <th scope="col">Nom groupe</th>
      <th scope="col">Date</th>
      <th scope="col">Ville</th>
      <th scope="col">Code Postal</th>
      <th scope="col">Nom salle</th>
       <th scope="col">Nom du groupe</th>
       <th scope="col">Début</th>
       <th scope="col">Fin</th>
    </tr>
  </thead>
   <a class="btn btn-primary" href="/normanzik/ServletConcert/ajouter">Ajouter un concert </a>
    <%
            for (Concert unConcert : lesConcerts) {
            
        %>
  <tbody>
      
    <tr>
        
      <th scope="row"><% out.println(unConcert.getId()); %></th>
      <td><% out.println(unConcert.getGroupeConcertId().getNom()); %></td>
      <td> <% out.println(unConcert.getDateConcert()); %></td>
      <td> <% out.println(unConcert.getLieuConcertId().getVille()); %> </td>
      <td> <% out.println(unConcert.getLieuConcertId().getCp()); %> </td>
      <td> <% out.println(unConcert.getLieuConcertId().getSalleNom()); %> </td>
      <td> <% out.println(unConcert.getGroupeConcertId().getNom()); %> </td>
      <td><% out.println(unConcert.getHeureDebut()); %></td>
      <td><% out.println(unConcert.getHeureFin()); %></td>

    </tr>
   
    </tbody>
       
            <% } %>
    </body>
</html>
