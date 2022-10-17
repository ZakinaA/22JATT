<%
    String pageName = "Liste des membres";
    String pageID = "listesMembres"; 
%>
    <%@ include file="../inclus/head.jsp" %>  
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>     
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="card card-body mt-4 shadow-sm"> 
            test
=======
        <div class="card mt-4 shadow-sm mb-0"> 
            <div class="table-responsive mb-0">
                <table class="table table-striped mb-0">
                    <tbody>
                        <%
                            for (Membre unMembre : lesMembres) {     
                                String firstName = unMembre.getNom().toUpperCase();
                        %>
                        <tr class="align-middle">
                            <td class="align-middle"><% out.print(firstName); %> <% out.print(unMembre.getPrenom()); %></td>
                            <td class="align-middle"><% out.println(unMembre.getStatutMembre().getLibelleStatut()); %></td>
                            <td class="align-middle text-end"><a class="btn text-white btnHover rounded-pill btn-sm" href="<% out.print(getServletContext().getContextPath()); %>/ServletMembre/consulter?idMembre=<% out.print(unMembre.getId()); %>" style="background: #FD841F;text-transform: uppercase; text-align: center">VOIR LE PROFIL</a></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>  
            </div>
        </div>
    </div>
    <%@ include file="../inclus/footer.jsp" %>
</body>
</html>