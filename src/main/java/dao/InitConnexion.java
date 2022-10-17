/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author Zakina
 */
public class InitConnexion implements ServletContextListener {
        
    //parametres de connexion
    Connection connection=null;

    //action déclenchée lors du chargement du context
    @Override
    public void contextInitialized(ServletContextEvent event)
    {
        System.out.println("----------- Contexte initialisé -----------");

        //lire le contexte
        ServletContext servletContext=event.getServletContext();
      
        
        try
        {
            //chargement du driver
            //Class.forName("com.mysql.cj.jdbc.Driver");
            Class.forName("org.mariadb.jdbc.Driver");
            System.out.println("Pilote MARIADB JDBC chargé");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
            System.out.println("Erreur lors du chargemement du pilote.....");
        }

        try
        {
            //obtention de la connexion
            
            
            
            connection = DriverManager.getConnection ("jdbc:mariadb://127.0.0.1:3307/normanzik","root","");               
            
           //connection = DriverManager.getConnection ("jdbc:mariadb://localhost:3306/JATT","ADM_JATT","mpJatt");
            
            
            
            //
         
            //sauvegarder la connexion dans le context
            servletContext.setAttribute("connection",connection);
            System.out.println("jdbc:mariadb://127.0.0.1:3307 - connexion ");
        }
        catch (SQLException e)
        {
            e.printStackTrace();
         
        }
    }

    //action qui permet de détruire le filtre
    public void contextDestroyed(ServletContextEvent event)
    {
        System.out.println("----------- Contexte détruit -----------");
        try
        {
            //fermeture
            System.out.println("Connexion fermée");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            Utilitaire.fermerConnexion(connection);
        }
    }

    
}
