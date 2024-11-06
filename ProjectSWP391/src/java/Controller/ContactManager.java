/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.ContactDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import ultis.Notify;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="ContactManager", urlPatterns={"/contactManager"})
public class ContactManager extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ContactDAO condao = new ContactDAO();
        List<model.Contact> contacts = condao.getListContact();
        
         Notify.updateReadStatus(request, 0, "1");
        request.setAttribute("listContacts", contacts);
        request.getRequestDispatcher("ListContact.jsp").forward(request, response);
    } 

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    String contactIDStr = request.getParameter("contactID");
    String responseText = request.getParameter("responseText");

    int contacId = 0;
    if(contactIDStr != null && !responseText.isEmpty()){
        contacId = Integer.parseInt(contactIDStr);
         ContactDAO contactDAO = new ContactDAO();
    contactDAO.updateContactResponse(contacId, responseText);
     ContactDAO condao = new ContactDAO();
     List<model.Contact> contacts = condao.getListContact();
     request.setAttribute("listContacts", contacts);
     request.getRequestDispatcher("ListContact.jsp").forward(request, response);

    }
 
}

}
