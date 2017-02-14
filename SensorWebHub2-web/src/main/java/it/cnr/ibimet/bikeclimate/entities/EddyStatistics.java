package it.cnr.ibimet.bikeclimate.entities;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class EddyStatistics {
	
	
	private String dataStr;
	private String ora;
	private double tair_min;
	private double tair_max;
	private double tair_avg;
	
	private double vento_min;
	private double vento_max;
	private double vento_avg;
	
	private double co2_flux_min;
	private double co2_flux_max;
	private double co2_flux_avg;
	
	private double co2_min;
	private double co2_max;
	private double co2_avg;
	
	private String bikename;
	private int iddata;
	
	public EddyStatistics(int iddata,
			GregorianCalendar gc,
			GregorianCalendar gctime,
			double tair_min,
			double tair_max,
			int co2_min,
			int co2_max,
			double co2_flux_min,
			double co2_flux_max,
			double vento_min,
			double vento_max,
			String bikename
			){
this.iddata=iddata;

this.bikename=bikename;

if(co2_max<0)co2_max=0;
if(co2_min<0)co2_min=0;
if(co2_avg<0)co2_avg=0;

if(vento_min<0)vento_min=0;
if(vento_max<0)vento_max=0;
if(vento_avg<0)vento_avg=0;


if(co2_flux_max<0)co2_flux_max=0;
if(co2_flux_min<0)co2_flux_min=0;
if(co2_flux_avg<0)co2_flux_avg=0;

this.tair_max=tair_max;
this.tair_min=tair_min;
this.co2_max=co2_max;
this.co2_min=co2_min;
this.co2_flux_max=co2_flux_max;
this.co2_flux_min=co2_flux_min;
this.vento_min=vento_min;
this.vento_max=vento_max;
String a1, b1;
if(gctime.get(Calendar.MINUTE)<10)
	a1="0"+gctime.get(Calendar.MINUTE);
else
	a1=""+gctime.get(Calendar.MINUTE);

if(gctime.get(Calendar.HOUR_OF_DAY)<10)
	b1="0"+gctime.get(Calendar.HOUR_OF_DAY);
else
	b1=""+gctime.get(Calendar.HOUR_OF_DAY);

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
	public EddyStatistics(int iddata,
					String dataStr,
					String ora,
					double tair_min,
					double tair_max,
					int co2_min,
					int co2_max,
					double co2_flux_min,
					double co2_flux_max,
					double vento_min,
					double vento_max,
					String bikename,double tair_avg,
					double co2_avg,
					double co2_flux_avg,
					double vento_avg){
		this.iddata=iddata;

		this.bikename=bikename;
		this.tair_max=tair_max;
		this.tair_min=tair_min;

		if(co2_max<0)co2_max=0;
		if(co2_min<0)co2_min=0;
		if(co2_avg<0)co2_avg=0;

		if(vento_min<0)vento_min=0;
		if(vento_max<0)vento_max=0;
		if(vento_avg<0)vento_avg=0;


		if(co2_flux_max<0)co2_flux_max=0;
		if(co2_flux_min<0)co2_flux_min=0;
		if(co2_flux_avg<0)co2_flux_avg=0;


		this.co2_max=co2_max;
		this.co2_min=co2_min;
		this.vento_min=vento_min;
		this.vento_max=vento_max;
		this.vento_avg=vento_avg;
		this.co2_flux_max=co2_flux_max;
		this.co2_flux_min=co2_flux_min;
		this.co2_flux_avg=co2_flux_avg;


		this.dataStr=dataStr;
		this.ora=ora;


	    BigDecimal bd= new BigDecimal(Double.toString(co2_avg));
	    this.co2_avg=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

	    bd= new BigDecimal(Double.toString(co2_flux_avg));
	    this.co2_flux_avg=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

	    bd= new BigDecimal(Double.toString(vento_avg));
	    this.vento_avg=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

	    bd= new BigDecimal(Double.toString(tair_avg));
	    this.tair_avg=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();




	}

	public double getVento_min() {
		return vento_min;
	}

	public void setVento_min(double vento_min) {
		this.vento_min = vento_min;
	}

	public double getVento_max() {
		return vento_max;
	}

	public void setVento_max(double vento_max) {
		this.vento_max = vento_max;
	}

	public double getVento_avg() {
		return vento_avg;
	}

	public void setVento_avg(double vento_avg) {
		this.vento_avg = vento_avg;
	}

	public double getCo2_flux_min() {
		return co2_flux_min;
	}

	public void setCo2_flux_min(double co2_flux_min) {
		this.co2_flux_min = co2_flux_min;
	}
	
	public double getCo2_flux_max() {
		return co2_flux_max;
	}

	public void setCo2_flux_max(double co2_flux_max) {
		this.co2_flux_max = co2_flux_max;
	}

	public double getCo2_flux_avg() {
		return co2_flux_avg;
	}

	public void setCo2_flux_avg(double co2_flux_avg) {
		this.co2_flux_avg = co2_flux_avg;
	}

	public String getDataStr() {
		return dataStr;
	}
	
	public void setDataStr(String dataStr) {
		this.dataStr = dataStr;
	}

	public double getTair_avg() {
		return tair_avg;
	}

	public void setTair_avg(double tair_avg) {
		this.tair_avg = tair_avg;
	}

	public double getCo2_avg() {
		return co2_avg;
	}

	public void setCo2_avg(double co2_avg) {
		this.co2_avg = co2_avg;
	}

	public String getOra() {
		return ora;
	}

	public void setOra(String ora) {
		this.ora = ora;
	}

	public double getTair_min() {
		return tair_min;
	}

	public void setTair_min(double tair_min) {
		this.tair_min = tair_min;
	}
	
	public double getTair_max() {
		return tair_max;
	}

	public void setTair_max(double tair_max) {
		this.tair_max = tair_max;
	}

	public double getCo2_min() {
		return co2_min;
	}

	public void setCo2_min(double co2_min) {
		this.co2_min = co2_min;
	}

	public void setCo2_min(int co2_min) {
		this.co2_min = co2_min;
	}
	
	public double getCo2_max() {
		return co2_max;
	}

	public void setCo2_max(double co2_max) {
		this.co2_max = co2_max;
	}

	public void setCo2_max(int co2_max) {
		this.co2_max = co2_max;
	}

	public String getBikename() {
		return bikename;
	}

	public void setBikename(String bikename) {
		this.bikename = bikename;
	}
	
	public int getIddata() {
		return iddata;
	}
	
	public void setIddata(int iddata) {
		this.iddata = iddata;
	}
}
