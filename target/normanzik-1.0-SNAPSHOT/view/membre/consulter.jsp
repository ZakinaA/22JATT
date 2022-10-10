<%@page import="model.Membre"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%
    String pageID = "listesMembres"; 
%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="http://185.163.126.183/2JATT/libs/css/NormanZikStyle.css" rel="stylesheet">
    <link href="http://185.163.126.183/2JATT/libs/css/bootstrap.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e43d5fbf75.js" crossorigin="anonymous"></script>
  </head>
<body>
     <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>
    
      <style>
    body {
        background: #E3E0E0
    }

    .SpaceText {
        font-family: 'Space Grotesk', sans-serif;
    }

    
    .tipo {
            text-transform: uppercase;
            font-size: calc(1.375rem + 1.5vw);
            font-weight: 00;
            -webkit-text-stroke-width: 1.3px;
            -webkit-text-stroke-color: rgba(255, 255, 255, 0.9);
            color: transparent;
        }

@media (min-width: 1200px) {
  .tipo {
    font-size: 3.5rem;
  }
}
  </style>
  <%
    Membre leMembre = (Membre)request.getAttribute("pMembre");
    %>
   <body>

    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="card card-body border-0 shadow-sm py-5 mt-4">
            <h1 class="mb-0" style="margin-left: 3%;"><% out.println(leMembre.getPrenom()); %> <% out.println(leMembre.getNom()); %></h1>
            
            <p style="padding-top:2rem; padding-left: 2.85rem">Statut : <% out.println(leMembre.getStatutMembre()); %></p>
        </div>
        <h1 style="padding-top:2rem">Groupes</h1>
        <div class="card mt-4">
            <table class="table table-striped mb-0">
                <tbody>
                    <tr>
                        <td>Lieu de répetition</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Membre Contact </td>
                        <td></td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
        
         <h1 style="padding-top:2rem">Instrument principale</h1>
        <div class="card mt-4">
            <table class="table table-striped mb-0">
                <tbody>
                    <tr>
                        <td><% out.println(leMembre.getInstrumentPrincipal()); %></td>
                        <td></td>
                    </tr>
              </tbody>
            </table>
        </div>
         
         </thead>
         <tbody>
  
  
  
  
  
  

    </body>
</html>
