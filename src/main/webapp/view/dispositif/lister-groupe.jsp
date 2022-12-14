<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%@page import="model.Dispositif"%>
<%@page import="java.util.ArrayList"%>
<%
    int cardOrder = 0;
    ArrayList<Groupe> lesGroupesDispositif = (ArrayList)request.getAttribute("pLesGroupesDispositif");
    String pageName = "Consulter un dispositif";
    String pageID = "listesDispositifs";     
%>

    <%@ include file="../inclus/head.jsp" %>
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>
      <style>
    .bgOrange2 {
    background: #E14D2A;
    }
    .btnHover:hover {
        font-weight: 900;
    }
    
    .testCard:hover {
	transition: 0.66s;
	transform: scale(1.053);
        margin-top: 1.7em;
        box-shadow: 0 1rem 1.7rem rgba(0, 0, 0, 0.055) !important;
    }
    
    


  </style>
  
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="row">

              <%
             for (Groupe unGroupe : lesGroupesDispositif) {
        %>
        <div class="col-md-3">
          <div class="card mt-4 testCard">
            <div class="card-body">
                <h4 class="mt-2">                  
                    <a href="" class="text-decoration-none text-dark fw-bold mb-0">
                <% out.print(unGroupe.getNom()); %>
                    </a>
                </h4>           
                <div class="card bg-light mt-4 mb-2 shadow-none">
                  <table class="table table-borderless mb-0 ">
                    <tbody>
                      <tr class="mb-0 align-middle">
                        <td class="align-middle fw-bold" style="width: 60%">
                          Date de Création
                        </td>
                        <td class="align-middle fw-bold float-end text-end">
                          <h6 class="mb-0">
                              <% out.println(unGroupe.getDateCreation()); %>
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
                          Lieu répétition                        </td>
                        <td class="align-middle fw-bold float-end text-end">
                          <h6 class="mb-0">
                             <% out.println(unGroupe.getLieuRepetition()); %>
                          </h4>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                
          <a href="<%out.print(getServletContext().getContextPath()); %>/ServletGroupe/consulter?idGroupe=<% out.println(unGroupe.getId()); %>" class="btn mt-2 text-white w-100 btnHover" style="background: #FD841F;text-transform: uppercase; text-align: center">VOIR PLUS</a>          
          
               </div>
            </div>
        </div>  
             
     <% cardOrder++; }
        if(cardOrder == 0) {
            out.print("<div class='alert alert-primary mt-4' role='alert'>Aucun groupe n'est dans ce dispositif</div>");
        }     
     %>
           
        </div>
    </div>
    <%@ include file="../inclus/footer.jsp" %>