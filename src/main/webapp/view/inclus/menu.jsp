<%@page import="dao.DaoConnexion"%>
<%@page import="model.Connexion"%>
<nav class="navbar navbar-expand-lg bg-light shadow-sm">
    
        <button class="navbar-toggler border-0 w-100 rounded-0 text-dark" style="color: #000" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa-solid fa-down-left-and-up-right-to-center"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarMain">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                  <a class="nav-link <% if(pageID == "") { out.print("active"); } %>" aria-current="page" href="<% out.print(getServletContext().getContextPath()); %>/" style="margin-left: 0.4em">Accueil</a>
              </li>
              <li class="nav-item">
                <a class="nav-link <% if(pageID == "groupeSection") { out.print("active"); } %>" aria-current="page" href="<% out.print(getServletContext().getContextPath()); %>/ServletGroupe/lister">Les Groupes</a>
              </li>
              <li class="nav-item">
                <a class="nav-link <% if(pageID == "listesFestivals") { out.print("active"); } %>" aria-current="page" href="<% out.print(getServletContext().getContextPath()); %>/ServletFestival/lister">Les Festivals</a>
              </li>
              <li class="nav-item">
                <a class="nav-link <% if(pageID == "listesConcerts") { out.print("active"); } %>" aria-current="page" href="<% out.print(getServletContext().getContextPath()); %>/ServletConcert/lister">Les Concerts</a>
              </li>                            
              <li class="nav-item">
                <a class="nav-link <% if(pageID == "listesMembres") { out.print("active"); } %>" aria-current="page" href="<% out.print(getServletContext().getContextPath()); %>/ServletMembre/lister">Les Membres</a>
              </li>
              <li class="nav-item">
                <a class="nav-link <% if(pageID == "listesDispositifs") { out.print("active"); } %>" aria-current="page" href="<% out.print(getServletContext().getContextPath()); %>/ServletDispositif/lister">Les Dispositifs</a>
              </li>
            </ul>
            <% 
                Integer NormanzikAuthID = (Integer) session.getAttribute("NormanzikAuthID"); 
                Integer NormanzikGradeID = (Integer) session.getAttribute("NormanzikGradeID"); 
                if (NormanzikAuthID != null  && NormanzikAuthID != 0) {                     
                    String NormanzikNomCompte = (String) session.getAttribute("NormanzikNomCompte"); 
            %>
                <% if(NormanzikGradeID == 2) { %>
                <div class="btn-group" style="margin-right: 0.7em">
                  <button type="button" class="btn border-0 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    Acc?s organisation (<% out.print(NormanzikNomCompte); %>)
                  </button>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li><a href="<% out.print(getServletContext().getContextPath()); %>/ServletFestival/ajouter" class="dropdown-item">Cr?er un festival</a></li>
                    <!--<li><button class="dropdown-item" type="button">Management des concerts</button></li>
                    
                    <li><button class="dropdown-item" type="button">Management des groupes</button></li>
                    <li><hr class="dropdown-divider"></li>-->
                    <li><a href="<% out.print(getServletContext().getContextPath()); %>/ServletMembre/consulter?idMembre=<% out.print(NormanzikAuthID); %>" class="dropdown-item">Mon profil</a></li>
                    <li><a href="<% out.print(getServletContext().getContextPath()); %>/ServletIndex/logout" class="dropdown-item">D?connexion</a></li>
                  </ul>
                </div>
                <% } else if(NormanzikGradeID == 1) { %>
                <% } else { %>
                    <div class="btn-group" style="margin-right: 0.7em">
                      <button type="button" class="btn border-0 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Voir le profil  (<% out.print(NormanzikNomCompte); %>)
                      </button>
                      <ul class="dropdown-menu dropdown-menu-end">
                        <!--<li><button class="dropdown-item" type="button">Consulter mes groupes</button></li>    
                        <li><hr class="dropdown-divider"></li>-->
                        <li><a href="<% out.print(getServletContext().getContextPath()); %>/ServletMembre/consulter?idMembre=<% out.print(NormanzikAuthID); %>" class="dropdown-item">Mon profil</a></li>
                        <li><a href="<% out.print(getServletContext().getContextPath()); %>/ServletIndex/logout" class="dropdown-item">D?connexion</a></li>
                      </ul>
                    </div>
                <% } %>
            <% } else { %>
                <button type="button" class="btn ml-2 btn-light border rounded-pill btnConnexion" style="margin-right: 0.7em" onclick="openModalConnexion()">Connexion</button>
            <% } %>
        </div>
    
</nav>