/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Instrument;
import model.Membre;
import model.Statut;

/**
 *
 * @author sio2
 */
public class DaoMembre {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;   
    static PreparedStatement requeteStatut=null;
    
    
    public static Membre ajouterMembre(Connection connection, Membre unMembre){
        int idGenere = -1;
        try
            {
            //preparation de la requete
            // gpe_id (clé primaire de la table groupe) est en auto_increment,donc on ne renseigne pas cette valeur
            // le paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            if(unMembre.getInstrumentPrincipal().getId() == -1) {
                int idInstrumentGenere = -1;
                
                requete=connection.prepareStatement("INSERT INTO instrument (libelle)\n" +
                    "VALUES (?)", requete.RETURN_GENERATED_KEYS );
                requete.setString(1, unMembre.getInstrumentPrincipal().getLibelle());
                int resultatRequete = requete.executeUpdate();
                // Récupération de id auto-généré par la bdd dans la table groupe
                rs = requete.getGeneratedKeys();
                if ( rs.next() ) {
                    idInstrumentGenere = rs.getInt( 1 );
                
                
                    requete=connection.prepareStatement("INSERT INTO membre ( nom, prenom, instrumentPrincipalID, statutID, mail, password)\n" +
                            "VALUES (?,?,?,?, ?, ?)", requete.RETURN_GENERATED_KEYS );
                    requete.setString(1, unMembre.getNom());
                    requete.setString(2, unMembre.getPrenom());
                    requete.setInt(3, idInstrumentGenere);
                    requete.setInt(4, unMembre.getStatutMembre().getId());            
                    requete.setString(5, unMembre.getMail());  
                    requete.setString(6, unMembre.getMotDePasse());  
                }
                
            } else {
                requete=connection.prepareStatement("INSERT INTO membre ( nom, prenom, instrumentPrincipalID, statutID, mail, password)\n" +
                        "VALUES (?,?,?,?, ?, ?)", requete.RETURN_GENERATED_KEYS );
                requete.setString(1, unMembre.getNom());
                requete.setString(2, unMembre.getPrenom());
                requete.setInt(3, unMembre.getInstrumentPrincipal().getId());
                requete.setInt(4, unMembre.getStatutMembre().getId());            
                requete.setString(5, unMembre.getMail());  
                requete.setString(6, unMembre.getMotDePasse());                  
            }   
                

            System.out.println("requeteInsertion=" + requete);
            
            
            /* Exécution de la requête */
            int resultatRequete = requete.executeUpdate();
            System.out.println("resultatrequete=" + resultatRequete);

            // Récupération de id auto-généré par la bdd dans la table groupe
            rs = requete.getGeneratedKeys();
            if ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unMembre.setId(idGenere);               

            }

            // si le résultat de la requete est différent de 1, c'est que la requête a échoué.
            // Dans ce cas, on remet l'objet groupe à null
            if (resultatRequete != 1){
                unMembre= null;
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unMembre= null;
        }
        return unMembre ;
    }
    
    public static Membre getLeMembre(Connection connection, int idMembre){

        Membre leMembre = new Membre();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("SELECT nom,prenom, instrumentPrincipalID,statut.libelle as statutLibelle, instrument.libelle as instrumentLibelle FROM membre,statut, instrument WHERE statut.id = membre.statutID && instrument.id = membre.instrumentPrincipalID && membre.id = ?");
            requete.setInt(1, idMembre);
            //System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            if ( rs.next() ) {
                leMembre.setNom(rs.getString("nom"));
                leMembre.setPrenom(rs.getString("prenom"));
                
                Statut leStatut = new Statut();
                leStatut.setLibelleStatut(rs.getString("statutLibelle"));                
                leMembre.setStatutMembre(leStatut);
                
                Instrument leInstrument = new Instrument();
                leInstrument.setLibelle(rs.getString("instrumentLibelle"));                
                leMembre.setInstrumentPrincipal(leInstrument);                
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leMembre ;
    }    
    
    public static ArrayList<Membre> getLesMembres(Connection connection) {
        ArrayList<Membre> lesMembres = new  ArrayList<Membre>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from membre,  statut where statut.id = membre.statutID");
            //System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Membre leMembre = new Membre();
                leMembre.setId(rs.getInt("membre.id"));
                leMembre.setNom(rs.getString("membre.nom"));
                leMembre.setPrenom(rs.getString("membre.prenom"));
                
                Statut leStatut = new Statut();
                leStatut.setId(rs.getInt("statut.id")); 
                leStatut.setLibelleStatut(rs.getString("statut.libelle"));
                
                leMembre.setStatutMembre(leStatut);
                
                
                
                lesMembres.add(leMembre);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesMembres ;
    }    
}
