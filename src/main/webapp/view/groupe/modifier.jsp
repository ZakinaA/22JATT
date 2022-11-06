<%@page import="model.Groupe"%>
<%@page import="model.Statut"%>
<%@page import="model.Instrument"%>
<%@page import="java.util.ArrayList"%>
<%
    String pageName = "Modifier le profil du groupe";
    String pageID = "groupeSection"; 
    Groupe unGroupe = (Groupe)request.getAttribute("pGroupe");
    String optionSelected = ""; 
%>
    <%@ include file="../inclus/head.jsp" %>  
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>   
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <form class="form-inline" action="<% out.print(getServletContext().getContextPath()); %>/ServletGroupe/modifier?idGroupe=<% out.print(unGroupe.getId()); %>" method="POST">
            <div class="row">
                <div class="col-md-8 mt-4">
                    <div class="card card-body shadow-sm mb-3">
                        <div class="mb-3 row">
                            <label for="inputNom" class="col-sm-2 col-form-label">Nom</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputNom" name="nom" value="<% out.print(unGroupe.getNom()); %>">
                            </div>
                        </div> 
                        <div class="mb-3 row">
                            <label for="inputMail" class="col-sm-2 col-form-label">Adresse mail</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputMail" name="melSiteWeb" value="<% out.print(unGroupe.getMelSiteWeb()); %>">
                            </div>
                        </div>     
                        <div class="mb-3 row">
                            <label for="inputTel" class="col-sm-4 col-form-label">Numéro de téléphone</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="inputTel" name="telSiteWeb" value="<% out.print(unGroupe.getTelephone()); %>">
                            </div>
                        </div>                            
                    </div>
                </div>
                <div class="col-md-4 mt-4">
                </div>
            </div>
            <div class="float-end">
                <input type="hidden" name="formType" value="1">
                <input type="hidden" name="groupeID" value="<% out.print(unGroupe.getId()); %>">
                <button type="submit" class="btn mt-2 text-white w-100 btnHover border-0" style="background: #FD841F;text-transform: uppercase; text-align: center">Sauvegarder les modifications</button>          
            </div>
        </form>
    </div>
    <%@ include file="../inclus/footer.jsp" %>