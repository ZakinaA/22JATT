<div class="modal fade" id="openModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" id="modalBody">
            </div>
        </div>
    </div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<footer class="text-center text-white bottom-0" style="background-color: #FD841F;">
    <div class="text-center p-3">
        Copyright © Norman'Zik 2022 - <a href="" class="text-white">Mentions Légales et contact</a>
    </div>
</footer>
<%
    Integer showNotifMessage = (Integer) session.getAttribute("showNotifMessage");
    if(showNotifMessage != null && showNotifMessage != 0) { 
        String notifMessage = (String) session.getAttribute("notifMessage");
%>
<script>
        $(document).ready(function(){
            showNotification("<% out.print(notifMessage); %>");
        }); 
</script>
<% session.setAttribute("showNotifMessage", 0);} %>
<script>
    function selectInstrumentPrincipal() {
        let optionSelected = $('#instrumentPrincipalID').find(":selected").val();                           
                
        if(optionSelected == "instrumentNotExist") {
            $("#modalBody").html('');
            $("#modalBody").append('<form class="form-inline" action="ajouter" method="POST"><div class="mt-2 mb-2"><label for="nomInstrumentAjout" class="form-label">Intitule instrument : </label><input type="text" class="form-control" id="nomInstrumentAjout"></div><button type="button" class="btn btn-light float-end" onclick="addInstrument()">Créer l\'instrument</button></form>');
            $("#openModal").modal('show'); 
        }
    }
    
    function openModalConnexion() {
        $("#modalBody").html('');
        $('#modalBody').append('<form class="form-inline" action="<% out.print(getServletContext().getContextPath()); %>/ServletIndex/index" method="POST"><div class="mb-3"><label for="adresseMail" class="form-label">Adresse mail</label><input type="email" class="form-control" id="adresseMail" name="loginMail" aria-describedby="emailHelp"></div><div class="mb-3"><label for="passwordInput" class="form-label">Mot de passe</label><input type="password" name="loginPassword" class="form-control" id="passwordInput"></div><button type="submit" class="btn btn-primary">Me connecter</button><a href="/normanzik/ServletMembre/ajouter" class="btn btn-light float-end">Inscription</a></form>');
        $("#openModal").modal('show'); 
    };
    
    function addInstrument() {
        $('#nomInstrumentAjoutInput').val($('#nomInstrumentAjout').val());
        $("#openModal").modal('hide'); 
        $('#instrumentPrincipalID').append('<option value="-1" selected>'+$('#nomInstrumentAjout').val()+'</option>');        
    };
    
    function verifPasswordInput() {
        let passwordInput = $('#motDePasseInput').val();
        let verifPasswordInput = $('#verifMotDePasseInput').val();
        if(passwordInput != "" && passwordInput != verifPasswordInput) {
            $('#motDePasseVerif').css('color', 'red').text('Merci de retaper votre mot de passe correctement dans les 2 champs.');            
        }
    }
    
    function ajoutInstrumentFunc() {
        alert("add instrument");
    }
    

    
    function deleteImageProfil(source) {
        //$('#avatarProfil').remove();
        $('#avatarProfil').attr('src', '<% out.print(getServletContext().getContextPath()); %>/libs/images/placeholder_default.png');
    }
    
    function deleteInstrumentMembre(instrumentOrder) {
        $('#trInstrument'+instrumentOrder).remove();
        let deleteInstrumentVal = $('#deleteInstrument'+instrumentOrder).val();
        if(deleteInstrumentVal == 0) {
            $('#deleteInstrument'+instrumentOrder).val(1);
        } else {
            $('#deleteInstrument'+instrumentOrder).val(0);  
        }
    }
    
    function updateProfilImage() {
        $('#updateProfilAvatar').html('<div class="card card-body shadow-sm mb-0"><div class="mb-0"><label for="formFile" class="form-label">Veuillez choisir une nouvelle image de profil</label><input class="form-control" type="file" id="formFile"></div></div>'); 
    }
    
    function showNotification(messageContent) {        
        $('#liveToastJSStatusColor').css('background', 'green');
        $('#liveToastJSContent').text(messageContent);
        $("#liveToastJS").toast({delay: 3500});
        $("#liveToastJS").toast('show');            
    }

</script>
<div class="position-fixed top-0 end-0 p-3" style="z-index: 11;">
    <div id="liveToastJS" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <div class="rounded" style="width: 1rem;height: 1rem;margin-right: 1.3em;" id="liveToastJSStatusColor"> </div>
            <strong class="me-auto">Alerte Pop Up</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body" id="liveToastJSContent">
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html> 