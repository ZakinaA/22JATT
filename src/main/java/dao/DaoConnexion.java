/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author sio2
 */
public class DaoConnexion {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static int getCompte (Connection connection, String login, String mdp){
    int NormanzikAuthID = -1;
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("SELECT id FROM membre WHERE mail = ? && password = ?");
            requete.setString(1, login);
            requete.setString(2, mdp); // A mettre en md5 pour le futur
            rs=requete.executeQuery();  
            if ( rs.next() ) {
                NormanzikAuthID = rs.getInt("id");
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return NormanzikAuthID;
    }
}

