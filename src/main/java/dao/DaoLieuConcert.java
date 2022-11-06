/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DaoConcert.requete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.LieuConcert;

/**
 *
 * @author sio2
 */
public class DaoLieuConcert {
    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;   
    
    
    public static ArrayList<LieuConcert> getLesLieuConcerts(Connection connection){
        ArrayList<LieuConcert> lesLieuConcerts = new ArrayList<LieuConcert>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from lieuconcert ");
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {
                LieuConcert leLieuConcert = new LieuConcert();
                leLieuConcert.setId(rs.getInt("id"));
                leLieuConcert.setNom(rs.getString("nom"));
                leLieuConcert.setVille(rs.getString("ville"));
                leLieuConcert.setSalleNom(rs.getString("salleNom"));
                leLieuConcert.setCp(rs.getString("codePostal"));
  
                lesLieuConcerts.add(leLieuConcert);

            }

                            
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesLieuConcerts;
    }
      public static LieuConcert ajouterLieuConcert(Connection connection, LieuConcert unLieuConcert){
        int idGenere = -1;
        try
            {
                System.out.print("Nom de la salle : " + unLieuConcert.getSalleNom());
            //preparation de la requete
            // gpe_id (clé primaire de la table groupe) est en auto_increment,donc on ne renseigne pas cette valeur
            // le paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO lieuconcert ( nom, ville, salleNom, codePostal)\n" +
                    "VALUES (?,?,?, ?)", requete.RETURN_GENERATED_KEYS );
            requete.setString(1, unLieuConcert.getNom());
            requete.setString(2, unLieuConcert.getVille());
            requete.setString(3, unLieuConcert.getSalleNom());
            requete.setString(4, unLieuConcert.getCp());

            /* Exécution de la requête */
            int resultatRequete = requete.executeUpdate();
            // Récupération de id auto-généré par la bdd dans la table groupe
            rs = requete.getGeneratedKeys();
            if ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unLieuConcert.setId(idGenere);               

            }

            // si le résultat de la requete est différent de 1, c'est que la requête a échoué.
            // Dans ce cas, on remet l'objet groupe à null
            if (resultatRequete != 1){
                unLieuConcert= null;
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unLieuConcert= null;
        }
        return unLieuConcert ;
    }
    
}
