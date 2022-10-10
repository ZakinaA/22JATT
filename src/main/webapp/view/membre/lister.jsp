<%@page import="model.Membre"%>
<%@page import="java.util.ArrayList"%>
<%
    String pageName = "Liste des membres";
    String pageID = "listesMembres"; 
    ArrayList<Membre> lesMembres = (ArrayList)request.getAttribute("pLesMembres");
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
                            for (Membre unMembre : lesMembres) {     
                                String firstName = unMembre.getNom().toUpperCase();
                        %>
                        <tr class="align-middle">
                            <td class="align-middle"><% out.print(firstName); %> <% out.print(unMembre.getPrenom()); %></td>
                            <td class="align-middle"><% out.println(unMembre.getStatutMembre().getLibelleStatut()); %></td>
                            <td class="align-middle text-end"><a class="btn text-white btnHover rounded-pill btn-sm" href="/normanzik/ServletMembre/consulter?idMembre=<% out.print(unMembre.getId()); %>" style="background: #FD841F;text-transform: uppercase; text-align: center">VOIR LE PROFIL</a></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>  
            </div>
        </div>
    </div>
    <%@ include file="../inclus/footer.jsp" %>
