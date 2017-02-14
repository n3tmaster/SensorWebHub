package it.cnr.ibimet.bikeclimate.entities;

import java.util.GregorianCalendar;

public class TrackElement {
	private int id_track;
	private int id_mobile_station;
	private int id_utente;
	private String trackname;
	private GregorianCalendar gc1;
	private GregorianCalendar gc2;
	private GregorianCalendar data_start;
	private GregorianCalendar data_end;


	public TrackElement(int id_track, int id_mobile_station, int id_utente,
			String trackname, GregorianCalendar gc1
			, GregorianCalendar gc2){

		this.id_track=id_track;
		this.id_mobile_station=id_mobile_station;
		this.id_utente=id_utente;
		this.trackname=trackname;
		this.gc1=gc1;
		this.gc2=gc2;

	}

	public GregorianCalendar getGc1() {
		return gc1;
	}

	public void setGc1(GregorianCalendar gc1) {
		this.gc1 = gc1;
	}
	
	public GregorianCalendar getGc2() {
		return gc2;
	}

	public void setGc2(GregorianCalendar gc2) {
		this.gc2 = gc2;
	}

	public String getTrackname() {
		return trackname;
	}

	public void setTrackname(String trackname) {
		this.trackname = trackname;
	}

	public int getId_track() {
		return id_track;
	}

	public void setId_track(int id_track) {
		this.id_track = id_track;
	}

	public int getId_mobile_station() {
		return id_mobile_station;
	}

	public void setId_mobile_station(int id_mobile_station) {
		this.id_mobile_station = id_mobile_station;
	}

	public int getId_utente() {
		return id_utente;
	}

	public void setId_utente(int id_utente) {
		this.id_utente = id_utente;
	}

	public GregorianCalendar getData_start() {
		return data_start;
	}

	public void setData_start(GregorianCalendar data_start) {
		this.data_start = data_start;
	}

	public GregorianCalendar getData_end() {
		return data_end;
	}

	public void setData_end(GregorianCalendar data_end) {
		this.data_end = data_end;
	}
	
}
