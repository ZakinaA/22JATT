/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoDispositif;
import java.sql.Connection;
import java.util.ArrayList;
import model.Dispositif;
import model.Groupe;

/**
 *
 * @author sio2
 */
/*
public class TestDaoDispositif {
        
    public static void main(String[] args) {
        Connection con = ConnexionBdd.ouvrirConnexion();
        ArrayList<Dispositif> lesDispositif = DaoDispositif.getLesDispositifs(con);
        for(int dispositifOrder = 0; dispositifOrder < lesDispositif.size(); dispositifOrder++) {
            Dispositif disp = lesDispositif.get(dispositifOrder);
            System.out.println("Nom du dispositif : "+disp.getLibelle()+", en : "+disp.getAnnee().substring(0,4));
            
        }
        
        Dispositif dispositif = new Dispositif();
        dispositif.setLibelle("Nor'Zik24");
        dispositif.setAnnee("2024");
        
        Dispositif leDispositifInserer = DaoDispositif.ajouterDispositif(con,dispositif);
    }
}
*/