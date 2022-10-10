/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package form;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
        if (login.contains("@") == false) {
            throw new Exception( "Merci de saisir une adresse mail valide <i>adresse@domaine</i>" );
        }
    }
    
    private void validationPassword( String password ) throws Exception {
        if (password == null) {
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
    
        public static String getMd5(String input)
    {
        try {
 
            // Static getInstance method is called with hashing MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
 
            // digest() method is called to calculate message digest
            // of an input digest() return array of byte
            byte[] messageDigest = md.digest(input.getBytes());
 
            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);
 
            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        }
 
        // For specifying wrong message digest algorithms
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
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
        uneConnexion.setLoginPassword(getMd5(loginPassword));
        
        
        return uneConnexion;
    }

}
