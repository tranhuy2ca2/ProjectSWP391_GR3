/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Bids;

/**
 *
 * @author FPTSHOP
 */
public class BidsDAO extends DBContext{
    
    private Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public BidsDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
        }
    }
    public void InsertBids(Bids b){
        String sql = "INSERT INTO [dbo].[Bids]\n" +
                            "           ([AuctionID]\n" +
                            "           ,[BidderID]\n" +
                            "           ,[BidAmount]\n" +
                            "           ,[BidTime])\n" +
                            "     VALUES\n" +
                            "           (?\n" +
                            "           ,?\n" +
                            "           ,?\n" +
                            "           ,GETDATE())";
        try {
           ps = con.prepareStatement(sql);
            ps.setInt(1, b.getAuctionID());
            ps.setInt(2, b.getBidderID());
            ps.setBigDecimal(3, b.getBidAmount());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public Bids getLastMyBids(int id){
         String sql = "SELECT TOP 1 [BidID]\n" +
                            "      ,[AuctionID]\n" +
                            "      ,[BidderID]\n" +
                            "      ,[BidAmount]\n" +
                            "      ,[BidTime]\n" +
                            "  FROM [dbo].[Bids]\n" +
                            "  Where [BidderID] = ? \n" +
                            "  ORDER BY BidTime desc , [BidID] desc ";
         
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs =  ps.executeQuery();
            if(rs.next()){
                Bids b = new Bids();
                b.setBidID(rs.getInt("BidID"));
                b.setAuctionID(rs.getInt("AuctionID"));
                b.setBidderID( rs.getInt("BidderID"));
                b.setBidAmount(rs.getBigDecimal("BidAmount"));
                 b.setBidTime(rs.getTimestamp("BidTime") );
                 
                 return b;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public  BigDecimal getMaxBids(int auctionID){
        String sql = "SELECT MAX([BidAmount]) as max\n" +
                            "  FROM [dbo].[Bids]\n" +
                            "  Where [AuctionID] = ? ";
        BigDecimal maxBidAmount = null;
          try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, auctionID);
            rs =  ps.executeQuery();
             if (rs.next()) {
                maxBidAmount = rs.getBigDecimal("max"); 
            }
        } catch (Exception e) {
        }
           return maxBidAmount;
    }
}
