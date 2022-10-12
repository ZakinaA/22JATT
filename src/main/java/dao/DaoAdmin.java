/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Genre;
import model.Statut;

/**
 *
 * @author Zakina
 */
public class DaoAdmin {

    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;

    public static ArrayList<Genre> getLesGenres(Connection connection){
        ArrayList<Genre> lesGenres = new  ArrayList<Genre>();
        try
        {
            requete=connection.prepareStatement("select * from  genre_musical ");
            rs=requete.executeQuery();
            while ( rs.next() ) {

                Genre leGenre = new Genre();
                leGenre.setId(rs.getInt("id"));
                leGenre.setLibelle(rs.getString("libelle"));
                lesGenres.add(leGenre);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesGenres ;
    }
    
    public static ArrayList<Statut> getLesStatuts(Connection connection){
        ArrayList<Statut> lesStatuts = new  ArrayList<Statut>();
        try
        {
            requete=connection.prepareStatement("select id,libelle from  statut ");
            rs=requete.executeQuery();
            while ( rs.next() ) {

                Statut leStatut = new Statut();
                leStatut.setId(rs.getInt("id"));
                leStatut.setLibelleStatut(rs.getString("libelle"));
                lesStatuts.add(leStatut);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesStatuts ;
    }
    
}
