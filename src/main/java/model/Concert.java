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
    
    private String dateConcert;
    private String lieuConcertId;
    private ArrayList<Groupe> groupeID;

    public Concert() {
    }

    public Concert(String dateConcert, String lieuConcertId, ArrayList<Groupe> groupeID) {
        this.dateConcert = dateConcert;
        this.lieuConcertId = lieuConcertId;
        this.groupeID = groupeID;
    }

    public String getDateConcert() {
        return dateConcert;
    }

    public void setDateConcert(String dateConcert) {
        this.dateConcert = dateConcert;
    }

    public String getLieuConcertId() {
        return lieuConcertId;
    }

    public void setLieuConcertId(String lieuConcertId) {
        this.lieuConcertId = lieuConcertId;
    }

    public ArrayList<Groupe> getGroupeID() {
        return groupeID;
    }

    public void setGroupeID(ArrayList<Groupe> groupeID) {
        this.groupeID = groupeID;
    }
    
    

    
    
    
}
