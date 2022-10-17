<%@page import="model.Festival"%>
<%@page import="java.util.ArrayList"%>
<%
    String pageName = "Liste des festivals";
    String pageID = "listesFestivals"; 
    ArrayList<Festival> lesFestivals = (ArrayList)request.getAttribute("pLesFestivals");
%>
    <%@ include file="../inclus/head.jsp" %>  
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>     
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="card mt-4 shadow-sm"> 
            <div class="table-responsive">
                <table class="table table-striped mb-0">
                    <tbody>
                        <% 
                            for (Festival unFestival : lesFestivals) {                 
                        %>
                        <tr class="align-middle">
                            <td class="align-middle"><% out.println(unFestival.getNom()); %></td>
                            <td class="align-middle"><% out.println(unFestival.getDateDebutFestival()); %></td>
                            <td class="align-middle"><% out.println(unFestival.getDateFinFestival()); %></td>
                            <td class="align-middle text-end"><a class="btn text-white rounded-pill btn-sm" href="<% out.print(getServletContext().getContextPath()); %>/ServletFestival/consulter?idFestival=<% out.print(unFestival.getId()); %>" style="background: #FD841F;text-transform: uppercase; text-align: center">VOIR PLUS</a></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>  
            </div>
            
        </div>
    </div>
    <%@ include file="../inclus/footer.jsp" %>