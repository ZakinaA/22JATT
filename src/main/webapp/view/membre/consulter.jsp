<%@page import="model.Membre"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
</head>
<body>
    <%
    Membre leMembre = (Membre)request.getAttribute("pMembre");
    %>
    <h1>Consulter Membre</h1>
    <br/>
    <h3><% out.println(leMembre.getPrenom()); %> <% out.println(leMembre.getNom()); %></h3>
    
    </body>
</html>
