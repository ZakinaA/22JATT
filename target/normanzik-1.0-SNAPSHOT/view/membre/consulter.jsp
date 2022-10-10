<%@page import="model.Membre"%>
<%@page import="java.util.ArrayList"%>
<%
    String pageName = "Modifier mon profil";
    String pageID = "listesMembres"; 
    Membre leMembre = (Membre)request.getAttribute("pMembre");%>
    <%@ include file="../inclus/head.jsp" %>  
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>  
    <br>
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
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
                        
        <div class="card">
            <div class="table-responsive rounded mb-0">
                <table class="table table-borderless mb-0 table-striped">
                    <tbody>
                        <tr>
                            <td class="align-middle">Nom du groupe</td>
                            <td class="align-middle">Date de création</td>  
                            <td class="align-middle text-end" style="width: 20%"><a class="btn text-white btnHover rounded-pill btn-sm" href="/normanzik/ServletMembre/consulter?idMembre=0" style="background: #FD841F;text-transform: uppercase; text-align: center">VOIR LE PROFIL du groupe</a></td>                    
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>                        
    </div>
    <%@ include file="../inclus/footer.jsp" %>