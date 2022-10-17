<%-- 
    Document   : lister
    Created on : 21 sept. 2022, 08:39:33
    Author     : sio2
--%>
<%@page import="model.Dispositif"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Dispositif> lesDispositif = (ArrayList)request.getAttribute("pLesDispositif");    
    String pageName = "Consulter les dispositifs";
    String pageID = "listesDispositifs"; 
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ include file="../inclus/head.jsp" %>  
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>     
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1"> 
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Annee</th>
                </tr>
            </thead>
            <tbody>   
                <%
                for (Dispositif unDispositif : lesDispositif) { %>
                <tr>
                    <th scope="row"><% out.println(unDispositif.getId()); %> </th>
                    <td><% out.println("<a href='"+getServletContext().getContextPath()+"/ServletDispositif/lister-groupe?idDispositif="+unDispositif.getId()+"'>");%><% out.println(unDispositif.getLibelle()); %></td>
                    <td><% out.println(unDispositif.getAnnee()); %></td>
                </tr>
                <% }%>
            </tbody>  
        </table>
    </div>
    <%@ include file="../inclus/footer.jsp" %>
