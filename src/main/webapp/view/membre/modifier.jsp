<%@page import="model.Membre"%>
<%@page import="java.util.ArrayList"%>
<%
    String pageName = "Modifier mon profil";
    String pageID = "listesMembres"; 
%>
    <%@ include file="../inclus/head.jsp" %>  
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>   
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="row">
            <div class="col-md-8 mt-4">
                <div class="card card-body shadow-sm mb-3">
                    <div class="mb-3 row">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Nom</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPassword">
                        </div>
                    </div>
                   <div class="mb-3 row">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Prenom</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPassword">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Adresse mail</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPassword">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Statut</label>
                        <div class="col-sm-10">
                            <select class="form-select">
                                <option value="">Test</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-0 row">
                        <label for="inputPassword" class="col-sm-6 col-form-label">Instrument principal</label>
                        <div class="col-sm-6">
                            <select class="form-select">
                                <option value="">Test</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="card mb-3">
                    <div class="table-responsive">
                        <table class="table table-striped mb-0">
                            <tbody>
                                <tr>
                                    <td class="align-middle">Lorem Ipsum</td>
                                    <td class="align-middle"><select class="form-select"><option value="">test</option></select></td>
                                    <td class="align-middle text-end"><button class="btn btn-success btn-sm">+ Ajouter</button></td>
                                </tr>
                                <tr>
                                    <td class="align-middle">Lorem Ipsum</td>
                                    <td class="align-middle">Instrument Principal</td>
                                    <td class="align-middle text-end"><button class="btn btn-danger btn-sm">X</button></td>
                                </tr>
                                <tr>
                                    <td class="align-middle">Lorem Ipsum</td>
                                    <td class="align-middle">Instrument Principal</td>
                                    <td class="align-middle text-end"><button class="btn btn-danger btn-sm">X</button></td>
                                </tr>
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
                            <button type="button" class="btn btn-outline-dark w-100">Modifier l'image</button>
                        </div> 
                        <div class="col-md-6">
                            <button type="button" class="btn btn-outline-dark w-100">Supprimer l'image</button>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../inclus/footer.jsp" %>