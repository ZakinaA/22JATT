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
import model.Dispositif;
import model.Genre;
import model.Groupe;
import model.Membre;
import model.Titre;

/**
 *
 * @author Zakina
 */
public class DaoGroupe {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    static ResultSet rsMembreGroupe=null;
    static PreparedStatement requeteMembreGroupe=null;

    public static ArrayList<Groupe> getLesGroupes(Connection connection) {
        ArrayList<Groupe> lesGroupes = new  ArrayList<Groupe>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from groupe, genre_musical where genreID = genre_musical.id");
            //System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Groupe leGroupe = new Groupe();
                leGroupe.setId(rs.getInt("groupe.id"));
                leGroupe.setNom(rs.getString("groupe.nom"));
                leGroupe.setDateCreation(rs.getString("groupe.dateCreation"));
                leGroupe.setTelephone(rs.getString("groupe.telephone"));
                leGroupe.setMelSiteWeb(rs.getString("groupe.melSiteWeb"));
                leGroupe.setLieuRepetition(rs.getString("groupe.lieuRepetition"));

                
                Genre leGenre = new Genre();
                leGenre.setId(rs.getInt("genre_musical.id"));
                leGenre.setLibelle(rs.getString("genre_musical.libelle"));
                
                /*Membre leMembreContact = new Membre();
                leMembreContact.setId(rs.getInt("membre.id"));
                leMembreContact.setNom(rs.getString("membre.nom"));
                leMembreContact.setPrenom(rs.getString("membre.prenom"));*/
                
                leGroupe.setGenre(leGenre);
                //leGroupe.setMembreContact(leMembreContact);
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
    
    public static Groupe getLeGroupe(Connection connection, int idGroupe){

        Groupe leGroupe = new Groupe();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from groupe, genre_musical,membre where groupe.genreID = genre_musical.id  and groupe.id=? ");
            requete.setInt(1, idGroupe);
            //System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            if ( rs.next() ) {
                leGroupe.setId(rs.getInt("groupe.id"));
                leGroupe.setNom(rs.getString("groupe.nom"));
                leGroupe.setDateCreation(rs.getString("groupe.dateCreation"));
                leGroupe.setLieuRepetition(rs.getString("groupe.lieuRepetition"));

                Genre leGenre = new Genre();
                leGenre.setId(rs.getInt("genre_musical.id"));
                leGenre.setLibelle(rs.getString("genre_musical.libelle"));
                                                               
                leGroupe.setGenre(leGenre);
                
                Membre leMembreContact = new Membre();
                leMembreContact.setId(rs.getInt("membre.id"));
                leMembreContact.setNom(rs.getString("membre.nom"));
                leMembreContact.setPrenom(rs.getString("membre.prenom"));
                leGroupe.setMembreContact(leMembreContact);

            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leGroupe ;
    }

    public static ArrayList<Titre> getLesTitresDuGroupe(Connection connection, int idGroupe) {
        ArrayList<Titre> lesTitres = new  ArrayList<Titre>();
        try
        {                    
            //preparation de la requete
            requete=connection.prepareStatement("select numero,intitule,duree,lienURL from titre where groupeID = ?");
            requete.setInt(1, idGroupe);
            //System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {
                Titre unTitre = new Titre();
                unTitre.setId(rs.getInt("numero"));
                unTitre.setIntitule(rs.getString("intitule"));
                unTitre.setDuree(rs.getString("duree"));
                unTitre.setLienURL(rs.getString("lienURL"));
                lesTitres.add(unTitre);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesTitres ;
    }
    
    public static ArrayList<Membre> getLesMembresGroupe(Connection connection, int idGroupe) {
        ArrayList<Membre> lesMembres = new  ArrayList<Membre>();
        try
        {                    
            //preparation de la requete
            requeteMembreGroupe=connection.prepareStatement("select * from groupe_membres, membre where membre.id = membreID && groupeID = ?");
            requeteMembreGroupe.setInt(1, idGroupe);
            //System.out.println("Requete" + requeteMembreGroupe);


            rsMembreGroupe=requeteMembreGroupe.executeQuery();
            while ( rsMembreGroupe.next() ) {
                Membre unMembre = new Membre();
                unMembre.setId(rsMembreGroupe.getInt("membre.id"));
                unMembre.setNom(rsMembreGroupe.getString("membre.nom"));
                unMembre.setPrenom(rsMembreGroupe.getString("membre.prenom"));
                lesMembres.add(unMembre);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesMembres ;
    }
    
    public static Groupe ajouterGroupe(Connection connection, Groupe unGroupe){
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // gpe_id (clé primaire de la table groupe) est en auto_increment,donc on ne renseigne pas cette valeur
            // le paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO GROUPE ( nom, dateCreation, genreID, telephone, melSiteWeb, dispositifID)\n" +
                    "VALUES (?,?,?, ?, ?, ?)", requete.RETURN_GENERATED_KEYS );
            requete.setString(1, unGroupe.getNom());
            requete.setString(2, unGroupe.getDateCreation());
            requete.setInt(3, unGroupe.getGenre().getId());
            requete.setString(4, unGroupe.getTelephone());
            requete.setString(5, unGroupe.getMelSiteWeb());
            requete.setInt(6, unGroupe.getDispositifGroupe().getId());
            System.out.println("requeteInsertion=" + requete);
            /* Exécution de la requête */
            int resultatRequete = requete.executeUpdate();
            System.out.println("resultatrequete=" + resultatRequete);

            // Récupération de id auto-généré par la bdd dans la table groupe
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unGroupe.setId(idGenere);
            }

            // si le résultat de la requete est différent de 1, c'est que la requête a échoué.
            // Dans ce cas, on remet l'objet groupe à null
            if (resultatRequete != 1){
                unGroupe= null;
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unGroupe= null;
        }
        return unGroupe ;
    }
    
    public static ArrayList<Groupe> getLesGroupesDispositif(Connection connection, int idDispositif){
        ArrayList<Groupe> lesGroupes = new  ArrayList<Groupe>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from groupe, dispositif where dispositifID = dispositif.id && dispositif.id = ?");
            requete.setInt(1, idDispositif);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Groupe leGroupe = new Groupe();
                leGroupe.setId(rs.getInt("groupe.id"));
                leGroupe.setNom(rs.getString("groupe.nom"));
                leGroupe.setDateCreation(rs.getString("groupe.dateCreation"));

                Dispositif leDispositif = new Dispositif();
                leDispositif.setId(rs.getInt("dispositif.id"));
                leDispositif.setLibelle(rs.getString("dispositif.libelle"));
                leDispositif.setAnnee(rs.getString("dispositif.annee"));
                
                leGroupe.setDispositifGroupe(leDispositif);
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
    
}
