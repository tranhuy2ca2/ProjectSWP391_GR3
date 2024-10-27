/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.AuctionLogs;
import model.Customer;

/**
 *
 * @author FPTSHOP
 */
public class AuctionLogsDAO {

    private Connection con;
    PreparedStatement ps;
    ResultSet rs;
    private List<Customer> user;
    private String status = "ok";

    public AuctionLogsDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }
    public void addLog(AuctionLogs log) throws SQLException{
        String sql = "Inser into AuctionLogs (AuctionID, LogTime, Action, UserID) VALUE(?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, log.getAuctionID());
        ps.setInt(2, log.getLogID());
        ps.setInt(3,log.getUserID());
        ps.setString(4, log.getAction());
        ps.execute();
    }
    
    //get all log for a specific auction
    public List<AuctionLogs> getLogsByAuction(int auctionID) throws SQLException{
        List<AuctionLogs> logs = new ArrayList<>();
        String sql = "SELECT * FROM AuctionLogs WHERE AuctionID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,auctionID);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            AuctionLogs  log = new AuctionLogs();
            log.setLogID(rs.getInt("LogID"));
            log.setAuctionID(rs.getInt("AuctionID"));
            log.setUserID(rs.getInt("UserID"));
            log.setAction(rs.getString("setAction"));
            log.setLogTime(rs.getDate("LogTime"));
            logs.add(log);
        }
        return logs;
    }
    
    
    public List<AuctionLogs> getAllLogs() throws SQLException{
        List<AuctionLogs> logs = new ArrayList<>();
         String sql = "SELECT * FROM AuctionLogs";
         PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            AuctionLogs  log = new AuctionLogs();
            log.setLogID(rs.getInt("LogID"));
            log.setAuctionID(rs.getInt("AuctionID"));
            log.setUserID(rs.getInt("UserID"));
            log.setAction(rs.getString("setAction"));
            log.setLogTime(rs.getDate("LogTime"));
            logs.add(log);
        }
        return logs;
    }
    
    //delete log by LogID
    public void deleteLog(int logID) throws SQLException{
        String sql = "DELETE FROM AuctionLogs WHERE LogID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, logID);
        ps.executeUpdate();
    }
}
