package model;

import java.sql.Timestamp;

public class Auction {

    private int auctionID;
    private int landLotID;
    private String landLotName;
    private String auctionnerid;
    private String auctioneerName;
    private String winnerName;
    private Integer winnerID; 
    private Timestamp startTime; 
    private Timestamp endTime;   
    private String status;
    private LandLots landLots;

    public LandLots getLandLots() {
        return landLots;
    }

    public void setLandLots(LandLots landLots) {
        this.landLots = landLots;
    }
    

    // Constructor with both landLotID and landLotName
    public Auction(int auctionID, int landLotID, String landLotName, String auctioneerName, String winnerName, Timestamp startTime, Timestamp endTime, String status) {
        this.auctionID = auctionID;
        this.landLotID = landLotID;
        this.landLotName = landLotName;
        this.auctioneerName = auctioneerName;
        this.winnerName = winnerName != null ? winnerName : "Chưa có";
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
        this.winnerID = null;  // Default to null if no winner is assigned
    }

    public Auction(int auctionID, int landLotID, String auctionnerid, Integer winnerID, Timestamp startTime, Timestamp endTime, String status) {
        this.auctionID = auctionID;
        this.landLotID = landLotID;
        this.auctionnerid = auctionnerid;
        this.winnerID = winnerID;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
    }
    
    public Auction() {
    }

    public String getAuctionnerid() {
        return auctionnerid;
    }

    public void setAuctionnerid(String auctionnerid) {
        this.auctionnerid = auctionnerid;
    }

    public int getAuctionID() {
        return auctionID;
    }

    public void setAuctionID(int auctionID) {
        this.auctionID = auctionID;
    }

    public int getLandLotID() {
        return landLotID;
    }

    public void setLandLotID(int landLotID) {
        this.landLotID = landLotID;
    }

    public String getLandLotName() {
        return landLotName;
    }

    public void setLandLotName(String landLotName) {
        this.landLotName = landLotName;
    }

    public String getAuctioneerName() {
        return auctioneerName;
    }

    public void setAuctioneerName(String auctioneerName) {
        this.auctioneerName = auctioneerName;
    }

    public String getWinnerName() {
        return winnerName;
    }

    public void setWinnerName(String winnerName) {
        this.winnerName = winnerName;
    }

    public Integer getWinnerID() {
        return winnerID;
    }

    public void setWinnerID(Integer winnerID) {
        this.winnerID = winnerID;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Auction{" + 
               "auctionID=" + auctionID + 
               ", landLotID=" + landLotID + 
               ", landLotName=" + landLotName + 
               ", auctioneerName=" + auctioneerName + 
               ", winnerName=" + winnerName + 
               ", winnerID=" + winnerID + 
               ", startTime=" + startTime + 
               ", endTime=" + endTime + 
               ", status=" + status + 
               '}';
    }
}