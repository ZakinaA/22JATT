<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pageName = "";
    String pageID = ""; 
%>
<%@ include file="../inclus/head.jsp" %>
  <body class="body">
    <div class="card rounded-0 border-0 mb-0 SpaceText tipo" style="height: 3em;background-color: #FD841F; text-transform: uppercase;text-align: center;"><div style="margin-top: 3.5%;text-shadow: 3px 5px 0px rgb(0 0 0 / 10%);">Norman'Zik</div></div>


    <%@ include file="../inclus/menu.jsp" %>
      <footer>
        </div>
        <div class="container-fluid" style="width: 85%;bottom: 0;top: 1">
          <h3 class="text-center mt-4">Nos partenaires</h3>
          <div class="row mt-4">
            <div class="col-md-3">
              <div class="card bgOrange2 py-5">
              </div>
            </div>
            <div class="col-md-3"><div class="card bgOrange2 py-5 border-0"></div></div>
            <div class="col-md-3"><div class="card bgOrange2 py-5 border-0"></div></div>
            <div class="col-md-3"><div class="card bgOrange2 py-5 border-0"></div></div>
          </div>
        </div>
      </footer>

      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">
              <form>
                <div class="mb-3">
                  <label for="exampleInputEmail1" class="form-label">Adresse mail</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Mot de passe</label>
                  <input type="password" class="form-control" id="exampleInputPassword1">
                </div>
                <button type="submit" class="btn btn-primary">Me connecter</button>
                <button type="submit" class="btn btn-light float-end">Inscription</button>
              </form>
            </div>
          </div>
        </div>
      </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
  </body>
</html>