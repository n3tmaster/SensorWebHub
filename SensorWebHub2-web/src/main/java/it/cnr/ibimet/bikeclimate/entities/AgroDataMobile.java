package it.cnr.ibimet.bikeclimate.entities;

import java.io.Serializable;

public class AgroDataMobile implements Serializable{
	private final static  String  BAGNATO="BAGNATO";
	private final static String NON_BAGNATO="NON BAGNATO";
	private static final long serialVersionUID = 1L;
	private long gc;
	private String dataStr;
	private String ora;
	private double temp_media;
	private double rad_media;
	private double wind_medio;
	private long id_dato;
	private double umidita_media;
	private double precipitazione;
	private double bagnatura_fogliare;
	private String bagnatura_str;
	private String id_stazione;

		public AgroDataMobile(){
		super();
	}

	public AgroDataMobile(long gc,
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
		if(bagnatura_fogliare==1)
			this.bagnatura_str=BAGNATO;
		else
			this.bagnatura_str=NON_BAGNATO;

		this.id_stazione=id_stazione;




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
	
	public String getBagnatura_str() {
		return bagnatura_str;
	}
	
	public void setBagnatura_str(String bagnatura_str) {
		this.bagnatura_str = bagnatura_str;
	}
	
	public String getOra() {
		return ora;
	}

	public void setOra(String ora) {
		this.ora = ora;
	}

	public long getGc() {
		return gc;
	}
	public void setGc(long gc) {
		this.gc = gc;
	}
	public String getDataStr() {
		return dataStr;
	}
	public void setDataStr(String dataStr) {
		this.dataStr = dataStr;
	}
	
	
}
