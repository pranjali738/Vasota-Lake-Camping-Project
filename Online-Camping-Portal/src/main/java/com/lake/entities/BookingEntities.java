package com.lake.entities;

public class BookingEntities 
{

	private int id;
	private String name;
	private String email;
	private Long phoneNo;
	private int NoPerson;
	private int NoKids;
	private String arrival_date;
	private String departure_date;
	private String tent_name;
	
	

	public BookingEntities(int id, String name, String email, Long phoneNo, int noPerson, int noKids,
			String arrival_date, String departure_date, String tent_name) {
		
		this.id = id;
		this.name = name;
		this.email = email;
		this.phoneNo = phoneNo;
		NoPerson = noPerson;
		NoKids = noKids;
		this.arrival_date = arrival_date;
		this.departure_date = departure_date;
		this.tent_name = tent_name;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public Long getPhoneNo() {
		return phoneNo;
	}



	public void setPhoneNo(Long phoneNo) {
		this.phoneNo = phoneNo;
	}



	public int getNoPerson() {
		return NoPerson;
	}



	public void setNoPerson(int noPerson) {
		NoPerson = noPerson;
	}



	public int getNoKids() {
		return NoKids;
	}



	public void setNoKids(int noKids) {
		NoKids = noKids;
	}



	public String getArrival_date() {
		return arrival_date;
	}



	public void setArrival_date(String arrival_date) {
		this.arrival_date = arrival_date;
	}



	public String getDeparture_date() {
		return departure_date;
	}



	public void setDeparture_date(String departure_date) {
		this.departure_date = departure_date;
	}



	public String getTent_name() {
		return tent_name;
	}



	public void setTent_name(String tent_name) {
		this.tent_name = tent_name;
	}

	
}
