/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author sio2
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Concert;
import model.Groupe;
import model.LieuConcert;


public class DaoConcert {
    
   Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    
    public static ArrayList<Concert> getLesConcerts(Connection connection){
        ArrayList<Concert> lesConcerts = new ArrayList<Concert>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from jouer_concert,lieuconcert,groupe WHERE jouer_concert.lieuConcertID=lieuconcert.id AND jouer_concert.groupeID = groupe.id");

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {
                Concert leConcert = new Concert();
                leConcert.setDateConcert(rs.getString("jouer_concert.dateConcert"));
               
                leConcert.setHeureDebut(rs.getString("jouer_concert.HeureDebut"));
                leConcert.setHeureFin(rs.getString("jouer_concert.HeureFin"));
                
                LieuConcert lieuConcertId = new LieuConcert();
                lieuConcertId.setId(rs.getInt("lieuconcert.id"));
                lieuConcertId.setNom(rs.getString("lieuconcert.nom"));
                lieuConcertId.setVille(rs.getString("lieuconcert.ville"));
                lieuConcertId.setCp(rs.getString("lieuconcert.codePostal"));
                lieuConcertId.setSalleNom(rs.getString("lieuconcert.salleNom"));               
                
                Groupe GroupeConcertId = new Groupe();
                GroupeConcertId.setNom(rs.getString("groupe.nom"));        
                
                leConcert.setLieuConcertId(lieuConcertId);
                leConcert.setGroupeConcertId(GroupeConcertId);
                lesConcerts.add(leConcert);
            } 
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesConcerts;
    }
    
    public static int ajouterConcert(Connection connection, Concert unConcert){
        int idGenere = -1;

        try
            {
            
                requete=connection.prepareStatement("INSERT INTO jouer_concert (groupeID, lieuConcertID, dateConcert, heureDebut, heureFin)\n" +
                        "VALUES (?,?, ?, ?, ?)", requete.RETURN_GENERATED_KEYS );
                requete.setInt(1, unConcert.getGroupeConcertId().getId());    
                requete.setInt(2, unConcert.getLieuConcertId().getId());
                requete.setString(3, unConcert.getDateConcert());       
                requete.setString(4, unConcert.getHeureDebut());    
                requete.setString(5, unConcert.getHeureFin());  
                
                System.out.println(unConcert.getLieuConcertId().getId()+ " " + unConcert.getLieuConcertId().getId() + " " + unConcert.getDateConcert());
          
                /* Exécution de la requête */
                int resultatRequete = requete.executeUpdate();

                // Récupération de id auto-généré par la bdd dans la table groupe
                rs = requete.getGeneratedKeys();
                if ( rs.next() ) {
                    idGenere = rs.getInt( 1 );
                }

                // si le résultat de la requete est différent de 1, c'est que la requête a échoué.
                // Dans ce cas, on remet l'objet groupe à null
                if (resultatRequete != 1){
                    idGenere= 0;
                }
            }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            idGenere= 0;
        }
        return idGenere ;
    }
}
