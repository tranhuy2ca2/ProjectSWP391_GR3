/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Auction;
import model.Customer;
import model.LandLotImage;
import model.LandLots;
import model.ZoningTypes;

public class LandLotsDAO {

    private Connection con;
    PreparedStatement ps;
    ResultSet rs;
    private List<Customer> user;
    private String status = "ok";

    public LandLotsDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public List<ZoningTypes> LoadAllZoningType() {
        List<ZoningTypes> listzoning = new ArrayList<ZoningTypes>();
        String sql = "select*from ZoningTypes";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listzoning.add(new ZoningTypes(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            status = "error at load Category";
        }
        return listzoning;
    }

    public void UploadLand(String landlotname, String location, String area, String detail, String startprice,
            String publishdate, String status, String userid, List<String> zoningtypeID, List<String> imageURLs) {
        String sql = """
                 Insert into LandLots(SellerID, LandLotName, [Location], Area, [Description],StartingPrice, CreatedAt, [Status])
                 Values(?,?,?,?,?,?,?,?)""";
        try {
            // Tạo PreparedStatement cho câu lệnh INSERT INTO cho bảng LandLots
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, userid);
            ps.setString(2, landlotname);
            ps.setString(3, location);
            ps.setString(4, area);
            ps.setString(5, detail);
            ps.setString(6, startprice);
            ps.setString(7, publishdate);
            ps.setString(8, status);
            ps.executeUpdate();

            // Lấy ra LandLotID vừa được sinh tự động
            ResultSet rs = ps.getGeneratedKeys();
            int landlotID = -1;
            if (rs.next()) {
                landlotID = rs.getInt(1);
            }

            // Nếu LandLotID hợp lệ, lưu các zoningID vào bảng LandLotZoning
            if (landlotID != -1) {
                sql = "Insert into LandLotZoning(LandLotID, ZoningID) Values(?,?)";
                ps = con.prepareStatement(sql);
                for (String zoningID : zoningtypeID) {
                    ps.setInt(1, landlotID);
                    ps.setString(2, zoningID);
                    ps.executeUpdate();
                }

                // Lưu các ảnh vào bảng LandLotImages
                sql = "Insert Into LandLotImages(LandLotID, ImageURL, UploadedAt) Values(?,?,?)";
                ps = con.prepareStatement(sql);
                for (String imageURL : imageURLs) {
                    ps.setInt(1, landlotID);
                    ps.setString(2, imageURL);
                    ps.setString(3, publishdate);
                    ps.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void UpdateLand(int landlotID, String landlotname, String location, String area, String detail, String startprice,
            String publishdate, List<String> zoningtypeID, List<String> imageURLs) {
        String sql = """
                 UPDATE LandLots SET LandLotName = ?, [Location] = ?, Area = ?, [Description] = ?, StartingPrice = ?, CreatedAt = ?
                 WHERE LandLotID = ?""";
        try {
            // Cập nhật thông tin cơ bản của mảnh đất
            ps = con.prepareStatement(sql);
            ps.setString(1, landlotname);
            ps.setString(2, location);
            ps.setString(3, area);
            ps.setString(4, detail);
            ps.setString(5, startprice);
            ps.setString(6, publishdate);
            ps.setInt(7, landlotID);
            ps.executeUpdate();

            // Xóa các zoning hiện tại của mảnh đất trong bảng LandLotZoning
            sql = "DELETE FROM LandLotZoning WHERE LandLotID = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, landlotID);
            ps.executeUpdate();

            // Thêm các zoning mới từ danh sách zoningtypeID
            sql = "INSERT INTO LandLotZoning(LandLotID, ZoningID) VALUES(?, ?)";
            ps = con.prepareStatement(sql);
            for (String zoningID : zoningtypeID) {
                ps.setInt(1, landlotID);
                ps.setString(2, zoningID);
                ps.executeUpdate();
            }

            // Xóa các ảnh hiện tại của mảnh đất trong bảng LandLotImages
            sql = "DELETE FROM LandLotImages WHERE LandLotID = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, landlotID);
            ps.executeUpdate();

            // Thêm các ảnh mới từ danh sách imageURLs
            sql = "INSERT INTO LandLotImages(LandLotID, ImageURL, UploadedAt) VALUES(?, ?, ?)";
            ps = con.prepareStatement(sql);
            for (String imageURL : imageURLs) {
                ps.setInt(1, landlotID);
                ps.setString(2, imageURL);
                ps.setString(3, publishdate);
                ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<String> getImageLandByID(int landlotID) {
        List<String> imageURLs = new ArrayList<>();
        String sql = """
                 SELECT li.ImageURL FROM LandLots l JOIN LandLotImages li
                 ON l.LandLotID = li.LandLotID
                 WHERE l.LandLotID = ?""";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, landlotID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                imageURLs.add(rs.getString("ImageURL"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return imageURLs;
    }

    public List<LandLots> getLandLotsByUserID(int userID) {
        List<LandLots> land = new ArrayList<LandLots>();
        List<LandLots> book = new ArrayList<LandLots>();
        String sql = """
                     select*from LandLots
                     where SellerID = ?""";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                book.add(new LandLots(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getLong(7),
                        rs.getDate(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
        }
        return book;
    }

    public List<LandLots> getLandLotsDetailByUserID(int userID) {
        List<LandLots> landlotList = new ArrayList<>();

        // Truy vấn chính để lấy thông tin LandLots
        String sql = """
                 SELECT * FROM LandLots
                 WHERE SellerID = ?""";

        // Truy vấn để lấy loại zoning của LandLots
        String zonetypeSql = """
                         SELECT z.* FROM LandLotZoning lz
                         JOIN ZoningTypes z ON lz.ZoningID = z.ZoningID
                         WHERE lz.LandLotID = ?""";

        // Truy vấn để lấy hình ảnh của LandLots
        String imageSql = """
                      SELECT * FROM LandLotImages li 
                      WHERE li.LandLotID = ?""";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();

            while (rs.next()) {
                int landID = rs.getInt("LandLotID");
                List<ZoningTypes> zoningtypeList = new ArrayList<>();
                List<LandLotImage> landlotImages = new ArrayList<>();

                // Lấy danh sách zoning
                try (PreparedStatement zoningtypePs = con.prepareStatement(zonetypeSql)) {
                    zoningtypePs.setInt(1, landID);
                    try (ResultSet zoningtypeRs = zoningtypePs.executeQuery()) {
                        while (zoningtypeRs.next()) {
                            zoningtypeList.add(new ZoningTypes(
                                    zoningtypeRs.getInt("ZoningID"),
                                    zoningtypeRs.getString("ZoningCode"),
                                    zoningtypeRs.getString("ZoningDescription")
                            ));
                        }
                    }
                }

                // Lấy danh sách hình ảnh
                try (PreparedStatement imagePs = con.prepareStatement(imageSql)) {
                    imagePs.setInt(1, landID);
                    try (ResultSet imageRs = imagePs.executeQuery()) {
                        while (imageRs.next()) {
                            landlotImages.add(new LandLotImage(
                                    imageRs.getInt("ImageID"),
                                    imageRs.getInt("LandLotID"),
                                    imageRs.getString("ImageURL"),
                                    imageRs.getDate("UploadedAt")
                            ));
                        }
                    }
                }

                // Thêm vào danh sách LandLots
                landlotList.add(new LandLots(
                        rs.getInt("LandLotID"),
                        rs.getInt("SellerID"),
                        rs.getString("LandLotName"),
                        rs.getString("Location"),
                        rs.getFloat("Area"),
                        rs.getString("Description"),
                        rs.getLong("StartingPrice"),
                        rs.getDate("CreatedAt"),
                        rs.getString("Status"),
                        zoningtypeList, // Truyền danh sách zoning types
                        landlotImages // Truyền danh sách hình ảnh
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return landlotList;
    }

    public LandLots getLandLotsDetailByID(int landlotID) {
        LandLots b = null;

        // Truy vấn chính để lấy thông tin LandLots
        String sql = """
                 SELECT * FROM LandLots
                 WHERE LandLotID = ?""";

        // Truy vấn để lấy loại zoning của LandLots
        String zonetypeSql = """
                         SELECT z.* FROM LandLotZoning lz
                         JOIN ZoningTypes z ON lz.ZoningID = z.ZoningID
                         WHERE lz.LandLotID = ?""";

        // Truy vấn để lấy hình ảnh của LandLots
        String imageSql = """
                      SELECT * FROM LandLotImages li 
                      WHERE li.LandLotID = ?""";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, landlotID);
            rs = ps.executeQuery();

            while (rs.next()) {
                List<ZoningTypes> zoningtypeList = new ArrayList<>();
                List<LandLotImage> landlotImages = new ArrayList<>();

                // Lấy danh sách zoning
                try (PreparedStatement zoningtypePs = con.prepareStatement(zonetypeSql)) {
                    zoningtypePs.setInt(1, landlotID);
                    try (ResultSet zoningtypeRs = zoningtypePs.executeQuery()) {
                        while (zoningtypeRs.next()) {
                            zoningtypeList.add(new ZoningTypes(
                                    zoningtypeRs.getInt("ZoningID"),
                                    zoningtypeRs.getString("ZoningCode"),
                                    zoningtypeRs.getString("ZoningDescription")
                            ));
                        }
                    }
                }

                // Lấy danh sách hình ảnh
                try (PreparedStatement imagePs = con.prepareStatement(imageSql)) {
                    imagePs.setInt(1, landlotID);
                    try (ResultSet imageRs = imagePs.executeQuery()) {
                        while (imageRs.next()) {
                            landlotImages.add(new LandLotImage(
                                    imageRs.getInt("ImageID"),
                                    imageRs.getInt("LandLotID"),
                                    imageRs.getString("ImageURL"),
                                    imageRs.getDate("UploadedAt")
                            ));
                        }
                    }
                }

                // Thêm vào danh sách LandLots
                b = new LandLots(
                        rs.getInt("LandLotID"),
                        rs.getInt("SellerID"),
                        rs.getString("LandLotName"),
                        rs.getString("Location"),
                        rs.getFloat("Area"),
                        rs.getString("Description"),
                        rs.getLong("StartingPrice"),
                        rs.getDate("CreatedAt"),
                        rs.getString("Status"),
                        zoningtypeList, // Truyền danh sách zoning types
                        landlotImages // Truyền danh sách hình ảnh
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public List<LandLots> getAllLandLotsDetail() {
        List<LandLots> landlotList = new ArrayList<>();

        // Truy vấn chính để lấy thông tin LandLots
        String sql = "SELECT * FROM LandLots";

        // Truy vấn để lấy loại zoning của LandLots
        String zonetypeSql = """
                         SELECT z.* FROM LandLotZoning lz
                         JOIN ZoningTypes z ON lz.ZoningID = z.ZoningID
                         WHERE lz.LandLotID = ?""";

        // Truy vấn để lấy hình ảnh của LandLots
        String imageSql = """
                      SELECT * FROM LandLotImages li 
                      WHERE li.LandLotID = ?""";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int landID = rs.getInt("LandLotID");
                List<ZoningTypes> zoningtypeList = new ArrayList<>();
                List<LandLotImage> landlotImages = new ArrayList<>();

                // Lấy danh sách zoning
                try (PreparedStatement zoningtypePs = con.prepareStatement(zonetypeSql)) {
                    zoningtypePs.setInt(1, landID);
                    try (ResultSet zoningtypeRs = zoningtypePs.executeQuery()) {
                        while (zoningtypeRs.next()) {
                            zoningtypeList.add(new ZoningTypes(
                                    zoningtypeRs.getInt("ZoningID"),
                                    zoningtypeRs.getString("ZoningCode"),
                                    zoningtypeRs.getString("ZoningDescription")
                            ));
                        }
                    }
                }

                // Lấy danh sách hình ảnh
                try (PreparedStatement imagePs = con.prepareStatement(imageSql)) {
                    imagePs.setInt(1, landID);
                    try (ResultSet imageRs = imagePs.executeQuery()) {
                        while (imageRs.next()) {
                            landlotImages.add(new LandLotImage(
                                    imageRs.getInt("ImageID"),
                                    imageRs.getInt("LandLotID"),
                                    imageRs.getString("ImageURL"),
                                    imageRs.getDate("UploadedAt")
                            ));
                        }
                    }
                }

                // Thêm vào danh sách LandLots
                landlotList.add(new LandLots(
                        rs.getInt("LandLotID"),
                        rs.getInt("SellerID"),
                        rs.getString("LandLotName"),
                        rs.getString("Location"),
                        rs.getInt("Area"),
                        rs.getString("Description"),
                        rs.getLong("StartingPrice"),
                        rs.getDate("CreatedAt"),
                        rs.getString("Status"),
                        zoningtypeList, // Truyền danh sách zoning types
                        landlotImages // Truyền danh sách hình ảnh
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return landlotList;
    }

    public List<LandLots> getAllLandLotsDetail1() {
        List<LandLots> landlotList = new ArrayList<>();

        // Truy vấn chính để lấy thông tin LandLots
        String sql = "SELECT * FROM LandLots l join Auctions a on l.LandLotID = a.LandLotID  WHERE l.status = 'Available' ";

        // Truy vấn để lấy loại zoning của LandLots
        String zonetypeSql = """
                         SELECT z.* FROM LandLotZoning lz
                         JOIN ZoningTypes z ON lz.ZoningID = z.ZoningID
                         WHERE lz.LandLotID = ?""";

        // Truy vấn để lấy hình ảnh của LandLots
        String imageSql = """
                      SELECT * FROM LandLotImages li 
                      WHERE li.LandLotID = ?""";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int landID = rs.getInt("LandLotID");
                List<ZoningTypes> zoningtypeList = new ArrayList<>();
                List<LandLotImage> landlotImages = new ArrayList<>();
                // Lấy danh sách zoning
                try (PreparedStatement zoningtypePs = con.prepareStatement(zonetypeSql)) {
                    zoningtypePs.setInt(1, landID);
                    try (ResultSet zoningtypeRs = zoningtypePs.executeQuery()) {
                        while (zoningtypeRs.next()) {
                            zoningtypeList.add(new ZoningTypes(
                                    zoningtypeRs.getInt("ZoningID"),
                                    zoningtypeRs.getString("ZoningCode"),
                                    zoningtypeRs.getString("ZoningDescription")
                            ));
                        }
                    }
                }

                // Lấy danh sách hình ảnh
                try (PreparedStatement imagePs = con.prepareStatement(imageSql)) {
                    imagePs.setInt(1, landID);
                    try (ResultSet imageRs = imagePs.executeQuery()) {
                        while (imageRs.next()) {
                            landlotImages.add(new LandLotImage(
                                    imageRs.getInt("ImageID"),
                                    imageRs.getInt("LandLotID"),
                                    imageRs.getString("ImageURL"),
                                    imageRs.getDate("UploadedAt")
                            ));
                        }
                    }
                }

                // Thêm vào danh sách LandLots
                landlotList.add(new LandLots(
                        rs.getInt("LandLotID"),
                        rs.getInt("SellerID"),
                        rs.getString("LandLotName"),
                        rs.getString("Location"),
                        rs.getInt("Area"),
                        rs.getString("Description"),
                        rs.getLong("StartingPrice"),
                        rs.getDate("CreatedAt"),
                        rs.getString("Status"),
                        zoningtypeList, // Truyền danh sách zoning types
                        landlotImages,
                        rs.getTimestamp(13),
                        rs.getTimestamp(14),
                        rs.getString(15)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return landlotList;
    }

    public List<LandLots> getAllLandLotsDetail(String keyword, String order) {
        List<LandLots> landlotList = new ArrayList<>();

        // Truy vấn chính để lấy thông tin LandLots
        String sql = "SELECT * FROM LandLots l join Auctions a on l.LandLotID = a.LandLotID  WHERE l.status = 'Available'  ";

        // Truy vấn để lấy loại zoning của LandLots
        String zonetypeSql = """
                         SELECT z.* FROM LandLotZoning lz
                         JOIN ZoningTypes z ON lz.ZoningID = z.ZoningID
                         WHERE lz.LandLotID = ?""";

        // Truy vấn để lấy hình ảnh của LandLots
        String imageSql = """
                      SELECT * FROM LandLotImages li 
                      WHERE li.LandLotID = ?""";

        try {
            if (keyword != null && !keyword.trim().isEmpty()) {
                sql += " and LandLotName like ?";
            }
            if (order != null) {
                sql += " order by " + order;
            }
            ps = con.prepareStatement(sql);
            if (keyword != null && !keyword.trim().isEmpty()) {
                ps.setString(1, "%" + keyword + "%");
            }
            rs = ps.executeQuery();

            while (rs.next()) {
                int landID = rs.getInt("LandLotID");
                List<ZoningTypes> zoningtypeList = new ArrayList<>();
                List<LandLotImage> landlotImages = new ArrayList<>();

                // Lấy danh sách zoning
                try (PreparedStatement zoningtypePs = con.prepareStatement(zonetypeSql)) {
                    zoningtypePs.setInt(1, landID);
                    try (ResultSet zoningtypeRs = zoningtypePs.executeQuery()) {
                        while (zoningtypeRs.next()) {
                            zoningtypeList.add(new ZoningTypes(
                                    zoningtypeRs.getInt("ZoningID"),
                                    zoningtypeRs.getString("ZoningCode"),
                                    zoningtypeRs.getString("ZoningDescription")
                            ));
                        }
                    }
                }

                // Lấy danh sách hình ảnh
                try (PreparedStatement imagePs = con.prepareStatement(imageSql)) {
                    imagePs.setInt(1, landID);
                    try (ResultSet imageRs = imagePs.executeQuery()) {
                        while (imageRs.next()) {
                            landlotImages.add(new LandLotImage(
                                    imageRs.getInt("ImageID"),
                                    imageRs.getInt("LandLotID"),
                                    imageRs.getString("ImageURL"),
                                    imageRs.getDate("UploadedAt")
                            ));
                        }
                    }
                }
                LandLots landLot = new LandLots(
                        rs.getInt("LandLotID"),
                        rs.getInt("SellerID"),
                        rs.getString("LandLotName"),
                        rs.getString("Location"),
                        rs.getInt("Area"),
                        rs.getString("Description"),
                        rs.getLong("StartingPrice"),
                        rs.getDate("CreatedAt"),
                        rs.getString("Status"),
                        zoningtypeList,
                        // Truyền danh sách zoning types
                        landlotImages // Truyền danh sách hình ảnh
                );
                landLot.setStartTime(rs.getTimestamp(13));
                landLot.setEndTime(rs.getTimestamp(14));

                landLot.setStatus1(rs.getString(15));

                // Thêm vào danh sách LandLots
                landlotList.add(landLot);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return landlotList;
    }

    public boolean saveAuction(int userId, int landLotId) {
        String checkSql = "SELECT COUNT(*) FROM FavoriteLandLots WHERE UserID = ? AND LandLotID = ?";
        String insertSql = "INSERT INTO FavoriteLandLots (UserID, LandLotID) VALUES (?, ?)";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement checkStmt = conn.prepareStatement(checkSql); PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {

            // Check if the land lot is already saved
            checkStmt.setInt(1, userId);
            checkStmt.setInt(2, landLotId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                // Land lot is already saved, so don't insert again
                return false;
            }

            // Insert the land lot into favorites if it does not exist
            insertStmt.setInt(1, userId);
            insertStmt.setInt(2, landLotId);
            int rowAf = insertStmt.executeUpdate();
            return rowAf > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isLandLotFavorite(int userId, int landLotId) {
        String sql = "SELECT COUNT(*) FROM FavoriteLandLots WHERE UserID = ? AND LandLotID = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, landLotId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteFavoriteLandLot(int userId, int landLotId) {
        String sql = "DELETE FROM FavoriteLandLots WHERE userId = ? AND landLotId = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, landLotId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();

            return false;
        }
    }

    public List<LandLots> getSavedLandLotsByUser(int userId) {
        List<LandLots> landLots = new ArrayList<>();
        String sql = "SELECT LandLots.LandLotID, LandLots.LandLotName, LandLots.Location, LandLots.Area, "
                + "LandLots.Description, LandLots.StartingPrice "
                + "FROM LandLots INNER JOIN FavoriteLandLots ON LandLots.LandLotID = FavoriteLandLots.LandLotID "
                + "WHERE FavoriteLandLots.UserID = ?";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    LandLots landLot = new LandLots();
                    landLot.setLandLotsID(rs.getInt("LandLotID"));
                    landLot.setLandLotName(rs.getString("LandLotName"));
                    landLot.setLocation(rs.getString("Location"));
                    landLot.setArea(rs.getFloat("Area"));
                    landLot.setDescription(rs.getString("Description"));
                    landLot.setStartprice(rs.getLong("StartingPrice"));

                    landLots.add(landLot);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return landLots;
    }

    public void updateStatusLandLots(int id, String status) {
        String sql = "UPDATE [dbo].[LandLots]\n"
                + "   SET [Status] = ?\n"
                + " WHERE LandLotID = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, id);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        LandLotsDAO ldao = new LandLotsDAO();
        ldao.getSavedLandLotsByUser(6);
        ldao.saveAuction(6, 31);
        System.out.println(ldao.getLandLotsDetailByID(26));
    }
}
