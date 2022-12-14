<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.Groupe"%>
<%@page import="model.Participer_Festival"%>
<%@page import="model.Festival"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%
    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    String pageName = "Consulter les festivals";
    String pageID = "listesFestivals"; 
    Festival unFestival = (Festival)request.getAttribute("pFestival");
    Participer_Festival uneParticipation = (Participer_Festival)request.getAttribute("pParticiper_Festival");
    Participer_Festival teteAffiche = (Participer_Festival)request.getAttribute("pTeteAffiche");
    ArrayList<Groupe> lesGroupes = (ArrayList)request.getAttribute("pGroupes");
    
    LocalDate date = LocalDate.parse(unFestival.getDateDebutFestival());        
    String dateDebutFestival = date.format(myFormatObj); 

    LocalDate dateFinFestival = LocalDate.parse(unFestival.getDateFinFestival());        
    String formatteDateFinFestival = dateFinFestival.format(myFormatObj); 
%>
<%@ include file="../inclus/head.jsp" %>
<%@ include file="../inclus/header.jsp" %>
<%@ include file="../inclus/menu.jsp" %>
<div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="card card-body border-0 shadow-sm py-5 mt-4" style="background-color: #FD841F;">
            <h1 class="mb-0" style="margin-left: 3%;"><% out.print(unFestival.getNom());%></h1>
        </div>
        <div class="card mt-4">
            <table class="table table-striped mb-0">
                <tbody>
                    <tr>
                        <td class="align-middle">Dates</td>
                        <td class="align-middle">Début du festival : <b><% out.print(dateDebutFestival); %></b></td>
                        <td class="align-middle">Fin du festival : <b><% out.print(formatteDateFinFestival); %></b></td>
                    </tr>
                    <tr>
                        <td class="align-middle">Tete d'affiche</td>
                        <td class="align-middle"><%out.print(teteAffiche.getTeteAffiche());%></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card card-body shadow-sm mb-3 border-0 fw-bold"  style="background-color: #FD841F;">
                    <h4 class="mb-0 fw-bold">Les Groupes</h4>       
                </div>
            </div>
            <div class="col-md-8">
            </div>                  
        </div> 

        <table class="table table-striped bg-light">
             <thead class="bg-light">
             <th>Nom des groupes</th>
         </thead>
         <tbody>
            <%  for (Groupe unGroupe : lesGroupes) {
                out.print("<tr><td><a href='"+getServletContext().getContextPath()+"/ServletGroupe/consulter?idGroupe="+unGroupe.getId()+"' class='text-decoration-none'>"+unGroupe.getNom()+"</a></td></tr>");
                }
            %>
         </tbody>
        </table>   
        <div class="row">
            <div class="col-md-4">
                <div class="card card-body shadow-sm mb-3 border-0 fw-bold"  style="background-color: #FD841F;">
                    <h4 class="mb-0 fw-bold">Concerts</h4>       
                </div>
            </div>
            <div class="col-md-8">
            </div>                  
        </div> 
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
