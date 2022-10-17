<%@page import="model.Groupe"%>
<%@page import="model.Participer_Festival"%>
<%@page import="model.Festival"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%
    String pageName = "Consulter les festivals";
    String pageID = "festivalsection"; 
    Festival unFestival = (Festival)request.getAttribute("pFestival");
    Participer_Festival uneParticipation = (Participer_Festival)request.getAttribute("pParticiper_Festival");
    Participer_Festival teteAffiche = (Participer_Festival)request.getAttribute("pTeteAffiche");
    ArrayList<Groupe> lesGroupes = (ArrayList)request.getAttribute("pGroupes");
%>
<%@ include file="../inclus/head.jsp" %>
<%@ include file="../inclus/header.jsp" %>
<%@ include file="../inclus/menu.jsp" %>
<div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="card card-body border-0 shadow-sm py-5 mt-4">
            <h1 class="mb-0" style="margin-left: 3%;"><% out.println(unFestival.getNom());%></h1>
        </div>
        <div class="card mt-4">
            <table class="table table-striped mb-0">
                <tbody>
                    <tr>
                        <td>Dates</td>
                        <td><% out.println(unFestival.getDateDebutFestival()); %> / <% out.println(unFestival.getDateFinFestival()); %></td>
                    </tr>
                    <tr>
                        <td>Tete d'affiche</td>
                        <td><%out.println(teteAffiche.getTeteAffiche());%></td>
                    </tr>
                </tbody>
            </table>
        </div>
        
          <h4 class="mt-4"> Les Groupes</h4>
        <table class="table table-striped">
             <thead class="bg-light">
             <th>Nom des groupes</th>
         </thead>
         <tbody>
            <%  for (Groupe unGroupe : lesGroupes) {
                out.println("<tr><td><a href='../ServletMembre/consulter?idMembre="+unGroupe.getId()+"'>");
                out.println(unGroupe.getNom());
                out.println("</a></td></tr>");     
                }
            %>
         </tbody>
        </table>   
         <h4 class="mt-4"> Concerts</h4>
        <table class="table table-striped">
             <thead class="bg-light">
             <th>Heure du concert</th>
             <th>Nom du groupe</th>
             <th>Durée</th>
         </thead>
         <tbody>
             
            <%  /*for (Groupe unGroupe : lesGroupes) {
                out.println("<tr><td><a href='../ServletMembre/consulter?idMembre="+unGroupe.getId()+"'>");
                out.println(unGroupe.getNom());
                out.println("</a></td></tr>");     
                }*/
            %>
         </tbody>
        </table>
        Aucun concert renseigné
        </div>
</div>
<br/>
<%@ include file="../inclus/footer.jsp" %>
