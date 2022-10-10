/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoConcert;
import java.sql.Connection;
import java.util.ArrayList;
import model.Concert;

/**
 *
 * @author sio2
 */
public class TestDaoConcert {
    
     public static void main(String[] args) {
        Connection con = ConnexionBdd.ouvrirConnexion();
        ArrayList<Concert> lesConcert = DaoConcert.getLesConcerts(con);
        for(int dispositifOrder = 0; dispositifOrder < lesConcert.size(); dispositifOrder++) {
            Concert ct = lesConcert.get(dispositifOrder);
            System.out.println("Nom du dispositif : "+ct.getDateConcert()+", en : "+ct.getLieuConcertId());
        }
    }
}
