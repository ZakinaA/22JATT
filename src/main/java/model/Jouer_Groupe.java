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
public class Jouer_Groupe {
    private Groupe leGroupe; 
    private ArrayList <Membre> lesMembres;
    private ArrayList <Instrument> lesInstruments;
    
    public Jouer_Groupe() {}
    
    public Jouer_Groupe(Groupe leGroupe, ArrayList<Membre> lesMembres, ArrayList<Instrument> lesInstruments) {
        this.leGroupe = leGroupe; 
        this.lesMembres = lesMembres;
        this.lesInstruments = lesInstruments;
    }

    public Groupe getLeGroupe() {
        return leGroupe;
    }

    public void setLeGroupe(Groupe leGroupe) {
        this.leGroupe = leGroupe;
    }

    public ArrayList<Membre> getLesMembres() {
        return lesMembres;
    }

    public void setLesMembres(ArrayList<Membre> lesMembres) {
        this.lesMembres = lesMembres;
    }

    public ArrayList<Instrument> getLesInstruments() {
        return lesInstruments;
    }

    public void setLesInstruments(ArrayList<Instrument> lesInstruments) {
        this.lesInstruments = lesInstruments;
    }
    
    
    public void addLesMembres(Membre unMembre){
        if (lesMembres == null){
            lesMembres = new ArrayList<>();
        }
        lesMembres.add(unMembre);
    }  
    

           
    
}
