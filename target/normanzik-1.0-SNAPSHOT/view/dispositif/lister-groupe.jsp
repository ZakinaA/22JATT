<%-- 
    Document   : lister-groupe
    Created on : 21 sept. 2022, 08:44:02
    Author     : sio2
--%>

<%@page import="model.Groupe"%>
<%@page import="model.Dispositif"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Groupe> lesGroupesDispositif = (ArrayList)request.getAttribute("pLesGroupesDispositif");    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <div class="container px-4 px-lg-5">
        <table  class="table table-bordered table-striped table-condensed">
            <thead>
            <tr>
                <th>Nom du groupe</th>
            </tr>
            </thead>
            <tbody>
                <%
                for (Groupe unGroupe : lesGroupesDispositif) {
                    out.println("<tr><td>");
                    out.println(unGroupe.getNom());
                    out.println("</td></tr>");
                }
                %>
            </tbody>
        </table>
    </div>
              
    </body>
</html>
