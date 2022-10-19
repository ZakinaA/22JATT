package test;


import dao.DaoMembre;
import java.sql.Connection;
import model.Instrument;
import model.Membre;
import model.Statut;
import test.ConnexionBdd;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author sio2
 */
public class TestDaoMembre {
        
    public static void main(String[] args) {        
        Connection con = ConnexionBdd.ouvrirConnexion();
        
        Membre membre = new Membre();
        membre.setNom("Lemoine");
        membre.setPrenom("Julien");        
        membre.setMail("test@normanzik.fr");

        Statut leStatut = new Statut();
        leStatut.setId(1);        
        membre.setStatutMembre(leStatut);
        
        int membreModifie = DaoMembre.modifierUnMembre(con, membre);
        
        System.out.println(membreModifie);
        
        /*Instrument instrumentPrincipal = new Instrument();
        instrumentPrincipal.setId(1);
        
        Statut statut = new Statut();
        statut.setId(1);
        
        membre.setInstrumentPrincipal(instrumentPrincipal);
        membre.setStatutMembre(statut);
        
        Membre leMembreInserer = DaoMembre.ajouterMembre(con, membre);*/
        
        ConnexionBdd.fermerConnexion(con);
    }
}
