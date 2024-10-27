package model;

import java.sql.Date;
import java.util.List;
import jdk.jfr.Timestamp;

public class LandLots {

    private int landLotsID;
    private int sellerID;
    private String landLotName;
    private String location;
    private float area;
    private String description;
    private long startprice;
    private Date createdAt;
    private String status;
    private List<ZoningTypes> zoningtype;
    private List<LandLotImage> landlotimage;
    private Date startTime;
    private Date endTime;
    private String status1;
    public LandLots() {
    }

    public LandLots(int landLotsID, int sellerID, String landLotName, String location, float area, String description, long startprice, Date createdAt, String status, List<ZoningTypes> zoningtype, List<LandLotImage> landlotimage, Date startTime, Date endTime, String status1) {
        this.landLotsID = landLotsID;
        this.sellerID = sellerID;
        this.landLotName = landLotName;
        this.location = location;
        this.area = area;
        this.description = description;
        this.startprice = startprice;
        this.createdAt = createdAt;
        this.status = status;
        this.zoningtype = zoningtype;
        this.landlotimage = landlotimage;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status1 = status1;
    }

    public LandLots(int landLotsID, int sellerID, String landLotName, String location, float area, String description, long startprice, Date createdAt, String status, List<ZoningTypes> zoningtype, List<LandLotImage> landlotimage, Date startTime, Date endTime) {
        this.landLotsID = landLotsID;
        this.sellerID = sellerID;
        this.landLotName = landLotName;
        this.location = location;
        this.area = area;
        this.description = description;
        this.startprice = startprice;
        this.createdAt = createdAt;
        this.status = status;
        this.zoningtype = zoningtype;
        this.landlotimage = landlotimage;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public LandLots(int landLotsID, int sellerID, String landLotName, String location, float area, String description, long startprice, Date createdAt, String status) {
        this.landLotsID = landLotsID;
        this.sellerID = sellerID;
        this.landLotName = landLotName;
        this.location = location;
        this.area = area;
        this.description = description;
        this.startprice = startprice;
        this.createdAt = createdAt;
        this.status = status;
    }

    public LandLots(int landLotsID, int sellerID, String landLotName, String location, float area, String description, long startprice, Date createdAt, String status, List<ZoningTypes> zoningtype, List<LandLotImage> landlotimage) {
        this.landLotsID = landLotsID;
        this.sellerID = sellerID;
        this.landLotName = landLotName;
        this.location = location;
        this.area = area;
        this.description = description;
        this.startprice = startprice;
        this.createdAt = createdAt;
        this.status = status;
        this.zoningtype = zoningtype;
        this.landlotimage = landlotimage;
    }

    public String getStatus1() {
        return status1;
    }

    public void setStatus1(String status1) {
        this.status1 = status1;
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
    
    
    public int getLandLotsID() {
        return landLotsID;
    }

    public void setLandLotsID(int landLotsID) {
        this.landLotsID = landLotsID;
    }

    public int getSellerID() {
        return sellerID;
    }

    public void setSellerID(int sellerID) {
        this.sellerID = sellerID;
    }

    public String getLandLotName() {
        return landLotName;
    }

    public void setLandLotName(String landLotName) {
        this.landLotName = landLotName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public float getArea() {
        return area;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getStartprice() {
        return startprice;
    }

    public void setStartprice(long startprice) {
        this.startprice = startprice;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<ZoningTypes> getZoningtype() {
        return zoningtype;
    }

    public void setZoningtype(List<ZoningTypes> zoningtype) {
        this.zoningtype = zoningtype;
    }

    public List<LandLotImage> getLandlotimage() {
        return landlotimage;
    }

    public void setLandlotimage(List<LandLotImage> landlotimage) {
        this.landlotimage = landlotimage;
    }

    @Override
    public String toString() {
        return "LandLots{" + "landLotsID=" + landLotsID + ", sellerID=" + sellerID + ", landLotName=" + landLotName + ", location=" + location + ", area=" + area + ", description=" + description + ", startprice=" + startprice + ", createdAt=" + createdAt + ", status=" + status + ", zoningtype=" + zoningtype + ", landlotimage=" + landlotimage + ", startTime=" + startTime + ", endTime=" + endTime + ", status1=" + status1 + '}';
    }


    

}
