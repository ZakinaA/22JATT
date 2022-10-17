/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Connexion;
import model.Membre;

/**
 *
 * @author sio2
 */
public class DaoConnexion {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static Connexion getCompte (Connection connection, Connexion uneConnexion){        
        Connexion laConnexion = new Connexion();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("SELECT id,gradeID,prenom,nom FROM membre WHERE mail = ? && password = ?");
            requete.setString(1, uneConnexion.getLoginMail());
            requete.setString(2, uneConnexion.getLoginPassword()); // A mettre en md5 pour le futur
            System.out.println("Requete" + requete);
            rs=requete.executeQuery();  

            if ( rs.next() ) {                
                laConnexion.setId(rs.getInt("id"));
                laConnexion.setGradeID(rs.getInt("gradeID"));
                
                Membre leMembreInformation = new Membre();
                leMembreInformation.setPrenom(rs.getString("prenom"));
                leMembreInformation.setNom(rs.getString("nom")); 
                
                laConnexion.setMembre(leMembreInformation);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            laConnexion = null;
        }
        return laConnexion;
    }
}

