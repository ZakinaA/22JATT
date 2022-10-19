/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
/**
 *
 * @author Zakina
 */
public class Groupe {
    
    private int id;
    private String nom;
    private String dateCreation;
    private Genre genre;
    private String telephone;
    private String melSiteWeb;
    private String lieuRepetition;
    private int estSelectionne;
    private ArrayList<Membre> lesMembres;
    private ArrayList<Titre> lesTitres;
    private ArrayList<Concert> GroupeConcertId;
    private Membre MembreContact;
    private Dispositif DispositifGroupe;
    private String avatar;

    public Groupe() {
    }

    public Groupe(int id, String nom, String dateCreation, Genre genre, String telephone, String melSiteWeb,String avatar, String lieuRepetition, int estSelectionne, ArrayList<Membre> lesMembres, ArrayList<Titre> lesTitres, ArrayList<Concert> GroupeConcertId, Membre MembreContact, Dispositif DispositifGroupe) {
        this.id = id;
        this.nom = nom;
        this.dateCreation = dateCreation;
        this.genre = genre;
        this.telephone = telephone;
        this.melSiteWeb = melSiteWeb;
        this.lieuRepetition = lieuRepetition;
        this.estSelectionne = estSelectionne;
        this.lesMembres = lesMembres;
        this.lesTitres = lesTitres;
        this.GroupeConcertId = GroupeConcertId;
        this.MembreContact = MembreContact;
        this.DispositifGroupe = DispositifGroupe;
        this.avatar = avatar;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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

    public String getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(String dateCreation) {
        this.dateCreation = dateCreation;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getMelSiteWeb() {
        return melSiteWeb;
    }

    public void setMelSiteWeb(String melSiteWeb) {
        this.melSiteWeb = melSiteWeb;
    }

    public String getLieuRepetition() {
        return lieuRepetition;
    }

    public void setLieuRepetition(String lieuRepetition) {
        this.lieuRepetition = lieuRepetition;
    }

    public int getEstSelectionne() {
        return estSelectionne;
    }

    public void setEstSelectionne(int estSelectionne) {
        this.estSelectionne = estSelectionne;
    }

    public ArrayList<Membre> getLesMembres() {
        return lesMembres;
    }

    public void setLesMembres(ArrayList<Membre> lesMembres) {
        this.lesMembres = lesMembres;
    }

    public ArrayList<Titre> getLesTitres() {
        return lesTitres;
    }

    public void setLesTitres(ArrayList<Titre> lesTitres) {
        this.lesTitres = lesTitres;
    }

    public ArrayList<Concert> getGroupeConcertId() {
        return GroupeConcertId;
    }

    public void setGroupeConcertId(ArrayList<Concert> GroupeConcertId) {
        this.GroupeConcertId = GroupeConcertId;
    }

    public Membre getMembreContact() {
        return MembreContact;
    }

    public void setMembreContact(Membre MembreContact) {
        this.MembreContact = MembreContact;
    }

    public Dispositif getDispositifGroupe() {
        return DispositifGroupe;
    }

    public void setDispositifGroupe(Dispositif DispositifGroupe) {
        this.DispositifGroupe = DispositifGroupe;
    }

 
}