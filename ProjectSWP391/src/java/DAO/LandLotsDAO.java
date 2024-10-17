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
import java.util.Arrays;
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

    public List<LandLots> getLandLotsByUserID(int userID) {
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
                        rs.getFloat(7),
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
                                    imageRs.getDate("UploadDate")
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
                        rs.getFloat("StartPrice"),
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
                        rs.getFloat("StartingPrice"),
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
// Method to get all land lots with their images
public List<LandLots> getAllLandLotsWithImages() {
    List<LandLots> landLotsList = new ArrayList<>();
    
    try {
        String query = "SELECT l.LandLotID, l.SellerID, l.LandLotName, l.Location, l.Area, l.Description, "
                     + "l.StartingPrice, l.CreatedAt, l.Status, i.ImageID, i.ImageURL, i.UploadedAt "
                     + "FROM LandLots l "
                     + "LEFT JOIN LandLotImages i ON l.LandLotID = i.LandLotID "
                     + "ORDER BY l.LandLotID";
        
        PreparedStatement stmt = con.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {
            int landLotID = rs.getInt("LandLotID");
            LandLots landLot = findLandLotById(landLotsList, landLotID);

            // If LandLot is not already in the list, create a new one
            if (landLot == null) {
                landLot = new LandLots(
                    landLotID,
                    rs.getInt("SellerID"),
                    rs.getString("LandLotName"),
                    rs.getString("Location"),
                    rs.getFloat("Area"),
                    rs.getString("Description"),
                    rs.getFloat("StartingPrice"),
                    rs.getDate("CreatedAt"),
                    rs.getString("Status")
                );
                landLotsList.add(landLot);
            }

            // Add images to the landLot if present
            int imageID = rs.getInt("ImageID");
            if (imageID > 0) {
                LandLotImage image = new LandLotImage(
                    imageID,
                    landLotID,
                    rs.getString("ImageURL"),
                    rs.getDate("UploadedAt")
                );
                landLot.getLandlotimage().add(image);
            }
        }
        
     } catch (Exception e) {
            e.printStackTrace();
        }
    
    return landLotsList;
}

// Utility method to check if a LandLot is already in the list
private LandLots findLandLotById(List<LandLots> landLotsList, int landLotID) {
    for (LandLots lot : landLotsList) {
        if (lot.getLandLotsID() == landLotID) {
            return lot;
        }
    }
    return null;
}

    public static void main(String[] args) {
        LandLotsDAO dao = new LandLotsDAO();
        System.out.println(dao.getAllLandLotsDetail());
    }
}
