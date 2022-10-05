/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoConnexion;
import java.sql.Connection;
import model.Connexion;

/**
 *
 * @author sio2
 */
public class TestDaoConnexion {
    
    public static void main(String[] args) { 
        Connection con = ConnexionBdd.ouvrirConnexion();
        Connexion uneConnexion = DaoConnexion.getCompte("test@live.fr", "test");
       
        System.out.print("test compte"+uneConnexion.getId());
    }
}
