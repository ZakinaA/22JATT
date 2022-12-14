/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DaoConnexion;
import dao.Utilitaire;
import form.FormConnexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Connexion;
import static test.ConnexionBdd.connection;

/**
 *
 * @author sio2
 */

public class ServletIndex extends HttpServlet {



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

        
        String url = request.getRequestURI();       

     

        if(url.equals(getServletContext().getContextPath()+"/ServletIndex/index"))
        {
            this.getServletContext().getRequestDispatcher("/view/index/index.jsp" ).forward( request, response );
        }
        
        if(url.equals(getServletContext().getContextPath()+"/ServletIndex/logout")){ 
            HttpSession session = request.getSession();
            session.invalidate();

            this.getServletContext().getRequestDispatcher("/view/index/index.jsp" ).forward( request, response );          
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

        FormConnexion form = new FormConnexion(); 
        Connexion laConnexion = form.uneConnexion(request);
        request.setAttribute("form", form);        
        request.setAttribute("pConnexion", laConnexion);    
        HttpSession session = request.getSession();
        if (form.getErreurs().isEmpty()){
            Connexion faireConnexion = DaoConnexion.getCompte(connection,laConnexion);
            
            System.out.println(faireConnexion);
            if(faireConnexion.getId() != 0) {

                session.setAttribute("NormanzikAuthID", faireConnexion.getId());
                session.setAttribute("NormanzikGradeID", faireConnexion.getGradeID());
                session.setAttribute("NormanzikNomCompte", faireConnexion.getMembre().getPrenom() + " " + faireConnexion.getMembre().getNom().toUpperCase());
                session.setAttribute("notifMessage", "Bonjour "+faireConnexion.getMembre().getPrenom() + " " + faireConnexion.getMembre().getNom().toUpperCase()); // On met un '1' ?? l'attribut permettant d'afficher les notifications   
                session.setAttribute("showNotifMessage", 1); // On met un '1' ?? l'attribut permettant d'afficher les notifications 
                this.getServletContext().getRequestDispatcher("/view/index/index.jsp" ).forward( request, response );
            } else {
                session.setAttribute("notifMessage", "Aucun compte n'existe avec cette adresse mail/mot de passe.");
                session.setAttribute("showNotifMessage", 1); // On met un '1' ?? l'attribut permettant d'afficher les notifications 
                response.sendRedirect(getServletContext().getContextPath());
            }
        } else {
            session.setAttribute("notifMessage", "Merci de renseigner des champs valides");
            session.setAttribute("showNotifMessage", 1); // On met un '1' ?? l'attribut permettant d'afficher les notifications 
            response.sendRedirect(getServletContext().getContextPath());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    //fermeture des ressources
    public void destroy(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        try
        {
            //fermeture
            System.out.println("Connexion ferm??e");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            System.out.println("Erreur lors de l?????tablissement de la connexion");
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
