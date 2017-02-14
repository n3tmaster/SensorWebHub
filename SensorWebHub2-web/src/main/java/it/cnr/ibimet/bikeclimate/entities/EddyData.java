package it.cnr.ibimet.bikeclimate.entities;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class EddyData {
	private GregorianCalendar gc;
	private String dataStr;
	private String ora;
	private int pacchetti;
	private int iddata;
	private double ustar;
	private double co2;
	private double wind;
	private double wind_ang;
	private double tair;
	private int analog_3;
	private int analog_4;
	private double co2_flux;
	private double hx;
	private double lel;
	private String bikename;
	private double tau;
	private double h2o;
	private double h2o_flux;
	
	
	
	
	public EddyData(){
		super();
	}

	public EddyData(GregorianCalendar gc, int pacchetti,
			double co2_flux, double hx, double lel, double ustar,
			double co2,double wind, double wind_ang, double tair,
			int analog_3, int analog_4,
			String bikename,int iddata,double tau, double h2o, double h2o_flux){

		this( gc,  pacchetti,
			 co2_flux,  hx,  lel,  ustar,
			 co2, wind,  wind_ang,  tair,
			 analog_3,  analog_4,
			 bikename, iddata);

		if(tau<0) tau=0;
		if(h2o<0) h2o=0;
		if(h2o_flux<0) h2o_flux=0;


		this.tau=tau;
		this.h2o=h2o;
		this.h2o_flux=h2o_flux;


	}

	public EddyData(GregorianCalendar gc, int pacchetti,
			double co2_flux, double hx, double lel, double ustar,
			double co2,double wind, double wind_ang, double tair,
			int analog_3, int analog_4,
			String bikename,int iddata){
		this();
		if(pacchetti<0)pacchetti=0;
		if(co2_flux<0)co2_flux=0;
		if(hx<0) hx=0;
		if(lel<0) lel=0;
		if(ustar<0) ustar=0;
		if(wind<0) wind=0;
		if(co2<0) co2=0;


		this.gc=gc;
		this.pacchetti=pacchetti;


		this.co2_flux=co2_flux;
		this.hx=hx;
		this.lel=lel;
		this.ustar=ustar;

		this.wind=wind;
		this.wind_ang=wind_ang;
		this.tair=tair;
		this.co2=co2;

		this.analog_3=analog_3;
		this.analog_4=analog_4;

		this.bikename=bikename;

		this.iddata=iddata;

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

	public double getTau() {
		return tau;
	}

	public void setTau(double tau) {
		this.tau = tau;
	}

	public double getH2o() {
		return h2o;
	}

	public void setH2o(double h2o) {
		this.h2o = h2o;
	}

	public double getH2o_flux() {
		return h2o_flux;
	}
	
	public void setH2o_flux(double h2o_flux) {
		this.h2o_flux = h2o_flux;
	}

	public int getIddata() {
		return iddata;
	}
	
	public void setIddata(int iddata) {
		this.iddata = iddata;
	}

	public double getLel() {
		return lel;
	}

	public void setLel(double lel) {
		this.lel = lel;
	}

	public int getPacchetti() {
		return pacchetti;
	}

	public void setPacchetti(int pacchetti) {
		this.pacchetti = pacchetti;
	}

	public double getCo2_flux() {
		return co2_flux;
	}

	public void setCo2_flux(double co2_flux) {
		this.co2_flux = co2_flux;
	}

	public double getHx() {
		return hx;
	}

	public void setHx(double hx) {
		this.hx = hx;
	}

	public double getUstar() {
		return ustar;
	}

	public void setUstar(double ustar) {
		this.ustar = ustar;
	}

	public double getCo2() {
		return co2;
	}

	public void setCo2(double co2) {
		this.co2 = co2;
	}

	public double getWind() {
		return wind;
	}

	public void setWind(double wind) {
		this.wind = wind;
	}

	public double getWind_ang() {
		return wind_ang;
	}

	public void setWind_ang(double wind_ang) {
		this.wind_ang = wind_ang;
	}

	public int getAnalog_3() {
		return analog_3;
	}
	
	public void setAnalog_3(int analog_3) {
		this.analog_3 = analog_3;
	}
	
	public int getAnalog_4() {
		return analog_4;
	}
	
	public void setAnalog_4(int analog_4) {
		this.analog_4 = analog_4;
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
	
	public String getBikename() {
		return bikename;
	}
	public void setBikename(String bikename) {
		this.bikename = bikename;
	}
	
	
}
