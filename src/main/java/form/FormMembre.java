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
import model.Instrument;
import model.Membre;
import model.Statut;

/**
 *
 * @author sio2
 */
public class FormMembre {
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
    
    //méthode de validation du champ de saisie nom
    private void validationNom( String nom ) throws Exception {
        if ( nom != null && nom.length() < 3 ) {
            throw new Exception( "Le nom du membre doit contenir au moins 3 caractères." );
        }
    }
    
    private void validationPrenom( String prenom ) throws Exception {
        if ( prenom != null && prenom.length() < 3 ) {
            throw new Exception( "Le prenom du membre doit contenir au moins 3 caractères." );
        }
    }
    
    private void validationMotDePasse( String MotDePasse, String verifMotDePasse ) throws Exception {
        if (verifMotDePasse == null) {
            throw new Exception( "Les deux mots de passe doivent correspondre" + verifMotDePasse + MotDePasse);
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
    
    public Membre ajouterMembre(HttpServletRequest request ) {

        Membre unMembre  = new Membre();

        //récupération dans des variables des données saisies dans les champs de formulaire
        String nom = getDataForm( request, "nom" );
        String prenom = getDataForm( request, "prenom");
        String mail = getDataForm(request, "mail");
        String motDePasse = getDataForm( request, "motdePasse");
        String verifMotDePasse = getDataForm( request, "verifMotDePasse");
        int instrumentPrincipalID = Integer.parseInt(getDataForm( request, "instrumentPrincipalID" ));
        int statutID = Integer.parseInt(getDataForm( request, "statutID" ));
        try {
            validationNom( nom );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        unMembre.setNom(nom);
        
        try {
            validationNom( prenom );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        unMembre.setPrenom(prenom);
        
        try {
            validationNom( nom );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        unMembre.setNom(nom);
         
        try {
            validationMotDePasse( motDePasse, verifMotDePasse );
        } catch ( Exception e ) {
            setErreur( "motDePasse", e.getMessage() );
        }
        
        unMembre.setMotDePasse(getMd5(motDePasse));
        
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
        unMembre.setMail(mail);
        return unMembre;
     }
}
