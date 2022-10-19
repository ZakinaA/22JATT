/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package form;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Concert;
import model.Groupe;
import model.LieuConcert;

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
    private void validationDate( String date ) throws Exception {
        if ( date != null && date.length() < 3 ) {
            throw new Exception( "La date du Concert n'est pas valide." );
        }
    }
    
    private void validationHeureD( String HeureD ) throws Exception {
        if ( HeureD != null && HeureD.length() < 3 ) {
            throw new Exception( "L'heure du début du concert n'est pas valide." );
        }
    }
    
    private void validationHeureF( String HeureF ) throws Exception {
        if ( HeureF != null && HeureF.length() < 3 ) {
            throw new Exception( "L'heure de fin du concert n'est pas valide." );
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
        String date = getDataForm( request, "date");
        String HeureD = getDataForm( request, "HeureD");
        String HeureF = getDataForm( request, "HeureF");
        int localisation = Integer.parseInt(getDataForm( request, "localisation" ));
        int groupe = Integer.parseInt(getDataForm( request, "groupe" ));
        try {
            validationDate( date );
        } catch ( Exception e ) {
            setErreur( "date", e.getMessage() );
        }
        unConcert.setDateConcert(date);
        
         try {
            validationHeureD( HeureD );
        } catch ( Exception e ) {
            setErreur( "HeureD", e.getMessage() );
        }
        unConcert.setHeureDebut(HeureD);
          try {
            validationHeureF( HeureF );
        } catch ( Exception e ) {
            setErreur( "HeureF", e.getMessage() );
        }
        unConcert.setHeureFin(HeureF);
        
      
        
        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
        System.out.println("resultat erreurs="+resultat);

        // hydratation de l'objet groupe avec les variables valorisées ci-dessus

        Groupe leGroupe = new Groupe();
        leGroupe.setId(groupe);
        
        LieuConcert lelieuConcert = new LieuConcert();
        lelieuConcert.setId(localisation);
        
        unConcert.setLieuConcertId(lelieuConcert);
        
        return unConcert;
     }
    
}