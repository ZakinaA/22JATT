<%-- 
    Document   : ajouter
    Created on : 26 sept. 2022, 13:41:07
    Author     : sio2
--%>

<%@page import="model.Statut"%>
<%@page import="model.Instrument"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form class="form-inline" action="ajouter" method="POST">
            <label for="nomInput">Nom : </label>
            <input id="nomInput" type="text" name="nom"  size="70" maxlength="70">
            <span style="color: blue;">${form.erreurs['nom']}</span>
            <br><br>
            <label for="prenomInput">Prenom : </label>
            <input id="prenomInput" type="text" name="prenom"  size="70" maxlength="70">
            <span style="color: blue;">${form.erreurs['prenom']}</span>
            <br><br>
            <label for="genre">Instrument principal : </label>
            <select name="instrumentPrincipalID">
                <%
                    ArrayList<Instrument> lesInstruments = (ArrayList)request.getAttribute("pLesInstruments");
                    for (int i=0; i<lesInstruments.size();i++){
                        Instrument ins = lesInstruments.get(i);
                        out.println("<option value='" + ins.getId()+"'>" + ins.getLibelle()+"</option>" );
                    }
                %>
            </select>
            <br><br>
            <label for="genre">Statut : </label>
            <select name="statutID">
                <%
                    ArrayList<Statut> lesStatuts = (ArrayList)request.getAttribute("pLesStatuts");
                    for (int i=0; i<lesStatuts.size();i++){
                        Statut statut = lesStatuts.get(i);
                        out.println("<option value='" + statut.getId()+"'>" + statut.getLibelleStatut()+"</option>" );
                    }
                %>
            </select>
            <br><br>
            <input type="submit" name="valider" id="valider" value="Valider"/>
        </form>    
    </body>
</html>
