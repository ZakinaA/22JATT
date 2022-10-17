<nav class="navbar navbar-expand-lg bg-light shadow-sm">
    <div class="container-fluid">
        <button class="navbar-toggler border-0 w-100 rounded-0 text-dark" style="color: #000" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa-solid fa-down-left-and-up-right-to-center"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarMain">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                  <a class="nav-link <% if(pageID == "") { out.println("active"); } %>" aria-current="page" href="/normanzik/index.html" style="margin-left: 0.4em">Accueil</a>
              </li>
              <li class="nav-item">
                <a class="nav-link <% if(pageID == "listesGroupes") { out.println("active"); } %>" aria-current="page" href="/normanzik/ServletGroupe/lister">Les Groupes</a>
              </li>
              <li class="nav-item">
                <a class="nav-link <% if(pageID == "listesFestivales") { out.println("active"); } %>" aria-current="page" href="#">Les Festivals</a>
              </li>              
              <li class="nav-item">
                <a class="nav-link <% if(pageID == "listesMembres") { out.println("active"); } %>" aria-current="page" href="/normanzik/ServletMembre/lister">Les Membres</a>
              </li>
               <li class="nav-item">
                <a class="nav-link <% if(pageID == "listesConcerts") { out.println("active"); } %>" aria-current="page" href="/normanzik/ServletConcert/lister">Les Concerts</a>
              </li>
            </ul>
            <!--<div class="btn-group">
              <button type="button" class="btn border-0 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                Accès organisation
              </button>
              <ul class="dropdown-menu dropdown-menu-end">
                <li><button class="dropdown-item" type="button">Management des concerts</button></li>
                <li><button class="dropdown-item" type="button">Management des festivales</button></li>
                <li><button class="dropdown-item" type="button">Management des groupes</button></li>
              </ul>
            </div>-->
            <button type="button" class="btn ml-2 btn-light border rounded-pill btnConnexion" data-bs-toggle="modal" data-bs-target="#exampleModal">Connexion</button>
        </div>
    </div>
</nav>