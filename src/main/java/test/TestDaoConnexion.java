/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoConnexion;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author sio2
 */
public class TestDaoConnexion {
    
    public static void main(String[] args) throws SQLException { 
        Connection con = ConnexionBdd.ouvrirConnexion();
        int uneConnexion = DaoConnexion.getCompte(con,"test@live.fr", "testPassword");
       
        System.out.print("test compte id :  "+uneConnexion);
    }
}
