/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package form;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Connexion;

/**
 *
 * @author sio2
 */
public class FormConnexion {
    private String resultat;
    private Map<String, String> erreurs = new HashMap<String, String>(); 
    
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
    
    private void validationLogin( String login ) throws Exception {
        if (login.contains("@")) {
            throw new Exception( "Merci de saisir une adresse mail valide <i>adresse@domaine</i>" );
        }
    }
    
    private void validationPassword( String password ) throws Exception {
        if (password != null) {
            throw new Exception( "Merci de saisir un mot de passe valide" );
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
    
    public Connexion uneConnexion(HttpServletRequest request) {
        Connexion uneConnexion = new Connexion();
        String loginMail = getDataForm( request, "loginMail" );
        String loginPassword = getDataForm( request, "loginPassword");
        
        
        try {
            validationLogin( loginMail );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        uneConnexion.setLoginMail(loginMail);
         
        try {
            validationPassword( loginPassword );
        } catch ( Exception e ) {
            setErreur( "dateCreation", e.getMessage() );
        }
        uneConnexion.setLoginPassword(loginPassword);
        
        
        return uneConnexion;
    }

}
