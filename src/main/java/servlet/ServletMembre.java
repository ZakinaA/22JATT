/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DaoAdmin;
import dao.DaoGroupe;
import dao.DaoInstrument;
import dao.DaoMembre;
import dao.Utilitaire;
import form.FormGroupe;
import form.FormMembre;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Groupe;
import model.Instrument;
import model.Membre;
import model.Statut;

/**
 *
 * @author Zakina
 */
public class ServletMembre extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * 
     *  Connection connection ;
    static PreparedStatement requete=null;
    static ResultSet rs=null;

     */
    
    Connection connection ;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
     @Override
    public void init()
    {
        
        ServletContext servletContext=getServletContext();
        connection=(Connection)servletContext.getAttribute("connection");
        
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletMembre</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletMembre at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         // récupération de l url saisie dans le navigateur
        String url = request.getRequestURI();
        
        System.out.println("servlermembre url="+url);

        
        if(url.equals("/normanzik/ServletMembre/lister"))
        {
            ArrayList<Membre> lesMembres = DaoMembre.getLesMembres(connection);
            request.setAttribute("pLesMembres", lesMembres);
            /*int idMembre = Integer.parseInt(request.getParameter("idMembre"));  
            
            Membre leMembre = DaoMembre.getLeMembre(connection, idMembre);

            request.setAttribute("pMembre", leMembre);*/
            this.getServletContext().getRequestDispatcher("/view/membre/lister.jsp" ).forward( request, response );
        }
        if(url.equals("/normanzik/ServletMembre/consulter"))
        {
            int idMembre = Integer.parseInt(request.getParameter("idMembre"));              
            Membre leMembre = DaoMembre.getLeMembre(connection, idMembre);
            request.setAttribute("pMembre", leMembre);
            
            
            ArrayList<Groupe> lesGroupesMembre = DaoMembre.getLesGroupesMembre(connection, idMembre);
            request.setAttribute("pLesGroupesMembre", lesGroupesMembre);

            this.getServletContext().getRequestDispatcher("/view/membre/consulter.jsp" ).forward( request, response );
        }
        
        
        if(url.equals("/normanzik/ServletMembre/ajouter"))
        {
           
            ArrayList<Instrument> lesInstruments = DaoInstrument.getLesInstruments(connection);
            request.setAttribute("pLesInstruments", lesInstruments);
            
            ArrayList<Statut> lesStatuts = DaoAdmin.getLesStatuts(connection);
            request.setAttribute("pLesStatuts", lesStatuts);
            this.getServletContext().getRequestDispatcher("/view/membre/ajouter.jsp" ).forward( request, response );
        }
        
        if(url.equals("/normanzik/ServletMembre/modifier"))
        {
            int idMembre = Integer.parseInt(request.getParameter("idMembre"));              
            Membre leMembre = DaoMembre.getLeMembre(connection, idMembre);
            request.setAttribute("pMembre", leMembre);
            
            ArrayList<Groupe> lesGroupesMembre = DaoMembre.getLesGroupesMembre(connection, idMembre);
            request.setAttribute("pLesGroupesMembre", lesGroupesMembre);
            this.getServletContext().getRequestDispatcher("/view/membre/modifier.jsp" ).forward( request, response );
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FormMembre form = new FormMembre();

        /* Appel au traitement et à la validation de la requête, et récupération de l'objet en résultant */
        Membre leMembreSaisi = form.ajouterMembre(request);

        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pMembre", leMembreSaisi );

        if (form.getErreurs().isEmpty()){
            System.out.println("insert 1");
            // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du groupe
            Membre membreAjoute = DaoMembre.ajouterMembre(connection, leMembreSaisi);

            if (membreAjoute != null ){
                System.out.println("insert 2");
                request.setAttribute("pMembre", membreAjoute);
                this.getServletContext().getRequestDispatcher("/view/membre/consulter.jsp" ).forward( request, response );
            }
            else
            {
                // Cas où l'insertion en bdd a échoué
                ArrayList<Instrument> lesInstruments = DaoInstrument.getLesInstruments(connection);
                request.setAttribute("pLesInstruments", lesInstruments);
            
                ArrayList<Statut> lesStatuts = DaoAdmin.getLesStatuts(connection);
                request.setAttribute("pLesStatuts", lesStatuts);
                this.getServletContext().getRequestDispatcher("/view/membre/ajouter.jsp" ).forward( request, response );
            }
        }
        else
        {
            ArrayList<Instrument> lesInstruments = DaoInstrument.getLesInstruments(connection);
            request.setAttribute("pLesInstruments", lesInstruments);
            
            ArrayList<Statut> lesStatuts = DaoAdmin.getLesStatuts(connection);
            request.setAttribute("pLesStatuts", lesStatuts);
            this.getServletContext().getRequestDispatcher("/view/membre/ajouter.jsp" ).forward( request, response );
        }

    }

    //fermeture des ressources
    public void destroy(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        try
        {
            //fermeture
            System.out.println("Connexion fermée");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            System.out.println("Erreur lors de l’établissement de la connexion");
        }
        finally
        {
            //Utilitaire.fermerConnexion(rs);
            //Utilitaire.fermerConnexion(requete);
            Utilitaire.fermerConnexion(connection);
        }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
