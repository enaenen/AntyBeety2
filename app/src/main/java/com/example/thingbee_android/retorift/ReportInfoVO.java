package com.example.thingbee_android.retorift;
import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class ReportInfoVO {
	@SerializedName("id")
	private int id;
	@SerializedName("lat")
	private double lat;
	@SerializedName("lon")
	private double lon;
	@SerializedName("address")
	private String address;
	@SerializedName("date")
	private String date;
	@SerializedName("comments")
	private String comments;
	@SerializedName("category")
	private String category;

	public ReportInfoVO(){}
	public ReportInfoVO(int id, double lat, double lon, String address, String date, String comments, String category) {
		this.id = id;
		this.lat = lat;
		this.lon = lon;
		this.address = address;
		this.date = date;
		this.comments = comments;
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		ReportInfoVO that = (ReportInfoVO) o;

		if (id != that.id) return false;
		if (Double.compare(that.lat, lat) != 0) return false;
		if (Double.compare(that.lon, lon) != 0) return false;
		if (comments != that.comments) return false;
		if (!address.equals(that.address)) return false;
		if (!date.equals(that.date)) return false;
		return category.equals(that.category);
	}

	@Override
	public int hashCode() {
		int result;
		long temp;
		result = id;
		temp = Double.doubleToLongBits(lat);
		result = 31 * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(lon);
		result = 31 * result + (int) (temp ^ (temp >>> 32));
		result = 31 * result + address.hashCode();
		result = 31 * result + date.hashCode();
		result = 31 * result + comments.hashCode();
		result = 31 * result + category.hashCode();
		return result;
	}

	@Override
	public String toString() {
		return "ReportInfoVO{" +
				"id=" + id +
				", lat=" + lat +
				", lon=" + lon +
				", address='" + address + '\'' +
				", date='" + date + '\'' +
				", comments=" + comments +
				", category='" + category + '\'' +
				'}';
	}
}
