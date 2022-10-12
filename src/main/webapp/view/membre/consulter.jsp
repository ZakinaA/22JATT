<%@page import="model.Instrument"%>
<%@page import="model.Groupe"%>
<%@page import="model.Membre"%>
<%@page import="java.util.ArrayList"%>
<%
    String pageID = "listesMembres"; 
    int showBtnModifProfil = 0;
    Membre leMembre = (Membre)request.getAttribute("pMembre");
    
    ArrayList<Groupe> lesGroupesMembre = (ArrayList) request.getAttribute("pLesGroupesMembre");
    String pageName = "Consulter le profil de "+leMembre.getPrenom()+" "+leMembre.getNom();
%>
    
    <%@ include file="../inclus/head.jsp" %>  
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>  
    
    <%
        if (NormanzikAuthID != null  && NormanzikAuthID != 0) {
            if(NormanzikAuthID == leMembre.getId()) {
                showBtnModifProfil = 1;
            }
        }
    %>
    <br>
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <% if(showBtnModifProfil == 1) { %>
            <div>
                    <a href="/normanzik/ServletMembre/modifierprofil?idMembre=<% out.println(leMembre.getId()); %>" class="btn border-0 text-white float-end" style="background: #FD841F;text-transform: uppercase; text-align: center">Modifier mon profil</a>
            </div>
            <div style="clear:both;" class="mb-3"></div>
        <% } %>
        <div class="card border-0 shadow-sm text-center rounded mb-3" style="background-color: #FD841F;">
            <div class="table-responsive rounded">
                <table class="table table-borderless" style="background-color: #FD841F;">
                    <tbody>
                        <tr class="align-middle">
                            <td class="align-middle">
                                <img src="https://raw.githubusercontent.com/ZakinaA/22JATT/c5777d15cccd206839c4e50a09539670f7c48441/placeholder_default.png" class="mt-3 img-fluid mr-4 shadow-sm rounded" width="120">
                            </td>
                            <td class="align-middle" style="width: 80%">
                                <h2 class="text-white mb-0"><% out.println(leMembre.getPrenom()); %> <% out.println(leMembre.getNom()); %></h2>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="card mb-3">
            <div class="table-responsive rounded mb-0">
                <table class="table table-borderless mb-0 table-striped">
                    <tbody>
                        <tr>
                            <td>Statut</td>
                            <td><% out.println(leMembre.getStatutMembre().getLibelleStatut()); %></td>                        
                        </tr>
                        <tr>
                            <td>Instrument principal</td>
                            <td><% out.println(leMembre.getInstrumentPrincipal().getLibelle()); %></td>                        
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
                        
        <h4>Les groupes de l'utilisateur : </h4>                
                        
        <div class="card mb-3">
            <div class="table-responsive rounded mb-0">
                <table class="table table-borderless mb-0 table-striped">
                    <tbody>
                        <%
                        for (Groupe unGroupe : lesGroupesMembre) {
                        %>    
                        <tr>
                            <td class="align-middle"><% out.print(unGroupe.getNom()); %></td>
                            <td class="align-middle"><% out.print(unGroupe.getDateCreation()); %></td>  
                            <td class="align-middle text-end" style="width: 20%"><a class="btn text-white btnHover rounded-pill btn-sm" href="<%out.print(getServletContext().getContextPath()); %>/ServletGroupe/consulter?idGroupe=<% out.print(unGroupe.getId()); %>" style="background: #FD841F;text-transform: uppercase; text-align: center">VOIR LE PROFIL du groupe</a></td>                    
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>    

        <h4>Les instruments de l'utilisateur : </h4>   
        
        <div class="card mb-3">
            <div class="table-responsive rounded mb-0">
                <table class="table table-borderless mb-0 table-striped">
                    <tbody>
                        <%
                        int instrumentOrder = 1;
                        
                        if(leMembre.getLesInstruments().size() != 0) {
                        for (Instrument unInstrument : leMembre.getLesInstruments()) {    
                        %>    
                        <tr>
                            <td class="align-middle">Instrument <% if(unInstrument.getEstInstrumentPrincipal() == 1) { out.print("<b>Principal</b>"); } else { out.print(instrumentOrder); } %></td>
                            <td class="align-middle"><% out.print(unInstrument.getLibelle()); %></td>  
                        </tr>
                        <% instrumentOrder++; }} %>
                    </tbody>
                </table>
            </div>
        </div>   
    </div>
                    
                             
    <%@ include file="../inclus/footer.jsp" %>