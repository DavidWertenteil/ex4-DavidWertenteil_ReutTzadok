/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author davidwer
 */
@WebServlet(name = "Save", urlPatterns = {"/Save"})
public class Save extends HttpServlet {

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
        doPost(request, response);
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
        
         // Validate the status
        String userStatus =(String) request.getParameter("status");
        if (userStatus == null || request.getSession().getAttribute("userEmail") == null) {
            request.getRequestDispatcher("list.jsp").forward(request, response);
        }
        
        String userEmail = (String) request.getSession().getAttribute("userEmail");
        
        // Clean status
        userStatus = userStatus.trim();

        // Set servletContext
        ServletContext context = getServletContext();
        synchronized (this) {
            if (context.getAttribute("users") == null) {
                request.getRequestDispatcher("Logout").forward(request, response);
            } else {
                //Save the status
                ArrayList<BeansData> users = (ArrayList<BeansData>) context.getAttribute("users");
                for (BeansData temp : users) {
                    //if user found, update state
                    if (temp.getEmail().compareTo(userEmail) == 0) {
                        temp.setStatus(userStatus);
                        break;
                    }
                }
               
                context.setAttribute("users", users);
            }
        }

        // Go back to list.jsp page
        String address = "list.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }

}
