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

        // Fetch auctions to display on the main page
        List<Auction> auctions = auctionDAO.getAllAuctions();
        request.setAttribute("auctions", auctions);

        // Fetch data for the modal form dropdowns
        List<String> landLotNames = auctionDAO.getAllLandLotNames();
        List<String> auctioneerNames = auctionDAO.getAllAuctioneerNames();
        List<String> winnerNames = auctionDAO.getAllWinnerNames();

        // Add these lists to the request so they can be accessed in JSP
        request.setAttribute("landLotNames", landLotNames);
        request.setAttribute("auctioneerNames", auctioneerNames);
        request.setAttribute("winnerNames", winnerNames);

        // Forward to the JSP page (list_auction.jsp) containing both the auction table and the modal form
        request.getRequestDispatcher("list_auction.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            try {
                // Lấy các tham số từ request
                int auctionID = Integer.parseInt(request.getParameter("auctionID"));
                String startTimeStr = request.getParameter("startTime");
                String endTimeStr = request.getParameter("endTime");
                String status = request.getParameter("status");
                String winnerIDStr = request.getParameter("winnerID");

                // Debugging: Log received parameters
                System.out.println("Received auctionID: " + auctionID);
                System.out.println("Received startTime: " + startTimeStr);
                System.out.println("Received endTime: " + endTimeStr);
                System.out.println("Received status: " + status);
                System.out.println("Received winnerID: " + winnerIDStr);

                // Chuyển đổi thời gian thành Timestamp
                Timestamp startTime = Timestamp.valueOf(startTimeStr.replace("T", " ") + ":00");
                Timestamp endTime = Timestamp.valueOf(endTimeStr.replace("T", " ") + ":00");

                // Lấy Auction hiện tại từ DB
                Auction currentAuction = auctionDAO.getAuctionById(auctionID);

                if (currentAuction == null) {
                    request.setAttribute("message", "Auction not found!");
                    reloadAuctionList(request, response);
                    return;
                }

                // Cập nhật các trường thời gian, trạng thái và WinnerID
                currentAuction.setStartTime(startTime);
                currentAuction.setEndTime(endTime);
                currentAuction.setStatus(status);

                // Convert winnerID to integer or null
                Integer winnerID = (winnerIDStr != null && !winnerIDStr.isEmpty()) ? Integer.parseInt(winnerIDStr) : null;
                currentAuction.setWinnerID(winnerID);

                // Gọi phương thức cập nhật đấu giá
                boolean success = auctionDAO.updateAuction(currentAuction);
                System.out.println("Update success: " + success); // Log kết quả cập nhật
                request.setAttribute("message", success ? "Auction updated successfully!" : "Failed to update auction!");

                // Reload lại danh sách đấu giá
                reloadAuctionList(request, response);
            } catch (Exception e) {
                e.printStackTrace();
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

            // Kiểm tra thời gian bắt đầu phải trước thời gian kết thúc
            if (!startDate.before(endDate)) {
                request.setAttribute("message", "Thời gian bắt đầu phải trước thời gian kết thúc!");
                reloadAuctionList(request, response);
                return;
            }

            // Lấy LandLotID dựa vào tên lô đất
            int landLotID = auctionDAO.getLandLotIDByName(landLotName);
            if (landLotID == -1) {
                request.setAttribute("message", "Tên lô đất không hợp lệ!");
                reloadAuctionList(request, response);
                return;
            }

            // Lấy auctioneerID dựa vào tên auctioneer
            int auctioneerID = auctionDAO.getUserIDByName(auctioneerName);
            if (auctioneerID == -1) {
                request.setAttribute("message", "Tên người đấu giá không hợp lệ!");
                reloadAuctionList(request, response);
                return;
            }

            // Check for auctioneer availability during the time range
            if (!auctionDAO.isAuctioneerAvailable(auctioneerID, startDate, endDate)) {
                request.setAttribute("message", "Người đấu giá không có mặt trong thời gian này!");
                reloadAuctionList(request, response);
                return;
            }

            // Lấy winnerID (nếu có)
            Integer winnerID = null;
            if (winnerName != null && !winnerName.isEmpty() && !winnerName.equals("Chưa có")) {
                winnerID = auctionDAO.getUserIDByName(winnerName);
                if (winnerID == -1) {
                    request.setAttribute("message", "Tên người chiến thắng không hợp lệ!");
                    reloadAuctionList(request, response);
                    return;
                }
            }

            // If no winner, only "Ongoing" or "Cancelled" status is allowed
            if (winnerName == null || winnerName.isEmpty()) {
                if (!status.equals("Ongoing") && !status.equals("Cancelled")) {
                    request.setAttribute("message", "Trạng thái không hợp lệ! Trạng thái phải là 'Đang diễn ra' hoặc 'Đã hủy' nếu không có người chiến thắng.");
                    reloadAuctionList(request, response);
                    return;
                }
            }

            Auction newAuction = new Auction(landLotID, auctioneerID, landLotName, auctioneerName, winnerName, startDate, endDate, status);

            if (winnerID != null) {
                newAuction.setWinnerID(winnerID);
            }

            boolean success = auctionDAO.addAuction(newAuction);
            request.setAttribute("message", success ? "Đã thêm đấu giá thành công!" : "Không thể thêm đấu giá!");

            reloadAuctionList(request, response);
        }

    }

    private void reloadAuctionList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Auction> auctions = auctionDAO.getAllAuctions();  // Reload auction list
        request.setAttribute("auctions", auctions);
        // Fetch data for dropdowns
        List<String> landLotNames = auctionDAO.getAllLandLotNames();
        List<String> auctioneerNames = auctionDAO.getAllAuctioneerNames();
        List<String> winnerNames = auctionDAO.getAllWinnerNames();

        // Set attributes for the form dropdowns
        request.setAttribute("landLotNames", landLotNames);
        request.setAttribute("auctioneerNames", auctioneerNames);
        request.setAttribute("winnerNames", winnerNames);
        request.getRequestDispatcher("list_auction.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Auction management servlet";
    }
}