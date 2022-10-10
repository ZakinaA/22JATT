<nav class="navbar navbar-expand-lg bg-light shadow-sm">
    
        <button class="navbar-toggler border-0 w-100 rounded-0 text-dark" style="color: #000" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa-solid fa-down-left-and-up-right-to-center"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarMain">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                  <a class="nav-link <% if(pageID == "") { out.println("active"); } %>" aria-current="page" href="/normanzik/ServletIndex/index" style="margin-left: 0.4em">Accueil</a>
              </li>
              <li class="nav-item">
                <a class="nav-link <% if(pageID == "groupeSection") { out.println("active"); } %>" aria-current="page" href="/normanzik/ServletGroupe/lister">Les Groupes</a>
              </li>
              <li class="nav-item">
                <a class="nav-link <% if(pageID == "listesFestivales") { out.println("active"); } %>" aria-current="page" href="#">Les Festivals</a>
              </li>              
              <li class="nav-item">
                <a class="nav-link <% if(pageID == "listesMembres") { out.println("active"); } %>" aria-current="page" href="/normanzik/ServletMembre/lister">Les Membres</a>
              </li>
            </ul>
            <% 
                Integer NormanzikAuthID = (Integer) session.getAttribute("NormanzikAuthID"); 
                if (NormanzikAuthID != null  && NormanzikAuthID != 0) { // Permet de vérifier si l'utilisateur est connecté ou non
                    Integer NormanzikGradeID = (Integer) session.getAttribute("NormanzikGradeID"); 
            %>
                <% if(NormanzikGradeID == 2) { %>
                <div class="btn-group" style="margin-right: 0.7em">
                  <button type="button" class="btn border-0 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    Accès organisation
                  </button>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li><button class="dropdown-item" type="button">Management des concerts</button></li>
                    <li><button class="dropdown-item" type="button">Management des festivales</button></li>
                    <li><button class="dropdown-item" type="button">Management des groupes</button></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a href="/normanzik/ServletIndex/logout" class="dropdown-item">Mon profil</a></li>
                    <li><a href="/normanzik/ServletIndex/logout" class="dropdown-item">Déconnexion</a></li>
                  </ul>
                </div>
                <% } else if(NormanzikGradeID == 1) { %>
                <% } else { %>
                    <div class="btn-group" style="margin-right: 0.7em">
                      <button type="button" class="btn border-0 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Voir le profil
                      </button>
                      <ul class="dropdown-menu dropdown-menu-end">
                        <li><button class="dropdown-item" type="button">Consulter mes groupes</button></li>    
                        <li><hr class="dropdown-divider"></li>
                        <li><a href="/normanzik/ServletIndex/logout" class="dropdown-item">Mon profil</a></li>
                        <li><a href="/normanzik/ServletIndex/logout" class="dropdown-item">Déconnexion</a></li>
                      </ul>
                    </div>
                <% } %>
            <% } else { %>
                <button type="button" class="btn ml-2 btn-light border rounded-pill btnConnexion" style="margin-right: 0.7em" onclick="openModalConnexion()">Connexion</button>
            <% } %>
        </div>
    
</nav>