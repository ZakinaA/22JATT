/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoFestival;
import java.sql.Connection;
import java.util.ArrayList;
import model.Festival;

/**
 *
 * @author sio2
 */
public class TestDaoFestival {
    
    public static void main(String[] args) {
        Connection con = ConnexionBdd.ouvrirConnexion();
        ArrayList<Festival> lesFestivals = DaoFestival.getLesFestivals(con);
        for (Festival unFestival : lesFestivals) {
            System.out.println(unFestival.getNom());
    
        }
        
        Festival leFestival = new Festival();
        leFestival = DaoFestival.getLeFestival(con, 4);
        System.out.println(leFestival.getNom()+ " "+ leFestival.getDateDebutFestival()+ " "+leFestival.getDateFinFestival());
    }
}
