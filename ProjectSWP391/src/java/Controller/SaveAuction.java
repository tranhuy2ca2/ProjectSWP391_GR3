/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.LandLotsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Customer;
import model.LandLots;

/**
 *
 * @author Administator
 */
public class SaveAuction extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SaveAuction</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaveAuction at " + request.getContextPath() + "</h1>");
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
//        request.getRequestDispatcher("profile").forward(request, response);
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
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("application/json"); // Set response type to JSON
    PrintWriter out = response.getWriter();
    try {
        LandLotsDAO ldao = new LandLotsDAO();
        String landLotID = request.getParameter("landLotID");
        int landLotId = Integer.parseInt(landLotID);
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("user");

        if (customer == null) {
            out.write("{\"status\":\"fail\", \"message\":\"User not logged in.\"}");
        } else {
            boolean isAlreadySaved = ldao.isLandLotFavorite(customer.getUserID(), landLotId); // Check if already saved

            if (isAlreadySaved) {
                // If already saved, return JSON response indicating it
                out.write("{\"status\":\"fail\", \"message\":\"Mảnh đất này đã được lưu trước đó.\"}");
            } else {
                // Save auction if not already saved
                boolean success = ldao.saveAuction(customer.getUserID(), landLotId);
                if (success) {
                    out.write("{\"status\":\"success\", \"message\":\"Mảnh đất đã được lưu thành công.\"}");
                } else {
                    out.write("{\"status\":\"fail\", \"message\":\"Đã xảy ra lỗi. Vui lòng thử lại.\"}");
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.write("{\"status\":\"fail\", \"message\":\"Đã xảy ra lỗi hệ thống.\"}");
    } finally {
        out.flush();
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
