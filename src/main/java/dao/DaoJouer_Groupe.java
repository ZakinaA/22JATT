/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DaoInstrument.rs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Instrument;
import model.Jouer_Groupe;
import model.Membre;
import test.ConnexionBdd;

/**
 *
 * @author sio2
 */
/*public class DaoJouer_Groupe {
    public static void main(String[] args) {   
        Connection connection=null;
        static PreparedStatement requete=null;
        static ResultSet rs=null;
        /*public static Instrument getGroupeInstrumentMembre(Connection connection, int groupeID){        
            Instrument leInstrument = new Instrument();

            try
            {
                requete=connection.prepareStatement("select nom,prenom,groupe.nom as groupeNom FROM membre, groupe, jouer_groupe WHERE membre.id = membreID && groupeID = ?");
                requete.setInt(1, groupeID);
                rs=requete.executeQuery();

                while (rs.next()) {
                    Membre unMembre = new Membre();
                    unMembre.setId(rs.getInt("id"));
                    unMembre.setPrenom(rs.getString("prenom"));
                    unMembre.setNom(rs.getString("nom"));
                    leInstrument.addLesMembres(unMembre);

                }
            }
            catch (SQLException e)
            {
                e.printStackTrace();
                //out.println("Erreur lors de l’établissement de la connexion");
            }
            return leInstrument;
        }
    }
}*/
