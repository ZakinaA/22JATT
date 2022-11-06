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
public class LieuConcert {
    
    private int id;
    private String nom;
    private String ville;
    private String cp;
    private String salleNom;
    private ArrayList<Concert> lieuConcertId;
    public LieuConcert() {
    }

    
    
    public LieuConcert(int id, String nom, String ville, String cp, String salleNom, ArrayList<Concert> lieuConcertId) {
        this.id = id;
        this.nom = nom;
        this.ville = ville;
        this.cp = cp;
        this.salleNom = salleNom;
        this.lieuConcertId = lieuConcertId;
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

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public String getCp() {
        return cp;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public String getSalleNom() {
        return salleNom;
    }

    public void setSalleNom(String salleNom) {
        this.salleNom = salleNom;
    }

    public ArrayList<Concert> getLieuConcertId() {
        return lieuConcertId;
    }

    public void setLieuConcertId(ArrayList<Concert> lieuConcertId) {
        this.lieuConcertId = lieuConcertId;
    }


    
  

    

    
    
}
