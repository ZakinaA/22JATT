/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package form;
import model.Festival;
import model.Groupe;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import model.Participer_Festival;
/**
 *
 * @author sio2
 */
public class FormFestival {

    public Object getErreurs() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Festival ajouterFestival(HttpServletRequest request) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }



public class FormGroupe {

    private String resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public void setResultat(String resultat) {
        this.resultat = resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public void setErreurs(Map<String, String> erreurs) {
        this.erreurs = erreurs;
    }

    //méthode de validation du champ de saisie nom
    private void validationNom( String nom ) throws Exception {
        if ( nom != null && nom.length() < 3 ) {
            throw new Exception( "Le nom de Festival doit contenir au moins 3 caractères." );
        }
    }

    private void validationDateDebut( String dateCreation) throws Exception {
        if ( dateCreation != null && dateCreation.length() <10  ) {
            throw new Exception( "la date de début est erronnée" );
        }
    }
    private void validationDateFin( String dateCreation) throws Exception {
        if ( dateCreation != null && dateCreation.length() <10  ) {
            throw new Exception( "la date de fin est erronnée" );}
    }
    
    
    private void setErreur( String champ, String message ) {
        erreurs.put(champ, message );
    }

    private String getDataForm(HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }
    }

    // creation d'un objet Festival à partir des données saisies dans le formulaire
    public Festival ajouterFestival(HttpServletRequest request ) {

        Festival unFestival  = new Festival();

        //récupération dans des variables des données saisies dans les champs de formulaire
        String nom = getDataForm( request, "nom" );
        String dateDebut = getDataForm( request, "dateDebut");
        String dateFin = getDataForm( request, "dateFin");
        int idGroupe = Integer.parseInt(getDataForm( request, "idGroupe" ));
        //int dispositifID = Integer.parseInt(getDataForm( request, "dispositifID" ));
        
        try {
            validationNom( nom );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        unFestival.setNom(nom);
         
        try {
            validationDateDebut( dateDebut );
        } catch ( Exception e ) {
            setErreur( "dateDebut", e.getMessage() );
        }
        unFestival.setDateDebutFestival(dateDebut);
        
        try {
            validationDateFin( dateFin );
        } catch ( Exception e ) {
            setErreur( "dateFin", e.getMessage() );
        }
        unFestival.setDateFinFestival(dateFin);

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
        System.out.println("resultat erreurs="+resultat);

        // hydratation de l'objet groupe avec les variables valorisées ci-dessus

        Groupe leGroupe = new Groupe();
        leGroupe.setId(idGroupe);
        Participer_Festival uneParticipation = new Participer_Festival();
        uneParticipation.setTeteAffiche(leGroupe.getNom());
        
        
        /*Dispositif leDispositif = new Dispositif();
        leDispositif.setId(dispositifID);
        unGroupe.setDispositifGroupe(leDispositif);*/
        return unFestival ;
    }
}

}
