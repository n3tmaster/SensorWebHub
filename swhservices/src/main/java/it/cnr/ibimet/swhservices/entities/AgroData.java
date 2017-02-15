package it.cnr.ibimet.swhservices.entities;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class AgroData {
	private GregorianCalendar gc;
	private String dataStr;
	private String ora;
	private double temp_media;
	private double rad_media;
	private double wind_medio;
	private long id_dato;
	private double umidita_media;
	private double precipitazione;
	private double bagnatura_fogliare;
	private String id_stazione;

		public AgroData(){
		super();
	}

	public AgroData(GregorianCalendar gc,
			 double temp_media,
	 double rad_media,
	 double wind_medio,
	 double precipitazione,
	 double umidita_media,
	 double bagnatura_fogliare,
	 String id_stazione,
	 long id_dato){
		this();
		this.gc=gc;
		this.id_dato=id_dato;
		this.temp_media=temp_media;
		this.rad_media=rad_media;
		this.umidita_media=umidita_media;
		this.wind_medio=wind_medio;
		this.precipitazione=precipitazione;
		this.bagnatura_fogliare=bagnatura_fogliare;
		this.id_stazione=id_stazione;
		String a1, b1;
		if(gc.get(Calendar.MINUTE)<10)
			a1="0"+gc.get(Calendar.MINUTE);
		else
			a1=""+gc.get(Calendar.MINUTE);

		if(gc.get(Calendar.HOUR_OF_DAY)<10)
			b1="0"+gc.get(Calendar.HOUR_OF_DAY);
		else
			b1=""+gc.get(Calendar.HOUR_OF_DAY);

		this.ora=b1+":"+a1;


		if(gc.get(Calendar.DAY_OF_MONTH)<10)
			a1="0"+gc.get(Calendar.DAY_OF_MONTH);
		else
			a1=""+gc.get(Calendar.DAY_OF_MONTH);

		if((gc.get(Calendar.MONTH)+1)<10)
			b1="0"+(gc.get(Calendar.MONTH)+1);
		else
			b1=""+(gc.get(Calendar.MONTH)+1);

		this.dataStr=a1+"-"+b1+"-"+gc.get(Calendar.YEAR);

	}

	public double getUmidita_media() {
		return umidita_media;
	}

	public void setUmidita_media(double umidita_media) {
		this.umidita_media = umidita_media;
	}

	public long getId_dato() {
		return id_dato;
	}

	public void setId_dato(long id_dato) {
		this.id_dato = id_dato;
	}

	public double getTemp_media() {
		return temp_media;
	}

	public void setTemp_media(double temp_media) {
		this.temp_media = temp_media;
	}

	public double getRad_media() {
		return rad_media;
	}

	public void setRad_media(double rad_media) {
		this.rad_media = rad_media;
	}

	public double getWind_medio() {
		return wind_medio;
	}

	public void setWind_medio(double wind_medio) {
		this.wind_medio = wind_medio;
	}

	public double getPrecipitazione() {
		return precipitazione;
	}

	public void setPrecipitazione(double precipitazione) {
		this.precipitazione = precipitazione;
	}

	public double getBagnatura_fogliare() {
		return bagnatura_fogliare;
	}

	public void setBagnatura_fogliare(double bagnatura_fogliare) {
		this.bagnatura_fogliare = bagnatura_fogliare;
	}
	
	public String getId_stazione() {
		return id_stazione;
	}
	
	public void setId_stazione(String id_stazione) {
		this.id_stazione = id_stazione;
	}
	
	public String getOra() {
		return ora;
	}

	public void setOra(String ora) {
		this.ora = ora;
	}

	public GregorianCalendar getGc() {
		return gc;
	}
	public void setGc(GregorianCalendar gc) {
		this.gc = gc;
	}
	public String getDataStr() {
		return dataStr;
	}
	public void setDataStr(String dataStr) {
		this.dataStr = dataStr;
	}
	
	
}
