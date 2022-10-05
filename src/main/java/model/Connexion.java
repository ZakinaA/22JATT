/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author sio2
 */
public class Connexion {
    
    private int id;
    private String nom_utilisateur;
    private String mdp;
    private String type;
    private ArrayList<Pompier> lesPompiers;

    public Compte(int id, String nom_utilisateur, String mdp, String type) {
        this.id = id;
        this.nom_utilisateur = nom_utilisateur;
        this.mdp = mdp;
        this.type = type;
    }
    
    
    public ArrayList<Pompier> getLesPompiers() {
        return lesPompiers;
    }

    public void setLesPompiers(ArrayList<Pompier> lesPompiers) {
        this.lesPompiers = lesPompiers;
    }

    public void addUnPompier (Pompier pUnPompier) {
        if (lesPompiers == null){
            lesPompiers = new ArrayList<Pompier>();
        }
        lesPompiers.add(pUnPompier);
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


    public Compte() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom_utilisateur() {
        return nom_utilisateur;
    }

    public void setNom_utilisateur(String nom_utilisateur) {
        this.nom_utilisateur = nom_utilisateur;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }
}
