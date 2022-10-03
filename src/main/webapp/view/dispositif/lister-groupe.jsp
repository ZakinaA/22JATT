<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%@page import="model.Dispositif"%>
<%@page import="java.util.ArrayList"%>

<%
    String pageID = "listesGroupes"; 
%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="http://185.163.126.183/2JATT/libs/css/NormanZikStyle.css" rel="stylesheet">
    <link href="http://185.163.126.183/2JATT/libs/css/bootstrap.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e43d5fbf75.js" crossorigin="anonymous"></script>
  </head>
<body>
 <%
    ArrayList<Groupe> lesGroupesDispositif = (ArrayList)request.getAttribute("pLesGroupesDispositif");    
%>
  <body class="body">
    <%@ include file="../inclus/header.jsp" %>
    <%@ include file="../inclus/menu.jsp" %>
    <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
        <div class="row">
        <%
             for (Groupe unGroupe : lesGroupesDispositif) {
        %>
        <div class="col-md-3">
          <div class="card mt-4">
            <div class="card-body">
              <h4 class="mb-0">                  
                <a href="" class="text-decoration-none text-dark fw-bold mb-0">
                  <% out.println(unGroupe.getNom());%>
                </a>
              </h4>                
              <div class="card bg-light mt-4 mb-2 shadow-none">
                <table class="table table-borderless mb-0 ">
                  <tbody>
                    <tr class="mb-0 align-middle">
                      <td class="align-middle fw-bold" style="width: 60%">
                        Logo du groupe
                      </td>
                      <td class="align-middle fw-bold float-end text-end">
                        <h6 class="mb-0">
                         ---
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
                       -----
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