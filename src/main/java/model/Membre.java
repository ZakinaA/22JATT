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
    private String motDePasse;
    private String mail;
    private ArrayList<Groupe> lesGroupes;
    private ArrayList<Instrument> lesInstruments;
    private Instrument instrumentPrincipal; // On récupère l'instrument principal du membre
    private Statut StatutMembre;
    
    public Membre() {
    }
    public Membre(int id, String nom, String prenom, Instrument instrumentPrincipal, Statut StatutMembre, String motDePasse, String mail) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.instrumentPrincipal = instrumentPrincipal;
        this.StatutMembre = StatutMembre;
        this.motDePasse = motDePasse;
        this.mail = mail;
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
    
    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
    
    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
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

    public ArrayList<Instrument> getLesInstruments() {
        return lesInstruments;
    }

    public void setLesInstruments(ArrayList<Instrument> lesInstruments) {
        this.lesInstruments = lesInstruments;
    }
    
    public void addLesInstruments(Instrument unInstrument){
        if (lesInstruments == null){
            lesInstruments = new ArrayList<>();
        }
        lesInstruments.add(unInstrument);
    }
    
    

    
    

    
    
    
}
