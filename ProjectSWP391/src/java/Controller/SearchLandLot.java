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
import java.util.List;
import model.LandLots;

/**
 *
 * @author Admin
 */
public class SearchLandLot extends HttpServlet {

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
            String pageNumber = request.getParameter("pageNumber");
            int pageNum = 1;
            if (pageNumber != null) {
                pageNum = Integer.parseInt(pageNumber);
            }
            String keyword = request.getParameter("keyword");
            String order = request.getParameter("order");
            request.setAttribute("keyword", keyword);
            if ("StartingPrice".equals(order)) {
                request.setAttribute("order", 1);
            } else if ("StartingPrice desc".equals(order)) {
                request.setAttribute("order", 2);
            } else if ("Area".equals(order)) {
                request.setAttribute("order", 3);
            } else if ("Area desc".equals(order)) {
                request.setAttribute("order", 4);
            }
            LandLotsDAO landdao = new LandLotsDAO();
            List<LandLots> list = landdao.getAllLandLotsDetail(keyword, order);
            int total = list.size() % 5 == 0 ? (list.size() / 5) : (list.size() / 5 + 1);
            List<LandLots> subList = list.subList(5 * (pageNum - 1), Math.min(5 * pageNum, list.size()));
            request.setAttribute("listlandlot", subList);
            request.setAttribute("totalPage", total);
            request.setAttribute("pageNum", pageNum);
//            request.getRequestDispatcher("ListLandLot.jsp").include(request, response);
            request.getRequestDispatcher("ViewAuction.jsp").forward(request, response);
//   return;
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
