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
import model.Groupe;
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
    static PreparedStatement requeteInstrumentMembre=null;
    static ResultSet rsInstrumentMembre=null;   
    
    public static Membre ajouterMembre(Connection connection, Membre unMembre){
        int idGenere = -1;
        ArrayList<Instrument> lesInstruments = new  ArrayList<Instrument>();
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
                
                Instrument leInstrument = new Instrument();
                leInstrument.setLibelle("Test insert");                
                leInstrument.setEstInstrumentPrincipal(1);                
                unMembre.setInstrumentPrincipal(leInstrument);    
                lesInstruments.add(leInstrument);      
                unMembre.setId(idGenere);     
                
                
                Instrument unInstrument = new Instrument();
                unInstrument.setLibelle("Test insert");  
                
                unInstrument.setEstInstrumentPrincipal(0);   
                lesInstruments.add(unInstrument);   
                
                unMembre.setLesInstruments(lesInstruments);  
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
        ArrayList<Instrument> lesInstruments = new  ArrayList<Instrument>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("SELECT nom,prenom,mail, statut.libelle as statutLibelle,statut.id as statutID, instrument.libelle as instrumentLibelle,instrument.id as instrumentID FROM membre,statut, instrument WHERE statut.id = membre.statutID && instrument.id = membre.instrumentPrincipalID && membre.id = ?");
            requete.setInt(1, idMembre);
            
            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            if ( rs.next() ) {
                leMembre.setId(idMembre);
                leMembre.setNom(rs.getString("nom"));
                leMembre.setPrenom(rs.getString("prenom"));
                leMembre.setMail(rs.getString("mail"));
                
                Statut leStatut = new Statut();
                leStatut.setId(rs.getInt("statutID"));                
                leStatut.setLibelleStatut(rs.getString("statutLibelle"));                
                leMembre.setStatutMembre(leStatut);
                
                Instrument leInstrumentPrincipal = new Instrument();
                leInstrumentPrincipal.setId(rs.getInt("instrumentID"));      
                leInstrumentPrincipal.setLibelle(rs.getString("instrumentLibelle"));                
                leInstrumentPrincipal.setEstInstrumentPrincipal(1);                
                leMembre.setInstrumentPrincipal(leInstrumentPrincipal);    
                lesInstruments.add(leInstrumentPrincipal);      
                /*Instrument unInstrument = new Instrument();
                unInstrument.setLibelle(rs.getString("instrumentLibelle"));      */ 
                
                    
                
                //preparation de la requete
                requeteInstrumentMembre=connection.prepareStatement("SELECT DISTINCT libelle FROM jouer_groupe, instrument where instrument.id = instrumentID && jouer_groupe.membreID = ?");
                requeteInstrumentMembre.setInt(1, idMembre);               

                //executer la requete
                rsInstrumentMembre=requeteInstrumentMembre.executeQuery();

                //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
                while ( rsInstrumentMembre.next() ) {
                    Instrument unInstrument = new Instrument();
                
                    unInstrument.setLibelle(rsInstrumentMembre.getString("libelle"));                
                    unInstrument.setEstInstrumentPrincipal(0);   
                    lesInstruments.add(unInstrument);          
                }
                leMembre.setLesInstruments(lesInstruments); 
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
            requete=connection.prepareStatement("SELECT * FROM membre,  statut WHERE statut.id = membre.statutID");
            System.out.println("Requete" + requete);

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
    
    public static ArrayList<Groupe> getLesGroupesMembre(Connection connection, int idMembre) {
        ArrayList<Groupe> lesGroupes = new  ArrayList<Groupe>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("SELECT groupe.id, groupe.nom as groupeNom, groupe.dateCreation as dateCreationGroupe FROM groupe_membres, groupe where groupe.id = groupe_membres.groupeID && groupe_membres.membreID = ?");
            requete.setInt(1, idMembre);
            //System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Groupe leGroupe = new Groupe();
                leGroupe.setId(rs.getInt("groupe.id"));
                leGroupe.setNom(rs.getString("groupeNom"));
                leGroupe.setDateCreation(rs.getString("dateCreationGroupe"));


                
                lesGroupes.add(leGroupe);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesGroupes ;
    }
    
    public static int modifierUnMembre(Connection connection, Membre unMembre){
        Membre leMembre = new Membre();
        int resultatType = -1;
        try
        {
            requete=connection.prepareStatement("UPDATE membre SET nom = ?, prenom = ?, mail = ?,statutID = ? WHERE id = 1");

            requete.setString(1, unMembre.getNom());
            requete.setString(2, unMembre.getPrenom());
            requete.setString(3, unMembre.getMail());
            requete.setInt(4, unMembre.getStatutMembre().getId());
            System.out.println(requete);
            rs=requete.executeQuery();
            resultatType = 1;
        }
            
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");            
            resultatType = 0;
        }
        return resultatType;
    }
    
}
