<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%@ page import="java.util.ArrayList" %>
<%
    int cardOrder = 0;
    String pageName = "Liste des groupes";
    String pageID = "groupeSection"; 
    ArrayList<Groupe> lesGroupes = (ArrayList)request.getAttribute("pLesGroupes");    
    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd/MM/yyyy");    
 
    %>
    <%@ include file="../inclus/head.jsp" %>
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>
    <div class="container-fluid mb-4" style="width: 85%;bottom: 0;top: 1">
        <div class="float-end">
            <a href="<%out.print(getServletContext().getContextPath()); %>/ServletGroupe/ajouter" class="btn mt-2 text-white w-100 btnHover" style="background: #FD841F;text-transform: uppercase; text-align: center">
                Créer un groupe
            </a>            
        </div>
                            
        <div class="row">
        <%
            for (Groupe unGroupe : lesGroupes) {
                String formattedDate = "Inconnu"; 
                if(unGroupe.getDateCreation() != null) {
                    LocalDate date = LocalDate.parse(unGroupe.getDateCreation());        
                    formattedDate = date.format(myFormatObj); 
                }
        %>
        <div class="col-md-3">
          <div class="card mt-4 testCard">
            <div class="card-body">
                <img src="<% out.print(getServletContext().getContextPath()); %>/libs/images/<% if(unGroupe.getAvatar() != null) { out.print(unGroupe.getAvatar()); } else { out.print("placeholder_default.png"); } %>" class="rounded img-fluid">
                <h4 class="mt-2">                  
                    <a href="<%out.print(getServletContext().getContextPath()); %>/ServletGroupe/consulter?idGroupe=<% out.print(unGroupe.getId()); %>" class="text-decoration-none text-dark fw-bold mb-0">
                      <% out.print(unGroupe.getNom()); %>
                    </a>
                </h4>             
                <!--<p class="mt-2">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                </p>-->
                <% if(unGroupe.getMembreContact().getPrenom() != "Null") { %>
                    <div class="card bg-light mt-4 mb-2 shadow-none">
                      <table class="table table-borderless mb-0 ">
                        <tbody>
                          <tr class="mb-0 align-middle">
                            <td class="align-middle fw-bold" style="width: 60%">
                              Membre Contact
                            </td>
                            <td class="align-middle fw-bold float-end text-end">
                              <h6 class="mb-0">
                                <% out.print(unGroupe.getMembreContact().getPrenom()); %> <% out.print(unGroupe.getMembreContact().getNom()); %>
                              </h4>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                <% } %>          

                <div class="card bg-light shadow-none">
                  <table class="table table-borderless mb-0 ">
                    <tbody>
                      <tr class="mb-0 align-middle">
                        <td class="align-middle fw-bold" style="width: 60%">
                          Date de création
                        </td>
                        <td class="align-middle fw-bold float-end text-end">
                          <h6 class="mb-0">
                            <% out.print(formattedDate); %>
                          </h6>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <a href="<%out.print(getServletContext().getContextPath()); %>/ServletGroupe/consulter?idGroupe=<% out.println(unGroupe.getId()); %>" class="btn mt-2 text-white w-100 btnHover" style="background: #FD841F;text-transform: uppercase; text-align: center">VOIR PLUS</a>          
                <% 
                if (NormanzikAuthID != null  && NormanzikAuthID != 0) { 
                    if(NormanzikGradeID == 2) {
                %>                
                    <a href="<%out.print(getServletContext().getContextPath()); %>/ServletGroupe/modifier?idGroupe=<% out.println(unGroupe.getId()); %>" class="btn btn-danger mt-2 text-dark w-100" style="text-transform: uppercase; text-align: center">Modifier le groupe</a>          
                <% }} %> 
                </div>
            </div>
        </div>  
        <% cardOrder++; } %>
            
        </div>
    </div>
    <%@ include file="../inclus/footer.jsp" %>