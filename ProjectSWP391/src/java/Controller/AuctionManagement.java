package Controller;

import DAO.AuctionDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.List;
import model.Auction;

public class AuctionManagement extends HttpServlet {

    private AuctionDAO auctionDAO;

    @Override
    public void init() {
        auctionDAO = new AuctionDAO();  // Initialize DAO
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Auction> auctions = auctionDAO.getAllAuctions();  // Get all auctions from DAO
        request.setAttribute("auctions", auctions);  // Set auctions to request attribute
        request.getRequestDispatcher("list_auction.jsp").forward(request, response);
    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String action = request.getParameter("action");

    if ("edit".equals(action)) {
        try {
            int auctionID = Integer.parseInt(request.getParameter("auctionID"));
            String startTimeStr = request.getParameter("startTime");
            String endTimeStr = request.getParameter("endTime");
            String status = request.getParameter("status");

            // Debugging: Log received parameters
            System.out.println("Received auctionID: " + auctionID);
            System.out.println("Received startTime: " + startTimeStr);
            System.out.println("Received endTime: " + endTimeStr);
            System.out.println("Received status: " + status);

            Timestamp startTime = Timestamp.valueOf(startTimeStr.replace("T", " ") + ":00");
            Timestamp endTime = Timestamp.valueOf(endTimeStr.replace("T", " ") + ":00");

            // Lấy Auction hiện tại từ DB
            Auction currentAuction = auctionDAO.getAuctionById(auctionID);

            if (currentAuction == null) {
                request.setAttribute("message", "Auction not found!");
                reloadAuctionList(request, response);
                return;
            }

            // Chỉ cập nhật các trường cần thiết
            currentAuction.setStartTime(startTime);
            currentAuction.setEndTime(endTime);
            currentAuction.setStatus(status);

            boolean success = auctionDAO.updateAuction(currentAuction);
            System.out.println("Update success: " + success); // Log kết quả cập nhật
            request.setAttribute("message", success ? "Auction updated successfully!" : "Failed to update auction!");

            // Reload lại danh sách đấu giá
            reloadAuctionList(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid auction ID format!");
            reloadAuctionList(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "An error occurred: " + e.getMessage());
            e.printStackTrace(); // In ra stack trace để giúp xác định lỗi
            reloadAuctionList(request, response);
        }
    } else if ("delete".equals(action)) {
        int auctionID = Integer.parseInt(request.getParameter("auctionID"));
        boolean success = auctionDAO.deleteAuction(auctionID);
        request.setAttribute("message", success ? "Auction deleted successfully!" : "Failed to delete auction!");

        reloadAuctionList(request, response);

    } else if ("add".equals(action)) {
        String landLotName = request.getParameter("landLotName");
        String auctioneerName = request.getParameter("auctioneerName");
        String winnerName = request.getParameter("winnerName");
        Timestamp startDate = Timestamp.valueOf(request.getParameter("startTime").replace("T", " ") + ":00");
        Timestamp endDate = Timestamp.valueOf(request.getParameter("endTime").replace("T", " ") + ":00");
        String status = request.getParameter("status");

        // Validate đầu vào
        if (landLotName == null || auctioneerName == null || startDate == null || endDate == null || status == null) {
            request.setAttribute("message", "Required fields are missing!");
            reloadAuctionList(request, response);
            return;
        }

        // Lấy LandLotID dựa vào tên lô đất
        int landLotID = auctionDAO.getLandLotIDByName(landLotName);
        if (landLotID == -1) {
            request.setAttribute("message", "Invalid land lot name!");
            reloadAuctionList(request, response);
            return;
        }

        // Lấy auctioneerID dựa vào tên auctioneer
        int auctioneerID = auctionDAO.getUserIDByName(auctioneerName);
        if (auctioneerID == -1) {
            request.setAttribute("message", "Invalid auctioneer name!");
            reloadAuctionList(request, response);
            return;
        }

        // Lấy winnerID (nếu có)
        Integer winnerID = null;  
        if (winnerName != null && !winnerName.isEmpty() && !winnerName.equals("Chưa có")) {
            winnerID = auctionDAO.getUserIDByName(winnerName);
            if (winnerID == -1) {
                request.setAttribute("message", "Invalid winner name!");
                reloadAuctionList(request, response);
                return;
            }
        }

        Auction newAuction = new Auction(landLotID, auctioneerID, landLotName, auctioneerName, winnerName, startDate, endDate, status);

        if (winnerID != null) {
            newAuction.setWinnerID(winnerID);
        }

        boolean success = auctionDAO.addAuction(newAuction);
        request.setAttribute("message", success ? "Auction added successfully!" : "Failed to add auction!");

        reloadAuctionList(request, response);
    }



}


    private void reloadAuctionList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Auction> auctions = auctionDAO.getAllAuctions();  // Reload auction list
        request.setAttribute("auctions", auctions);
        request.getRequestDispatcher("list_auction.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Auction management servlet";
    }
}
