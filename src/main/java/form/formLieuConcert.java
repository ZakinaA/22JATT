/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package form;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.LieuConcert;

/**
 *
 * @author sio2
 */
public class formLieuConcert {
    
    
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
    private void validationNom( String Nom ) throws Exception {
        if ( Nom != null && Nom.length() < 3 ) {
            throw new Exception( "Le nom du concert doit contenir au moins 3 caractères." );
        }
    }
    
    private void validationVille( String Ville ) throws Exception {
        if ( Ville != null && Ville.length() < 3 ) {
            throw new Exception( "La Ville doit contenir au moins 3 caractères." );
        }
    }
     private void validationCp( String Cp ) throws Exception {
        if ( Cp != null && Cp.length() < 3 ) {
            throw new Exception( "La CodePostal doit contenir au moins 5 caractères." );
        }
    }

     private void validationSalle( String Salle ) throws Exception {
        if ( Salle != null && Salle.length() < 3 ) {
            throw new Exception( "La Salle contenir au moins 5 caractères." );
        }
    }
    
    private void setErreur( String champ, String message ) {
        erreurs.put(champ, message );
    }

    
    
    private static String getDataForm(HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }
    }
    
      public LieuConcert ajouterLieuConcert(HttpServletRequest request ) {

        LieuConcert unLieuConcert  = new LieuConcert();

        //récupération dans des variables des données saisies dans les champs de formulaire
        String Nom = getDataForm( request, "Nom" );
        String Ville = getDataForm( request, "Ville");
        String Cp = getDataForm( request, "Cp");
        String Salle = getDataForm( request, "Salle");
        try {
            validationNom( Nom );
        } catch ( Exception e ) {
            setErreur( "Nom", e.getMessage() );
        }
        unLieuConcert.setNom(Nom);
         
        try {
            validationVille( Ville );
        } catch ( Exception e ) {
            setErreur( "Ville", e.getMessage() );
        }
        
        try {
            validationCp( Cp );
        } catch ( Exception e ) {
            setErreur( "Cp", e.getMessage() );
        }
        
        try {
            validationSalle( Salle );
        } catch ( Exception e ) {
            setErreur( "Salle", e.getMessage() );
        }
        unLieuConcert.setVille(Ville);
        
        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
        System.out.println("resultat erreurs="+resultat);

        // hydratation de l'objet groupe avec les variables valorisées ci-dessus


    
        return unLieuConcert;
     }

    
    
}