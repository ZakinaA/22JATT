/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoConcert;
import java.sql.Connection;
import java.util.ArrayList;
import model.Concert;
import model.Groupe;
import model.LieuConcert;
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
            System.out.println("Nom du dispositif : "+ct.getDateConcert()+", en : "+ct.getLieuConcertId()+"le lieu du concert"+ct.getLieuConcertId().getVille()+"le nom du groupe"+ct.getGroupeConcertId().getNom());
        }
         
        Concert concert = new Concert();
        concert.setDateConcert("2022-12-01");
        concert.setHeureDebut("21h30");
        concert.setHeureFin("01h00");
      
        Groupe groupeConcert = new Groupe();
        groupeConcert.setId(1);
        
        LieuConcert lieuconcert = new LieuConcert();
        lieuconcert.setId(1);
       
        concert.setGroupeConcertId(groupeConcert);
        concert.setLieuConcertId(lieuconcert);
        
        Concert leConcertInserer = DaoConcert.ajouterConcert(con,concert);
        
         ConnexionBdd.fermerConnexion(con);
    }
     
}
