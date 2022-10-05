/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author sio2
 */
public class DaoConnexion {
    
}

public static Compte getCompte (Connection connection, String login, String mdp) {

    try
    {
    
        // preparation de la requete
        requete.SetString (1, login);
        requete.setString (2, mdp);
        //executer la requete
        rs=requete.execute.Query();   
    }
}