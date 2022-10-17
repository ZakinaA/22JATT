<%@page import="model.Statut"%>
<%@page import="model.Instrument"%>
<%@page import="model.Membre"%>
<%@page import="java.util.ArrayList"%>
<%
    String pageName = "Modifier mon profil";
    String pageID = "listesMembres"; 
    Membre leMembre = (Membre)request.getAttribute("pMembre");
    String optionSelected = ""; 
%>
    <%@ include file="../inclus/head.jsp" %>  
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>   
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <form class="form-inline" action="<% out.print(getServletContext().getContextPath()); %>/ServletMembre/modifierprofil?idMembre=<% out.print(leMembre.getId()); %>" method="POST">
            <div class="row">
                <div class="col-md-8 mt-4">
                    <div class="card card-body shadow-sm mb-3">
                        <div class="mb-3 row">
                            <label for="inputNom" class="col-sm-2 col-form-label">Nom</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputNom" name="nom" value="<% out.println(leMembre.getNom()); %>">
                            </div>
                        </div>
                       <div class="mb-3 row">
                            <label for="inputPrenom" class="col-sm-2 col-form-label">Prenom</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputPrenom" name="prenom" value="<% out.println(leMembre.getPrenom()); %>">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="inputAdresseMail" class="col-sm-2 col-form-label">Adresse mail</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputAdresseMail" name="mail" value="<% out.println(leMembre.getMail()); %>">
                            </div>
                        </div>     
                        <div class="mb-3 row">
                            <label for="statutSelect" class="col-sm-2 col-form-label">Statut</label>
                            <div class="col-sm-10">
                                <select class="form-select" id="statutSelect" name="selectStatut">
                                <%
                                    ArrayList<Statut> lesStatuts = (ArrayList)request.getAttribute("pLesStatuts");
                                    for (int i=0; i<lesStatuts.size();i++){
                                        Statut statut = lesStatuts.get(i);

                                        if(statut.getId() == leMembre.getStatutMembre().getId()) {
                                            optionSelected = "selected";
                                        } else {
                                            optionSelected = "";       
                                        }
                                        out.print("<option value='" + statut.getId()+"' "+optionSelected+">" + statut.getLibelleStatut()+"</option>" );
                                    }
                                %>
                                </select>
                            </div>
                        </div>
                        <div class="mb-0 row">
                            <label for="instrumentPrincipalSelect" class="col-sm-6 col-form-label">Instrument principal</label>
                            <div class="col-sm-6">
                                <select class="form-select" id="instrumentPrincipalSelect" name="selectInstrumentPrincipal">
                                    <% 
                                    ArrayList<Instrument> lesInstruments = (ArrayList)request.getAttribute("pLesInstruments");
                                    for (int i=0; i<lesInstruments.size();i++){                               
                                        Instrument ins = lesInstruments.get(i);

                                        if(ins.getId() == leMembre.getInstrumentPrincipal().getId()) {
                                            optionSelected = "selected";
                                        } else {
                                            optionSelected = "";       
                                        }
                                        out.print("<option value='" + ins.getId()+"' "+optionSelected+">" + ins.getLibelle()+"</option>" );
                                    }
                                    %>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="table-responsive">
                            <table class="table table-striped mb-0">
                                <tbody>
                                    <tr>
                                        <td class="align-middle" style="width: 40%">Ajouter un instrument</td>
                                        <td class="align-middle">
                                            <select class="form-select">                                            
                                                <%
                                                for (int i=0; i<lesInstruments.size();i++){
                                                    Instrument ins = lesInstruments.get(i);
                                                    out.println("<option value='" + ins.getId()+"'>" + ins.getLibelle()+"</option>" );
                                                }
                                                %>
                                            </select>
                                        </td>
                                        <td class="align-middle text-end"><button class="btn btn-success btn-sm" onclick="ajoutInstrumentFunc()">+ Ajouter</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="table-responsive">
                            <table class="table table-striped mb-0">
                                <tbody>        
                                    <%
                                    int instrumentOrder = 1;
                                    for (Instrument unInstrument : leMembre.getLesInstruments()) {    
                                    %>    
                                    <tr id="trInstrument<% out.print(instrumentOrder); %>">
                                        <td class="align-middle"><% out.print(unInstrument.getLibelle()); %></td>
                                        <td class="align-middle">Instrument <% if(unInstrument.getEstInstrumentPrincipal() == 1) { out.print("<b>Principal</b>"); } %></td>
                                        <td class="align-middle text-end"><% if(unInstrument.getEstInstrumentPrincipal() == 0) { %><button class="btn btn-danger btn-sm" onclick="deleteInstrumentMembre(<% out.print(instrumentOrder); %>)">X</button><input type="hidden" name="deleteInstrument" id="deleteInstrument<%out.print(instrumentOrder);%>" value="0"><% } %></td>
                                    </tr>
                                    <% instrumentOrder++; } %>
                                </tbody>
                            </table>
                        </div>                    
                    </div>
                </div>
                <div class="col-md-4 mt-4">
                    <div class="card card-body">
                        <img src="https://raw.githubusercontent.com/ZakinaA/22JATT/c5777d15cccd206839c4e50a09539670f7c48441/placeholder_default.png" class="img-fluid mr-4 shadow-sm rounded">
                        <div class="row mt-4">
                            <div class="col-md-6">
                                <button type="button" class="btn btn-outline-dark w-100" data-bs-toggle="modal" data-bs-target="#openModal">Modifier l'image</button>
                            </div> 
                            <div class="col-md-6">
                                <button type="button" class="btn btn-outline-danger w-100" onclick="deleteImageProfil('profilMembre')">Supprimer l'image</button>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="float-end">
                <input type="text" name="formType" value="1">
                <button type="submit" class="btn mt-2 text-white w-100 btnHover border-0" style="background: #FD841F;text-transform: uppercase; text-align: center">Sauvegarder mes modifications</button>          
            </div>
        </form>
    </div>
    <%@ include file="../inclus/footer.jsp" %>