package it.cnr.ibimet.swhservices.entities;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class BikeStatistics {
	
	
	private String dataStr;
	private String ora;
	private double tair_min;
	private double tair_max;
	private double tair_avg;
	
	private double noise_min;
	private double noise_max;
	private double noise_avg;
	
	private double rad_min;
	private double rad_max;
	private double rad_avg;
	
	private int co2_min;
	private int co2_max;
	private double co2_avg;
	
	private String bikename;
	private int iddata;
	
	public BikeStatistics(int iddata,
			GregorianCalendar gc,
			GregorianCalendar gctime,
			double tair_min,
			double tair_max,
			int co2_min,
			int co2_max,
			double rad_min,
			double rad_max,
			double noise_min,
			double noise_max,
			String bikename
			){
this.iddata=iddata;

this.bikename=bikename;
this.tair_max=tair_max;
this.tair_min=tair_min;
this.co2_max=co2_max;
this.co2_min=co2_min;
this.noise_max=noise_max;
this.noise_min=noise_min;
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
	public BikeStatistics(int iddata,
					String dataStr,
					String ora,
					double tair_min,
					double tair_max,
					int co2_min,
					int co2_max,
					double rad_min,
					double rad_max,
					double noise_min,
					double noise_max,
					String bikename,double tair_avg,
					double co2_avg,
					double rad_avg,
					double noise_avg){
		this.iddata=iddata;

		this.bikename=bikename;
		this.tair_max=tair_max;
		this.tair_min=tair_min;
		this.co2_max=co2_max;
		this.co2_min=co2_min;
		this.noise_max=noise_max;
		this.noise_min=noise_min;
		this.dataStr=dataStr;
		this.ora=ora;


		this.rad_min=rad_min;
		this.rad_max=rad_max;

	    BigDecimal bd= new BigDecimal(Double.toString(co2_avg));
	    this.co2_avg=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

	    bd= new BigDecimal(Double.toString(rad_avg));
	    this.rad_avg=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

	    bd= new BigDecimal(Double.toString(noise_avg));
	    this.noise_avg=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

	    bd= new BigDecimal(Double.toString(tair_avg));
	    this.tair_avg=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();




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

	public double getNoise_avg() {
		return noise_avg;
	}

	public void setNoise_avg(double noise_avg) {
		this.noise_avg = noise_avg;
	}

	public double getRad_avg() {
		return rad_avg;
	}

	public void setRad_avg(double rad_avg) {
		this.rad_avg = rad_avg;
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

	public double getNoise_min() {
		return noise_min;
	}

	public void setNoise_min(double noise_min) {
		this.noise_min = noise_min;
	}

	public double getNoise_max() {
		return noise_max;
	}

	public void setNoise_max(double noise_max) {
		this.noise_max = noise_max;
	}

	public double getRad_min() {
		return rad_min;
	}

	public void setRad_min(double rad_min) {
		this.rad_min = rad_min;
	}

	public double getRad_max() {
		return rad_max;
	}

	public void setRad_max(double rad_max) {
		this.rad_max = rad_max;
	}

	public int getCo2_min() {
		return co2_min;
	}

	public void setCo2_min(int co2_min) {
		this.co2_min = co2_min;
	}

	public int getCo2_max() {
		return co2_max;
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
