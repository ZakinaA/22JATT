/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoGroupe;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Genre;
import model.Groupe;
import model.Membre;
import model.Titre;

/**
 *
 * @author Zakina
 */
public class TestDaoGroupe {
    
    public static void main(String[] args) {
        Connection con = ConnexionBdd.ouvrirConnexion();
        
        Groupe leGroupe = DaoGroupe.getLeGroupe(con, 1);
        System.out.println(leGroupe.getNom());
        ArrayList<Titre> lesTitres  = DaoGroupe.getLesTitresDuGroupe(con, leGroupe.getId());
        ArrayList<Membre> lesMembres  = DaoGroupe.getLesMembresGroupe(con, leGroupe.getId());
        /*for(int memberGroupeOrder = 0; memberGroupeOrder < leGroupe.getLesMembres().size(); memberGroupeOrder++) {                
            System.out.println("Membre du groupe : "+leGroupe.getLesMembres().get(memberGroupeOrder).getPrenom()+" "+leGroupe.getLesMembres().get(memberGroupeOrder).getNom());
                /*Membre unMembre = grp.getLesMembres.get(i);
                System.out.println(unMembre.getPrenom);
        }*/
        
        for(int titreGroupeOrder = 0; titreGroupeOrder < lesTitres.size(); titreGroupeOrder++) {
            System.out.println("Intitule du titre : " + lesTitres.get(titreGroupeOrder).getIntitule());
        }
        
        for(int membreGroupeOrder = 0; membreGroupeOrder < lesMembres.size(); membreGroupeOrder++) {
            System.out.println("Membre du groupe : " + lesMembres.get(membreGroupeOrder).getPrenom()+ " " + lesMembres.get(membreGroupeOrder).getNom());
        }
        
        ArrayList<Groupe> lesGroupes = DaoGroupe.getLesGroupes(con);
        for(int i = 0; i < lesGroupes.size(); i++) {
            Groupe grp = lesGroupes.get(i);
            System.out.println("Nom du groupe"+grp.getNom() + " genre du groupe = "+grp.getGenre().getLibelle()+ ", le membre contact est : "+grp.getMembreContact().getPrenom()+" "+grp.getMembreContact().getNom());

            
        }
        System.out.println(" "); 
        ArrayList<Groupe> lesGroupesDispositif = DaoGroupe.getLesGroupesDispositif(con, 1);
        for(int i = 0; i < lesGroupesDispositif.size(); i++) {
            Groupe grpDispositif = lesGroupesDispositif.get(i);
            System.out.println("Dispositif ("+grpDispositif.getDispositifGroupe().getLibelle()+") : Nom du groupe "+grpDispositif.getNom());
        }
        
        Groupe gp = new Groupe();
        gp.setNom("Les flash");
        gp.setDateCreation("2012-02-21");
        
        Genre genre = new Genre();
        genre.setId(1);
        gp.setGenre(genre);
        
        //Groupe leGroupeInserer = DaoGroupe.ajouterGroupe(con,gp);
        
        
        
        ConnexionBdd.fermerConnexion(con);
    }
    
}
