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
        fdd
          <%
            for (Concert unConcert : lesConcerts) {
            
        %>
       <div class="card card-body mt-4 shadow-sm"> 
           
            <% out.println(unConcert.getLieuConcertId()); %>
            <% out.println(unConcert.getDateConcert()); %>
        </div>
        
       
            <% } %>
    </body>
</html>
