<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%@ page import="java.util.ArrayList" %>
<%
    String pageName = "Liste des groupes";
    String pageID = "listesGroupes"; 
    ArrayList<Groupe> lesGroupes = (ArrayList)request.getAttribute("pLesGroupes");    
    %>
    <%@ include file="../inclus/head.jsp" %>
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="row">
        <%
            for (Groupe unGroupe : lesGroupes) {
        %>
        <div class="col-md-3">
          <div class="card mt-4">
            <div class="card-body">
              <h4 class="mb-0">                  
                <a href="../ServletGroupe/consulter?idGroupe=<% out.println(unGroupe.getId()); %>"" class="text-decoration-none text-dark fw-bold mb-0">
                  <% out.println(unGroupe.getNom()); %>
                </a>
              </h4>                
              <div class="card bg-light mt-4 mb-2 shadow-none">
                <table class="table table-borderless mb-0 ">
                  <tbody>
                    <tr class="mb-0 align-middle">
                      <td class="align-middle fw-bold" style="width: 60%">
                        Membre Contact
                      </td>
                      <td class="align-middle fw-bold float-end text-end">
                        <h6 class="mb-0">
                          <% out.println(unGroupe.getMembreContact().getPrenom()); %> <% out.println(unGroupe.getMembreContact().getNom()); %>
                        </h4>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

            <div class="card bg-light mt-4 mb-2 shadow-none">
              <table class="table table-borderless mb-0 ">
                <tbody>
                  <tr class="mb-0 align-middle">
                    <td class="align-middle fw-bold" style="width: 60%">
                      Date de création
                    </td>
                    <td class="align-middle fw-bold float-end text-end">
                      <h6 class="mb-0">
                        <% out.println(unGroupe.getDateCreation()); %>
                      </h6>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
           </div>
        </div>
      </div>  
         <% } %>
            
        </div>
    </div>
    <%@ include file="../inclus/footer.jsp" %>


</body>
</html>