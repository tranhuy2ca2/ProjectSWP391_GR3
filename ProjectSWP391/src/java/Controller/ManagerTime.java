package Controller;

import DAO.AuctionDAO;
import java.io.IOException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Auction;

public class ManagerTime extends HttpServlet {

    private AuctionDAO auctionDAO = new AuctionDAO();  // Moved AuctionDAO to class level

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("auctionList", auctionDAO.getAllAuctions());  // Consistent naming with auctionList
        request.getRequestDispatcher("manager_time_auction.jsp").forward(request, response);
    }

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
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String auctionIDStr = request.getParameter("auctionID");
        if (auctionIDStr != null && !auctionIDStr.isEmpty()) {
            try {
                int auctionID = Integer.parseInt(auctionIDStr);
                // Get the updated start and end times from the form
                String startTimeStr = request.getParameter("startTime_" + auctionID);
                String endTimeStr = request.getParameter("endTime_" + auctionID);
                if (startTimeStr != null && endTimeStr != null) {
                    // Convert strings to Timestamps
                    Timestamp startTime = Timestamp.valueOf(startTimeStr.replace("T", " ") + ":00");
                    Timestamp endTime = Timestamp.valueOf(endTimeStr.replace("T", " ") + ":00");

                    // Check that the start time is before the end time
                    if (!startTime.before(endTime)) {
                        request.setAttribute("message", "Thời gian bắt đầu phải trước thời gian kết thúc!");
                        reloadAuctionList(request, response);  // Reload auction list with error message
                        return;
                    }

                    // Update the auction time in the database
                    auctionDAO.updateAuctionTime(auctionID, startTime, endTime);
                }
            } catch (NumberFormatException e) {
                // Log and handle the exception if auctionID is invalid
                e.printStackTrace();
            }
        }

        // Redirect to the updated auction page
        response.sendRedirect("ManagerTime");
    }

    /** 
     * Reloads the auction list and forwards to the JSP
     */
    private void reloadAuctionList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Auction> auctions = auctionDAO.getAllAuctions();  // Reload auction list
        request.setAttribute("auctionList", auctions);  // Consistent naming with auctionList
        request.getRequestDispatcher("manager_time_auction.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet for managing auction times";
    }
}
