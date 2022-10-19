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
            System.out.println("Requete" + requete);

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
                lieuConcertId.setCp(rs.getInt("lieuconcert.codePostal"));
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
}
