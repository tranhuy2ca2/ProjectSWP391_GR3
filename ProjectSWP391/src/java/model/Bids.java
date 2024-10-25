/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author FPTSHOP
 */
public class Bids {

    private int BidID, AuctionID, BidderID;
    private BigDecimal BidAmount;
    private Date BidTime;

    public Bids() {
    }

    public Bids(int BidID, int AuctionID, int BidderID, BigDecimal BidAmount, Date BidTime) {
        this.BidID = BidID;
        this.AuctionID = AuctionID;
        this.BidderID = BidderID;
        this.BidAmount = BidAmount;
        this.BidTime = BidTime;
    }

    public int getBidID() {
        return BidID;
    }

    public void setBidID(int BidID) {
        this.BidID = BidID;
    }

    public int getAuctionID() {
        return AuctionID;
    }

    public void setAuctionID(int AuctionID) {
        this.AuctionID = AuctionID;
    }

    public int getBidderID() {
        return BidderID;
    }

    public void setBidderID(int BidderID) {
        this.BidderID = BidderID;
    }

    public BigDecimal getBidAmount() {
        return BidAmount;
    }

    public void setBidAmount(BigDecimal BidAmount) {
        this.BidAmount = BidAmount;
    }

    public Date getBidTime() {
        return BidTime;
    }

    public void setBidTime(Date BidTime) {
        this.BidTime = BidTime;
    }

    @Override
    public String toString() {
        return "Bids{" + "BidID=" + BidID + ", AuctionID=" + AuctionID + ", BidderID=" + BidderID + ", BidAmount=" + BidAmount + ", BidTime=" + BidTime + '}';
    }

}
