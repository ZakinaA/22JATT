/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author sio2
 */
public class LieuConcert {
    
    private int id;
    private String nom;
    private String ville;
    private int cp;
    private String salleNom;
    private Concert lieuConcertId;

    public LieuConcert() {
    }

    public LieuConcert(int id, String nom, String ville, int cp, String salleNom, Concert lieuConcertId) {
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

    public int getCp() {
        return cp;
    }

    public void setCp(int cp) {
        this.cp = cp;
    }

    public String getSalleNom() {
        return salleNom;
    }

    public void setSalleNom(String salleNom) {
        this.salleNom = salleNom;
    }

    public Concert getLieuConcertId() {
        return lieuConcertId;
    }

    public void setLieuConcertId(Concert lieuConcertId) {
        this.lieuConcertId = lieuConcertId;
    }

  



    

    
    
}
