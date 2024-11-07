package DAO;

import DAL.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Auction;
import model.LandLots;
import java.sql.Timestamp;

public class AuctionDAO {

    public void updateAuctionTime(int auctionID, java.sql.Timestamp startTime, java.sql.Timestamp endTime) {
        String sql = "UPDATE Auctions SET StartTime = ?, EndTime = ? WHERE AuctionID = ?";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setTimestamp(1, startTime);
            pstmt.setTimestamp(2, endTime);
            pstmt.setInt(3, auctionID);
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to retrieve all auctions
    public List<Auction> getAllAuctions() {
        List<Auction> auctions = new ArrayList<>();
        String query = "SELECT LL.LandLotID, LL.LandLotName, A.auctionID, A.startTime, A.endTime, A.status, "
                + "U1.userName AS AuctioneerName, U2.userName AS WinnerName "
                + "FROM Auctions A "
                + "JOIN LandLots LL ON A.landLotID = LL.landLotID "
                + "JOIN Users U1 ON A.auctioneerID = U1.userID "
                + "LEFT JOIN Users U2 ON A.winnerID = U2.userID";

        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Auction auction = new Auction(
                        rs.getInt("auctionID"),
                        rs.getInt("LandLotID"),
                        rs.getString("LandLotName"),
                        rs.getString("AuctioneerName"),
                        rs.getString("WinnerName"),
                        rs.getTimestamp("startTime"),
                        rs.getTimestamp("endTime"),
                        rs.getString("status")
                );
                auctions.add(auction);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return auctions;
    }

// Method to retrieve all Land Lot names
    public List<String> getAllLandLotNames() {
        List<String> landLotNames = new ArrayList<>();
        String query = "SELECT LandLotName FROM LandLots";

        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                landLotNames.add(rs.getString("LandLotName"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return landLotNames;
    }

    public List<String> getAllAuctioneerNames() {
        List<String> auctioneerNames = new ArrayList<>();
        String query = "SELECT userName FROM Users WHERE role = 4";  // Fetch only users with role 4 (Auctioneers)

        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                auctioneerNames.add(rs.getString("userName"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return auctioneerNames;
    }

    public List<String> getAllWinnerNames() {
        List<String> winnerNames = new ArrayList<>();
        String query = "SELECT userName FROM Users WHERE role = 2";  // Fetch only users with role 2 (Winners)

        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                winnerNames.add(rs.getString("userName"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return winnerNames;
    }

    public boolean isAuctioneerAvailable(int auctioneerID, java.sql.Timestamp startTime, java.sql.Timestamp endTime) {
        String query = "SELECT COUNT(*) FROM Auctions WHERE auctioneerID = ? AND "
                + "(? BETWEEN startTime AND endTime OR ? BETWEEN startTime AND endTime OR "
                + "startTime BETWEEN ? AND ? OR endTime BETWEEN ? AND ?)";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, auctioneerID);
            ps.setTimestamp(2, (java.sql.Timestamp) startTime);
            ps.setTimestamp(3, (java.sql.Timestamp) endTime);
            ps.setTimestamp(4, (java.sql.Timestamp) startTime);
            ps.setTimestamp(5, (java.sql.Timestamp) endTime);
            ps.setTimestamp(6, (java.sql.Timestamp) startTime);
            ps.setTimestamp(7, (java.sql.Timestamp) endTime);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) == 0;  // No conflicts
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;  // Conflict found or error occurred
    }

    // Method to get auction by ID
    public Auction getAuctionById(int auctionID) {
        String query = "SELECT * FROM Auctions WHERE auctionID = ?";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, auctionID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Auction(
                            rs.getInt("AuctionID"),
                            rs.getInt("LandLotID"),
                            rs.getString("AuctioneerID"),
                            rs.getInt("WinnerID"),
                            rs.getTimestamp("StartTime"),
                            rs.getTimestamp("EndTime"),
                            rs.getString("Status")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateAuction(Auction auction) {
        String query = "UPDATE Auctions SET startTime = ?, endTime = ?, status = ?, winnerID = ? WHERE auctionID = ?";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setTimestamp(1, new java.sql.Timestamp(auction.getStartTime().getTime()));
            ps.setTimestamp(2, new java.sql.Timestamp(auction.getEndTime().getTime()));
            ps.setString(3, auction.getStatus());
            ps.setObject(4, auction.getWinnerID() != null ? auction.getWinnerID() : null); // Handle nullable WinnerID
            ps.setInt(5, auction.getAuctionID());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {

    AuctionDAO auctionDAO = new AuctionDAO();

    List<Auction> auctions = auctionDAO.getListAuctionByUser(3);

    for (Auction auction : auctions) {
        System.out.println(auction.getLandLots().getLandLotName());
    }
}

    // Method to delete an auction
    public boolean deleteAuction(int auctionID) {
        String query = "DELETE FROM Auctions WHERE auctionID = ?";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, auctionID);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getUserIDByName(String userName) {
        String query = "SELECT userID FROM Users WHERE userName = ?";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, userName);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("userID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;  // Return -1 if user is not found
    }
// Method to get landLotID by landLotName

    public int getLandLotIDByName(String landLotName) {
        String query = "SELECT LandLotID FROM LandLots WHERE LandLotName = ?";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, landLotName);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("LandLotID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;  // Return -1 if no matching land lot is found
    }

    public boolean isAuctionExistingForLandLot(int landLotID) {
        String query = "SELECT 1 FROM Auctions WHERE landLotID = ?";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, landLotID);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next(); // returns true if a row exists
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addAuction(Auction auction) {
        // Truy vấn để thêm đấu giá vào bảng Auctions
        String query = "INSERT INTO Auctions (landLotID, auctioneerID, startTime, endTime, status, winnerID) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            // Kiểm tra xem LandLotName có tồn tại trong bảng LandLots hay không
            int landLotID = getLandLotIDByName(auction.getLandLotName());
            if (landLotID == -1) {
                System.out.println("Land lot not found.");
                return false;  // Nếu LandLotName không tồn tại, trả về false
            }
            ps.setInt(1, landLotID);

            // Kiểm tra xem Auctioneer (người tổ chức) có tồn tại không
            int auctioneerID = getUserIDByName(auction.getAuctioneerName());
            if (auctioneerID == -1) {
                System.out.println("Auctioneer not found.");
                return false;  // Nếu người tổ chức không tồn tại, trả về false
            }
            ps.setInt(2, auctioneerID);

            // Gán thời gian bắt đầu và kết thúc cho phiên đấu giá
            ps.setTimestamp(3, new java.sql.Timestamp(auction.getStartTime().getTime()));
            ps.setTimestamp(4, new java.sql.Timestamp(auction.getEndTime().getTime()));

            // Gán trạng thái cho phiên đấu giá
            ps.setString(5, auction.getStatus());

            // Kiểm tra xem người thắng đấu giá có tồn tại không, nếu có thì lấy ID
            if (auction.getWinnerName() != null && !auction.getWinnerName().equals("Chưa có")) {
                int winnerID = getUserIDByName(auction.getWinnerName());
                if (winnerID == -1) {
                    System.out.println("Winner not found.");
                    return false;  // Nếu người thắng đấu giá không tồn tại, trả về false
                }
                ps.setInt(6, winnerID);
            } else {
                ps.setNull(6, java.sql.Types.INTEGER);  // Nếu chưa có người thắng, đặt giá trị null
            }

            // Thực hiện thêm đấu giá vào cơ sở dữ liệu
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;  // Trả về false nếu có lỗi xảy ra
    }
    
    public void createAuction(Auction auction){
        String sql = "INSERT INTO [dbo].[Auctions]\n" +
                                "           ([LandLotID]\n" +
                                "           ,[AuctioneerID]\n" +
                                "           ,[StartTime]\n" +
                                "           ,[EndTime]\n" +
                                "           ,[Status])\n" +
                                "     VALUES\n" +
                                "           (?\n" +
                                "           ,?\n" +
                                "           ,?\n" +
                                "           ,?\n" +
                                "           ,?)";
        
            try (Connection con = new DBContext().getConnection(); 
                    PreparedStatement ps = con.prepareStatement(sql)) {

               ps.setInt(1, auction.getLandLotID());
               ps.setString(2, auction.getAuctionnerid());
               ps.setTimestamp(3, auction.getStartTime());
               ps.setTimestamp(4, auction.getEndTime());
               ps.setString(5, auction.getStatus());
               
               ps.executeUpdate();
           } catch (Exception e) {
               e.printStackTrace();
           }            
    }
    
       public List<Auction> getListAuctionByUser(int bidderId) {
    List<Auction> auctions = new ArrayList<>();
    String query = "SELECT LandLots.LandLotName, LandLots.Location, Auctions.StartTime, Auctions.EndTime, Auctions.Status, Auctions.WinnerID, LandLots.LandLotID, Auctions.AuctionID, Bids.BidID \n" +
"                   FROM Auctions \n" +
"                   JOIN Bids ON Auctions.AuctionID = Bids.AuctionID \n" +
"                   JOIN LandLots ON Auctions.LandLotID = LandLots.LandLotID \n" +
"                   WHERE Bids.BidderID = ?";

    try (Connection con = new DBContext().getConnection();
         PreparedStatement ps = con.prepareStatement(query)) {

        ps.setInt(1, bidderId);  // This binds the parameter correctly

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                // Create LandLots object from query result
                LandLots landLots = new LandLots();
                landLots.setLandLotsID(rs.getInt("LandLotID"));
                landLots.setLandLotName(rs.getString("LandLotName"));
                landLots.setLocation(rs.getString("Location"));

                // Create Auction object and set its properties
                Auction auction = new Auction();
                auction.setLandLots(landLots);
                auction.setStartTime(new Timestamp(rs.getDate("StartTime").getTime()));
                auction.setEndTime(new Timestamp(rs.getDate("EndTime").getTime()));
                auction.setStatus(rs.getString("Status"));
                auction.setWinnerID(rs.getInt("WinnerID"));
                auctions.add(auction);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return auctions;
}
      // Method to get auction by Land Lots ID
    public Auction getAuctionByLandLotId(int llid) {
        String query = "SELECT * FROM Auctions WHERE LandLotID = ?";
        try (Connection con = new DBContext().getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, llid);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Auction(
                            rs.getInt("AuctionID"),
                            rs.getInt("LandLotID"),
                            rs.getString("AuctioneerID"),
                            rs.getInt("WinnerID"),
                            rs.getTimestamp("StartTime"),
                            rs.getTimestamp("EndTime"),
                            rs.getString("Status")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
}
