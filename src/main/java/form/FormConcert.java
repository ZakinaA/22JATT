/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package form;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Concert;

/**
 *
 * @author sio2
 */
public class FormConcert {
    
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
            throw new Exception( "Le nom du Concert doit contenir au moins 3 caractères." );
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
    
      public Concert ajouterConcert(HttpServletRequest request ) {

        Concert unConcert  = new Concert();

        //récupération dans des variables des données saisies dans les champs de formulaire
        String nom = getDataForm( request, "nom" );
        String prenom = getDataForm( request, "prenom");
        int instrumentPrincipalID = Integer.parseInt(getDataForm( request, "instrumentPrincipalID" ));
        int statutID = Integer.parseInt(getDataForm( request, "statutID" ));
        try {
            validationNom( nom );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        unConcert.setNom(nom);
      
        
        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
        System.out.println("resultat erreurs="+resultat);

        // hydratation de l'objet groupe avec les variables valorisées ci-dessus

        Instrument leInstrumentPrincipal = new Instrument();
        leInstrumentPrincipal.setId(instrumentPrincipalID);
        unMembre.setInstrumentPrincipal(leInstrumentPrincipal);
        
        Statut leStatut = new Statut();
        leStatut.setId(statutID);
        
        unMembre.setStatutMembre(leStatut);
        return unMembre;
     }
    
}
