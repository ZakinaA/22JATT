/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Festival;
import model.Groupe;
import model.Participer_Festival;

/**
 *
 * @author sio2
 */
public class DaoParticiper_Festival {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static Participer_Festival getLaTeteAffiche(Connection connection, int idFestival){
        Participer_Festival uneParticipation = new Participer_Festival();
        
        
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("SELECT * FROM festival, groupe,jouer_festival WHERE groupe.id = jouer_festival.groupeID and festival.idFestival = jouer_festival.festivalID and festival.idFestival=? and jouer_festival.teteAffiche=1");
            requete.setInt(1, idFestival);
            //System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            if ( rs.next() ) {
                
                Festival leFestival = new Festival();
                leFestival.setId(rs.getInt("festival.idFestival"));
                leFestival.setDateDebutFestival(rs.getString("festival.dateDebut"));
                leFestival.setDateFinFestival(rs.getString("festival.dateFin"));
                leFestival.setNom(rs.getString("festival.nom"));
                
                Groupe leGroupe = new Groupe();
                leGroupe.setId(rs.getInt("groupe.id"));
                leGroupe.setNom(rs.getString("groupe.nom"));
                
                
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
        return uneParticipation;
    }
}
