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
            requete=connection.prepareStatement("select * from jouer_concert,lieuconcert,groupe WHERE jouer_concert.lieuConcertID=lieuconcert.id AND jouer_concert.groupeID = groupe.id ");
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {
                Concert leConcert = new Concert();
                leConcert.setDateConcert(rs.getString("jouer_concert.dateConcert"));
                leConcert.setHeureDebut(rs.getString("jouer_concert.HeureDebut"));
               leConcert.setHeureFin(rs.getString("jouer_concert.HeureFin"));
               leConcert.setId(rs.getInt("jouer_concert.id"));
 
                
                LieuConcert lieuConcertId = new LieuConcert();
                lieuConcertId.setId(rs.getInt("lieuconcert.id"));
                lieuConcertId.setNom(rs.getString("lieuconcert.nom"));
                lieuConcertId.setVille(rs.getString("lieuconcert.ville"));
                lieuConcertId.setCp(rs.getInt("lieuconcert.codePostal"));
                lieuConcertId.setSalleNom(rs.getString("lieuconcert.salleNom"));
                
                
                Groupe GroupeConcertId = new Groupe();
                GroupeConcertId.setNom(rs.getString("groupe.nom"));
                GroupeConcertId.setId(rs.getInt("groupe.id"));
                

                
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
    
        public static Concert ajouterConcert(Connection connection, Concert unConcert){
    int idGenere = -1;
        try
        {
            //preparation de la requete
            // gpe_id (clé primaire de la table groupe) est en auto_increment,donc on ne renseigne pas cette valeur
            // le paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO jouer_concert ( dateConcert, HeureDebut, HeureFin, groupeID, lieuConcertID)\n" +
                    "VALUES (?,?,?,?,?)", requete.RETURN_GENERATED_KEYS );
            requete.setString(1, unConcert.getDateConcert());
            requete.setString(2, unConcert.getHeureDebut());
            requete.setString(3, unConcert.getHeureFin());
            requete.setInt(4, unConcert.getGroupeConcertId().getId());
            requete.setInt(5, unConcert.getLieuConcertId().getId());


            System.out.println("requeteInsertion=" + requete);
            /* Exécution de la requête */
            int resultatRequete = requete.executeUpdate();
            System.out.println("resultatrequete=" + resultatRequete);

            // Récupération de id auto-généré par la bdd dans la table groupe
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unConcert.setId(idGenere);
            }

            // si le résultat de la requete est différent de 1, c'est que la requête a échoué.
            // Dans ce cas, on remet l'objet groupe à null
            if (resultatRequete != 1){
                unConcert= null;
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unConcert= null;
        }
        return unConcert ;
    }
}
