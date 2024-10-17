package model;

import java.util.Date;

public class Auction {
    private int auctionID;
    private int landLotID;
    private String landLotName;
    private String auctioneerName;
    private String winnerName;
    private int winnerID;  // Add winnerID field
    private Date startTime;
    private Date endTime;
    private String status;

    // Constructor with both landLotID and landLotName
    public Auction(int auctionID, int landLotID, String landLotName, String auctioneerName, String winnerName, Date startTime, Date endTime, String status) {
        this.auctionID = auctionID;
        this.landLotID = landLotID;
        this.landLotName = landLotName;
        this.auctioneerName = auctioneerName;
        this.winnerName = winnerName != null ? winnerName : "Chưa có";
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
        this.winnerID = -1;  // Default to -1 if no winner is assigned
    }

    public Auction() {
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

    public int getWinnerID() {  // Getter for winnerID
        return winnerID;
    }

    public void setWinnerID(int winnerID) {  // Setter for winnerID
        this.winnerID = winnerID;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
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
        return "Auction{" + "auctionID=" + auctionID + ", landLotID=" + landLotID + ", landLotName=" + landLotName + ", auctioneerName=" + auctioneerName + ", winnerName=" + winnerName + ", winnerID=" + winnerID + ", startTime=" + startTime + ", endTime=" + endTime + ", status=" + status + '}';
    }
}
