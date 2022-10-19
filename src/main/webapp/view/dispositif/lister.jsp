<%-- 
    Document   : lister
    Created on : 21 sept. 2022, 08:39:33
    Author     : sio2
--%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.Dispositif"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Dispositif> lesDispositif = (ArrayList)request.getAttribute("pLesDispositif");    
    String pageName = "Consulter les dispositifs";
    String pageID = "listesDispositifs"; 
    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy");  
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ include file="../inclus/head.jsp" %>  
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>     
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1"> 
        <div class="card mt-4 shadow-sm mb-0"> 
            <div class="table-responsive mb-0">
                <table class="table table-striped mb-0">
                    <thead>
                        <tr>
                            <th scope="col">Nom</th>
                            <th scope="col">Annee</th>
                        </tr>
                    </thead>
                    <tbody>   
                        <%
                            for (Dispositif unDispositif : lesDispositif) { 
                                LocalDate dateDispositif = LocalDate.parse(unDispositif.getAnnee());        
                                String stringDateDispositif = dateDispositif.format(myFormatObj);  
                        %>
                        <tr>
                            <td><% out.print("<a href='"+getServletContext().getContextPath()+"/ServletDispositif/lister-groupe?idDispositif="+unDispositif.getId()+"' class='text-decoration-none'>");%><% out.println(unDispositif.getLibelle()); %></td>
                            <td><% out.print(stringDateDispositif); %></td>
                        </tr>
                        <% }%>
                    </tbody>  
                </table>
            </div>
        </div>
    </div>
    <%@ include file="../inclus/footer.jsp" %>
