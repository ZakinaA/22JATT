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
public class Connexion {    
    private int id;
    private String mail_utilisateur;
    private String mdp;
    private String type;
    private ArrayList<Membre> lesMembres;

    
    public Connexion(String mail_utilisateur, String mdp) {
        //this.id = id;
        this.mail_utilisateur = mail_utilisateur;
        this.mdp = mdp;
       // this.type = type;
    }
    
    
    public ArrayList<Membre> getLesMembres() {
        return lesMembres;
    }

    public void setLesMembres(ArrayList<Membre> lesMembres) {
        this.lesMembres = lesMembres;
    }

    public void addUnMembre (Membre pUnMembre) {
        if (lesMembres == null){
            lesMembres = new ArrayList<Membre>();
        }
        lesMembres.add(pUnMembre);
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }




    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMail_Utilisateur() {
        return mail_utilisateur;
    }

    public void setMail_utilisateur(String mail_utilisateur) {
        this.mail_utilisateur = mail_utilisateur;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }
}
