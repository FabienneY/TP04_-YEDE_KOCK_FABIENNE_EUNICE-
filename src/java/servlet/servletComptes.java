/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import compte.gestion.GestionBancaire;
import compte.usage.CompteBancaire;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */

@WebServlet(name = "servletComptes", urlPatterns = {"/servlet"})
public class servletComptes extends HttpServlet {

    @EJB
    private GestionBancaire gestionBancaire;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        String forwardTo = "";
        String message = "";
        
        if (action != null) {
            if (action.equals("listeAccount")) {
                Collection<CompteBancaire> liste = gestionBancaire.getAllComptes();
                request.setAttribute("listeDesAccount", liste);
                forwardTo = "listAccount.jsp?action=listeAccount";
                message = "Liste des comptes";
            } else if (action.equals("createAccount")) {
                String solde=request.getParameter("balance");
                //gestionBancaire.creerNouveauCompte();
                gestionBancaire.creerCompte(request.getParameter("nom"), request.getParameter("prenom"), request.getParameter("compte"), Double.valueOf(solde));
                Collection<CompteBancaire> liste = gestionBancaire.getAllComptes();
                request.setAttribute("listeDesAccount", liste);
                forwardTo = "listAccount.jsp?action=listeAccount";
                message = "Liste des comptes";
            } else {
                forwardTo = "newAccount.jsp";
                message = "La fonctionnalité pour le paramètre " + action + " est à implémenter !";
            }
        }
         RequestDispatcher dp = request.getRequestDispatcher(forwardTo + "&message=" + message);
        dp.forward(request, response);
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet servletComptes</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet servletComptes at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
