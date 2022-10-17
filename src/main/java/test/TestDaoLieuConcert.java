/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoLieuConcert;
import java.sql.Connection;
import java.util.ArrayList;
import model.LieuConcert;

/**
 *
 * @author sio2
 */
public class TestDaoLieuConcert {
    
    
   public static void main(String[] args) {
        Connection con = ConnexionBdd.ouvrirConnexion();
        ArrayList<LieuConcert> lesLieuConcert = DaoLieuConcert.getLesLieuConcerts(con);
        for(int dispositifOrder = 0; dispositifOrder < lesLieuConcert.size(); dispositifOrder++) {
            LieuConcert ct = lesLieuConcert.get(dispositifOrder);
            System.out.println("Nom du lieu : "+ct.getNom()+", ville : "+ct.getVille());
        }
        
        LieuConcert lieuconcert =  new LieuConcert();  
        lieuconcert.setNom("LesEtoiles");
        lieuconcert.setVille("Caen");
        lieuconcert.setCp(14000);
        lieuconcert.setSalleNom("Théâtre ");
                
        LieuConcert leConcertInserer = DaoLieuConcert.ajouterLieuConcert(con,lieuconcert);
   }
}
