/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoInstrument;
import java.sql.Connection;
import java.util.ArrayList;
import model.Instrument;
import model.Membre;
import model.Titre;

/**
 *
 * @author sio2
 */
public class TestDaoInstrument {
    public static void main(String[] args) {   
        Connection con = ConnexionBdd.ouvrirConnexion();


        Instrument leInstrument = DaoInstrument.getInstrument(con, 2);
        System.out.println("Nom de l'instrument : " + leInstrument.getLibelle());
        
        ArrayList<Membre> lesMembres  = DaoInstrument.getLesMembresInstrumentPrincipal(con, leInstrument.getId());
        System.out.println("Les membres jouant de cette istrument : ");
        for(int membreOrder = 0; membreOrder < lesMembres.size(); membreOrder++) {
            System.out.println(lesMembres.get(membreOrder).getPrenom()+" " + lesMembres.get(membreOrder).getNom() + "(Membre ID : "+lesMembres.get(membreOrder).getId()+")");
        }
        
        ConnexionBdd.fermerConnexion(con);
    }
}
