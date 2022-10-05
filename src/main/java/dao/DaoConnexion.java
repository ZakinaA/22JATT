/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Connexion;

/**
 *
 * @author sio2
 */
public class DaoConnexion {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static Connexion getCompte (Connection connection, String login, String mdp) {
    int idGenere = -1;
        try
        {

            // preparation de la requete
            requete.SetString (1, login);
            requete.setString (2, mdp);
            //executer la requete
            rs=requete.execute.Query();   
        }
    }
}

