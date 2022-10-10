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
            requete=connection.prepareStatement("select * from festival ORDER by  ASC");
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {
                Festival leFestival = new Festival();
                leFestival.setId(rs.getInt("dispositif.id"));
                leFestival.setDateFestival(rs.getString("dispositif.annee"));
                leFestival.setNom(rs.getString("dispositif.libelle"));
                
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
}
