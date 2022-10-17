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
public class Concert {
    
    private int id;
    private String dateConcert;
    private LieuConcert lieuConcertId;
    private Groupe GroupeConcertId;
    private String HeureDebut;
    private String HeureFin;
            

    public Concert() {
    }

    public Concert(int id, String dateConcert, LieuConcert lieuConcertId, Groupe GroupeConcertId, String HeureDebut, String HeureFin) {
        this.id = id;
        this.dateConcert = dateConcert;
        this.lieuConcertId = lieuConcertId;
        this.GroupeConcertId = GroupeConcertId;
        this.HeureDebut = HeureDebut;
        this.HeureFin = HeureFin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDateConcert() {
        return dateConcert;
    }

    public void setDateConcert(String dateConcert) {
        this.dateConcert = dateConcert;
    }

    public LieuConcert getLieuConcertId() {
        return lieuConcertId;
    }

    public void setLieuConcertId(LieuConcert lieuConcertId) {
        this.lieuConcertId = lieuConcertId;
    }

    public Groupe getGroupeConcertId() {
        return GroupeConcertId;
    }

    public void setGroupeConcertId(Groupe GroupeConcertId) {
        this.GroupeConcertId = GroupeConcertId;
    }

    public String getHeureDebut() {
        return HeureDebut;
    }

    public void setHeureDebut(String HeureDebut) {
        this.HeureDebut = HeureDebut;
    }

    public String getHeureFin() {
        return HeureFin;
    }

    public void setHeureFin(String HeureFin) {
        this.HeureFin = HeureFin;
    }

   

  

  
    
    
    
    
}
