/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.util.ArrayList;
/**
 *
 * @author sio2
 */
public class Membre {
   
    private int id;
    private String nom;
    private String prenom;
    private ArrayList<Groupe> lesGroupes;
    private Instrument instrumentPrincipal; // On récupère l'instrument principal du membre
    private Statut StatutMembre;
    
    public Membre() {
    }
    public Membre(int id, String nom, String prenom, Instrument instrumentPrincipal, Statut StatutMembre) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.instrumentPrincipal = instrumentPrincipal;
        this.StatutMembre = StatutMembre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

     public ArrayList<Groupe> getLesGroupes() {
        return lesGroupes;
    }

    public void setLesGroupes(ArrayList<Groupe> lesGroupes) {
        this.lesGroupes = lesGroupes;
    }
    
    public void addLesMembres(Groupe unGroupe){
        if (lesGroupes == null){
            lesGroupes = new ArrayList<>();
        }
        lesGroupes.add(unGroupe);
    }
    
    public Instrument getInstrumentPrincipal() {
        return instrumentPrincipal;
    }
    
    public void setInstrumentPrincipal(Instrument instrumentPrincipal) {
        this.instrumentPrincipal = instrumentPrincipal;
    }
       
    
    public Statut getStatutMembre() {
        return StatutMembre;
    }

    public void setStatutMembre(Statut StatutMembre) {
        this.StatutMembre = StatutMembre;
    }

    
    

    
    
    
}