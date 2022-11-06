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
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>   
                        <%
                            for (Dispositif unDispositif : lesDispositif) { 
                                LocalDate dateDispositif = LocalDate.parse(unDispositif.getAnnee());        
                                String stringDateDispositif = dateDispositif.format(myFormatObj);  
                        %>
                        <tr>
                            <td class="align-middle"><% out.print(unDispositif.getLibelle()); %></td>
                            <td class="align-middle"><% out.print(stringDateDispositif); %></td>
                            <td class="align-middle" style="width: 10%"> 
                                <a class="btn text-white btnHover rounded-pill btn-sm float-end border-0" href="<% out.print(getServletContext().getContextPath()); %>/ServletDispositif/lister-groupe?idDispositif=<% out.print(unDispositif.getId()); %>" style="background: #FD841F;text-transform: uppercase; text-align: center">VOIR LE PROFIL</a>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>  
                </table>
            </div>
        </div>
    </div>
    <%@ include file="../inclus/footer.jsp" %>
