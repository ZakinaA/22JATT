<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Concert"%>
<%@ page import="java.util.ArrayList" %>
<%
    int cardOrder = 0;
    String pageName = "Liste des Concerts";
    String pageID = "listesConcerts"; 
    ArrayList<Concert> lesConcerts = (ArrayList)request.getAttribute("pLesConcert");    
    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd/MM/yyyy");          
    %>
    <%@ include file="../inclus/head.jsp" %>
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="card mt-4 shadow-sm mb-0"> 
            <table class="table table-striped mb-0">
                <thead>
                    <tr>
                        <th scope="col">Date</th>
                        <th scope="col">Ville</th>
                        <th scope="col">Code Postal</th>
                        <th scope="col">Nom de la salle</th>
                        <th scope="col">Nom du groupe</th>
                    </tr>
                </thead>        
                <tbody>
                    <%
                        for (Concert unConcert : lesConcerts) {          
                            LocalDate date = LocalDate.parse(unConcert.getDateConcert());        
                            String formattedDate = date.format(myFormatObj);  
                    %>
                    <tr>                    
                        <td class="align-middle"><% out.print(formattedDate); %></td>
                        <td class="align-middle"><% out.print(unConcert.getLieuConcertId().getVille()); %> </td>
                        <td class="align-middle"><% out.print(unConcert.getLieuConcertId().getCp()); %> </td>
                        <td class="align-middle"><% out.print(unConcert.getLieuConcertId().getSalleNom()); %> </td>
                        <td class="align-middle"><% out.print(unConcert.getGroupeConcertId().getNom()); %> </td>
                    </tr>
                    <% } %>
                </tbody>     
            </table>
        </div>
    </div>    
        
        
            

