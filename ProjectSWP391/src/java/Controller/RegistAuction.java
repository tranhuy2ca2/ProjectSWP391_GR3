/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AuctionLogsDAO;
import DAO.LandLotsDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.AuctionLogs;

/**
 *
 * @author FPTSHOP
 */
public class RegistAuction extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        LandLotsDAO landdao = new LandLotsDAO();
        int landlotID = Integer.parseInt(request.getParameter("landlotid"));
        request.setAttribute("b", landdao.getLandLotsDetailByID(landlotID));
        request.getRequestDispatcher("RegistAuction.jsp").forward(request, response);
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
        // processRequest(request, response);
        String landLotId = request.getParameter("landLotId");

        // Check if landLotId is not null or empty
        if (landLotId == null || landLotId.isEmpty()) {
            // Redirect to error page or back to the form with an error message
            response.sendRedirect("dangkythamgia.jsp?error=landLotId_missing");
            return;
        }

        boolean agreeRules = request.getParameter("agreeRules") != null;
        boolean waiveInterest = request.getParameter("waiveInterest") != null;
        boolean understandAsset = request.getParameter("understandAsset") != null;

        // Check if all checkboxes are checked
        if (agreeRules && waiveInterest && understandAsset) {
            try {
                // Create an AuctionLogs object
                AuctionLogs log = new AuctionLogs();
                log.setAuctionID(Integer.parseInt(landLotId)); // Parse landLotId safely now
                log.setUserID((Integer) request.getSession().getAttribute("userID")); // Assuming userID is stored in session
                log.setAction("User confirmed participation"); // Set action message
                log.setLogTime(new java.sql.Timestamp(System.currentTimeMillis())); // Set current time

                // Use AuctionLogsDAO to save the log
                AuctionLogsDAO auctionLogsDAO = new AuctionLogsDAO();
                boolean isLogged = auctionLogsDAO.addLog(log);

                if (isLogged) {
                    // Redirect to success page with success message
                    response.sendRedirect("ManageRegistForm.jsp?success=true");
                } else {
                    // Redirect to error page if saving failed
                    response.sendRedirect("ManageRegistForm.jsp?error=saving_failed");
                }
            } catch (NumberFormatException e) {
                // Handle case where landLotId is not a valid integer
                response.sendRedirect("ManageRegistForm.jsp?error=invalid_landLotId");
            }
        } else {
            // If not all checkboxes are checked, redirect to error page
            response.sendRedirect("ManageRegistForm.jsp?error=missing_fields");
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
