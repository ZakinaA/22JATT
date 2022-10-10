<%@page import="model.Festival"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.ArrayList"%>
<%
    String pageName = "Liste des festivals";
    String pageID = "listesFestivals"; 
    ArrayList<Festival> lesFestivals = (ArrayList)request.getAttribute("pLesMembres");
%>
    <%@ include file="../inclus/head.jsp" %>  
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>     
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="card mt-4 shadow-sm"> 
            <div class="table-responsive">
                <table class="table table-striped mb-0">
                    <tbody>
                        <tr class="align-middle">
                            <td class="align-middle">Test</td>
                            <td class="align-middle">Test2</td>
                        </tr>
                    </tbody>
                </table>  
            </div>
        </div>
    </div>
    <%@ include file="../inclus/footer.jsp" %>