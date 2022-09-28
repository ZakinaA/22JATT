<%-- 
    Document   : lister
    Created on : 21 sept. 2022, 08:39:33
    Author     : sio2
--%>
<%@page import="model.Dispositif"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Dispositif> lesDispositif = (ArrayList)request.getAttribute("pLesDispositif");    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <th>Nom du dispositif</th>
            </tr>
            </thead>
            <tbody>
                <%
                for (Dispositif unDispositif : lesDispositif) {
                    out.println("<tr><td><a href='../ServletDispositif/lister-groupe?idDispositif="+unDispositif.getId()+"'>");
                    out.println(unDispositif.getLibelle());
                    out.println("</a></td></tr>");
                }
                %>
            </tbody>
        </table>
    </div>
    </body>
</html>
