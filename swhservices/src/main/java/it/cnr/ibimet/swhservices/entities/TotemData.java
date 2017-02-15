/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.swhservices.entities;


import java.io.Serializable;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class TotemData implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private GregorianCalendar gc;
	private String dataStr;
	private String ora;
	private double tair;
	private double noise;
	private double rad;
	private int co2;
	private String bikename;
	private int iddata;
	private int o3;
	private String descrizione;
	
	
	
	
	
	public TotemData(){
		super();
	}

	public TotemData(GregorianCalendar gc, double tair, double noise, double rad,
			int co2, String bikename,int iddata,int o3,
			String descrizione){
		this( gc,  tair,  noise,  rad,
				 co2,  bikename, iddata, o3);
		this.descrizione=descrizione;
	}

	public TotemData(GregorianCalendar gc, double tair, double noise, double rad, int co2, String bikename,int iddata,int o3){
		this();
		this.gc=gc;
		this.tair=tair;
		this.noise=noise;
		this.co2=co2;
		this.bikename=bikename;
		this.iddata=iddata;
		this.rad=rad;
		this.o3=o3;

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

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getO3() {
		return o3;
	}

	public void setO3(int o3) {
		this.o3 = o3;
	}

	public int getIddata() {
		return iddata;
	}
	
	public void setIddata(int iddata) {
		this.iddata = iddata;
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
	public double getTair() {
		return tair;
	}
	public void setTair(double tair) {
		this.tair = tair;
	}
	public double getNoise() {
		return noise;
	}
	public void setNoise(double noise) {
		this.noise = noise;
	}
	public double getRad() {
		return rad;
	}
	public void setRad(double rad) {
		this.rad = rad;
	}
	public int getCo2() {
		return co2;
	}
	public void setCo2(int co2) {
		this.co2 = co2;
	}
	public String getBikename() {
		return bikename;
	}
	public void setBikename(String bikename) {
		this.bikename = bikename;
	}
	
	
}