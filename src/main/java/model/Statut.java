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
public class Statut {
    
    private int id;
    private String libelleStatut;
    private ArrayList<Membre> lesMembres;

    public Statut() {
    }
    public Statut(int id, String libelleStatut, ArrayList<Membre> lesMembres) {
        this.id = id;
        this.libelleStatut = libelleStatut;
        this.lesMembres = lesMembres;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLibelleStatut() {
        return libelleStatut;
    }

    public void setLibelleStatut(String libelleStatut) {
        this.libelleStatut = libelleStatut;
    }

    public ArrayList<Membre> getlesMembres() {
        return lesMembres;
    }

    public void setlesMembres(ArrayList<Membre> lesMembres) {
        this.lesMembres = lesMembres;
    }
    
    public void addLesMembres(Membre unMembre){
        if (lesMembres == null){
            lesMembres = new ArrayList<>();
        }
        lesMembres.add(unMembre);
    }
    
    
    
    
    
}
