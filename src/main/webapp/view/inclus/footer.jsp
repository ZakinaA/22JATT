<div class="modal fade" id="openModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" id="modalBody">
            </div>
        </div>
    </div>
</div>
<script>
    function selectInstrumentPrincipal() {
        let optionSelected = $('#instrumentPrincipalID').find(":selected").val();                           
                
        if(optionSelected == "instrumentNotExist") {
            $("#modalBody").html('');
            $("#modalBody").append('<form class="form-inline" action="ajouter" method="POST"><div class="mt-2 mb-2"><label for="nomInstrumentAjout" class="form-label">Intitule instrument : </label><input type="text" class="form-control" id="nomInstrumentAjout"></div><button type="button" class="btn btn-light float-end" onclick="addInstrument()">Cr�er l\'instrument</button></form>');
            $("#openModal").modal('show'); 
        }
    }
    
    function openModalConnexion() {
        $("#modalBody").html('');
        $('#modalBody').append('<form class="form-inline" action="/normanzik/ServletIndex/index" method="POST"><div class="mb-3"><label for="adresseMail" class="form-label">Adresse mail</label><input type="email" class="form-control" id="adresseMail" name="loginMail" aria-describedby="emailHelp"></div><div class="mb-3"><label for="passwordInput" class="form-label">Mot de passe</label><input type="password" name="loginPassword" class="form-control" id="passwordInput"></div><button type="submit" class="btn btn-primary">Me connecter</button><a href="/normanzik/ServletMembre/ajouter" class="btn btn-light float-end">Inscription</a></form>');
        $("#openModal").modal('show'); 
    };
    
    function addInstrument() {
        $("#openModal").modal('hide'); 
        $('#instrumentPrincipalID').append('<option value="add" selected>'+$('#nomInstrumentAjout').val()+'</option>');        
    };
    
    function verifPasswordInput() {
        let passwordInput = $('#motDePasseInput').val();
        let verifPasswordInput = $('#verifMotDePasseInput').val();
        if(passwordInput != "" && passwordInput != verifPasswordInput) {
            $('#motDePasseVerif').css('color', 'red').text('Merci de retaper votre mot de passe correctement dans les 2 champs.');            
        }

    }
</script>        
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html> 