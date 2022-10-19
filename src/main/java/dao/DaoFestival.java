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
import model.Festival;
import model.Groupe;
import model.Participer_Festival;

/**
 *
 * @author sio2
 */
public class DaoFestival {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    
    public static ArrayList<Festival> getLesFestivals(Connection connection){
        ArrayList<Festival> lesFestivals = new ArrayList<Festival>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from festival");
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            while ( rs.next() ) {
                Festival leFestival = new Festival();
                leFestival.setId(rs.getInt("festival.idFestival"));
                leFestival.setDateDebutFestival(rs.getString("festival.dateDebut"));
                leFestival.setDateFinFestival(rs.getString("festival.dateFin"));
                leFestival.setNom(rs.getString("festival.nom"));
                
                lesFestivals.add(leFestival);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesFestivals;
    }
    
    public static Festival getLeFestival(Connection connection, int idFestival){
        Festival leFestival = new Festival();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from festival, groupe,participer_festival "
                    + "where groupe.id = participer_festival.idGroupe and festival.idFestival = participer_festival.idFestival and festival.idFestival=?");
            requete.setInt(1, idFestival);
            //System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            if ( rs.next() ) {
                leFestival.setId(rs.getInt("festival.idFestival"));
                leFestival.setDateDebutFestival(rs.getString("festival.dateDebut"));
                leFestival.setDateFinFestival(rs.getString("festival.dateFin"));
                leFestival.setNom(rs.getString("festival.nom"));

                Groupe leGroupe = new Groupe();
                leGroupe.setId(rs.getInt("groupe.id"));
                leGroupe.setNom(rs.getString("groupe.nom"));
                
                Participer_Festival uneParticipation = new Participer_Festival();
                uneParticipation.setTeteAffiche(rs.getString("participer_festival.teteAffiche"));
                
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leFestival ;
    }
    
    /*public static Festival getLaTeteAffiche(Connection connection, int idFestival){
        Festival leFestival = new Festival();
        
        
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from festival, groupe,participer_festival "
                    + "where groupe.id = participer_festival.idGroupe and festival.idFestival = participer_festival.idFestival and festival.idFestival=? and participer_festival.teteAffiche=1");
            requete.setInt(1, idFestival);
            //System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            if ( rs.next() ) {
                
                leFestival.setId(rs.getInt("festival.idFestival"));
                leFestival.setDateDebutFestival(rs.getString("festival.dateDebut"));
                leFestival.setDateFinFestival(rs.getString("festival.dateFin"));
                leFestival.setNom(rs.getString("festival.nom"));
                
                Groupe leGroupe = new Groupe();
                leGroupe.setId(rs.getInt("groupe.id"));
                leGroupe.setNom(rs.getString("groupe.nom"));
                
                Participer_Festival uneParticipation = new Participer_Festival();
                uneParticipation.setUnFestival(leFestival);
                uneParticipation.setUnGroupe(leGroupe);
                uneParticipation.setTeteAffiche(leGroupe.getNom());
                
                
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leFestival;
    }*/

    public static Festival ajouterFestival(Connection connection, Festival unFestival){
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // gpe_id (clé primaire de la table groupe) est en auto_increment,donc on ne renseigne pas cette valeur
            // le paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.   
            /* Exécution de la requête*/ 
            int resultatRequete = requete.executeUpdate();
            System.out.println("resultatrequete=" + resultatRequete);

            // Récupération de id auto-généré par la bdd dans la table groupe
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unFestival.setId(idGenere);
            }
            if(rs.next()){
                requete=connection.prepareStatement("INSERT INTO FESTIVAL ( nom, dateDebut, dateFin)\n" +
                    "VALUES (?,?,?)", requete.RETURN_GENERATED_KEYS );
                requete.setString(1, unFestival.getNom());
                requete.setString(2, unFestival.getDateDebutFestival());
                requete.setString(3, unFestival.getDateFinFestival());
            }
            // si le résultat de la requete est différent de 1, c'est que la requête a échoué.
            // Dans ce cas, on remet l'objet groupe à null
            if (resultatRequete != 1){
                unFestival= null;
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unFestival= null;
        }
        return unFestival ;
    }
    
    
}
