package it.cnr.ibimet.bikeclimate.entities;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class AgroMeteoStatistics {
	
	
	private String dataStr;
	private String ora;
	private double tair_min;
	private double tair_max;
	private double tair_avg;
	
	private double bagnatura_min;
	private double bagnatura_max;
	private double bagnatura_avg;
	private double wind_min;
	private double wind_max;
	private double wind_avg;
	private double rain_min;
	private double rain_max;
	private double rain_sum;
	private double umidita_min;
	private double umidita_max;
	private double umidita_avg;
	private double rad_min;
	private double rad_max;
	private double rad_avg;
	private String stazione;
	private int iddata;
	public AgroMeteoStatistics(int iddata,
			GregorianCalendar gc,
			GregorianCalendar gctime,
			double tair_min,
			double tair_max,
			double rad_min,
			double rad_max,
			double wind_min,
			double wind_max,
			double rain_min,
			double rain_max,
			double umidita_min,
			double umidita_max,
			String stazione
			){
this.iddata=iddata;
this.tair_max=tair_max;
this.tair_min=tair_min;
this.rad_min=rad_min;
this.rad_max=rad_max;
this.wind_min=wind_min;
this.wind_max=wind_max;
this.rain_min=rain_min;
this.rain_max=rain_max;
this.umidita_min=umidita_min;
this.umidita_max=umidita_max;
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
	public AgroMeteoStatistics(int iddata,
					String dataStr,
					String ora,
					double tair_min,
					double tair_max,
					double tair_avg,
					double rad_min,
					double rad_max,
					double rad_avg,
					double wind_min,
					double wind_max,
					double wind_avg,
					double rain_min,
					double rain_max,
					double rain_sum,
					double umidita_min,
					double umidita_max,
					double umidita_avg,
					double bagnatura_min,
					double bagnatura_max,
					double bagnatura_avg,
					String stazione
					){
		this.iddata=iddata;

		this.stazione=stazione;

		this.tair_max=tair_max;
		this.tair_min=tair_min;
		this.rad_min=rad_min;
		this.rad_max=rad_max;
		this.wind_min=wind_min;
		this.wind_max=wind_max;
		this.rain_min=rain_min;
		this.rain_max=rain_max;
		this.umidita_min=umidita_min;
		this.umidita_max=umidita_max;
		this.bagnatura_min=bagnatura_min;
		this.bagnatura_max=bagnatura_max;


		this.tair_avg=tair_avg;
		this.rad_avg=rad_avg;
		this.wind_avg=wind_avg;
		this.rain_sum=rain_sum;
		this.umidita_avg=umidita_avg;
		this.bagnatura_avg=bagnatura_avg;

		this.dataStr=dataStr;
		this.ora=ora;

		BigDecimal bd;
		try{
			bd= new BigDecimal(Double.toString(tair_avg));
		    this.tair_avg=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		}catch(Exception ex){
			this.tair_avg=-999;
		}

		try{
		    bd= new BigDecimal(Double.toString(rad_avg));
		    this.rad_avg=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		}catch(Exception ex){
			 this.rad_avg=-999;
		}


		try{
		    bd= new BigDecimal(Double.toString(wind_avg));
		    this.wind_avg=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		}catch(Exception ex){
			this.wind_avg=-999;
		}

		try{
			bd= new BigDecimal(Double.toString(rain_sum));
		    this.rain_sum=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		} catch(Exception ex){
			this.rain_sum=-999;
		}

		try{
		    bd= new BigDecimal(Double.toString(umidita_avg));
		    this.umidita_avg=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		}catch(Exception ex){
			this.umidita_max=-999;
		}

		try{
			bd= new BigDecimal(Double.toString(bagnatura_avg));
		    this.bagnatura_avg=bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		}catch(Exception ex){
			this.bagnatura_avg=-999;
		}

	}

	public double getBagnatura_min() {
		return bagnatura_min;
	}

	public void setBagnatura_min(double bagnatura_min) {
		this.bagnatura_min = bagnatura_min;
	}

	public double getBagnatura_max() {
		return bagnatura_max;
	}

	public void setBagnatura_max(double bagnatura_max) {
		this.bagnatura_max = bagnatura_max;
	}

	public double getBagnatura_avg() {
		return bagnatura_avg;
	}

	public void setBagnatura_avg(double bagnatura_avg) {
		this.bagnatura_avg = bagnatura_avg;
	}

	public double getWind_min() {
		return wind_min;
	}

	public void setWind_min(double wind_min) {
		this.wind_min = wind_min;
	}

	public double getWind_max() {
		return wind_max;
	}

	public void setWind_max(double wind_max) {
		this.wind_max = wind_max;
	}

	public double getWind_avg() {
		return wind_avg;
	}

	public void setWind_avg(double wind_avg) {
		this.wind_avg = wind_avg;
	}

	public double getRain_min() {
		return rain_min;
	}
	
	public void setRain_min(double rain_min) {
		this.rain_min = rain_min;
	}

	public double getRain_max() {
		return rain_max;
	}

	public void setRain_max(double rain_max) {
		this.rain_max = rain_max;
	}
	
	public double getRain_sum() {
		return rain_sum;
	}

	public void setRain_sum(double rain_sum) {
		this.rain_sum = rain_sum;
	}

	public double getUmidita_min() {
		return umidita_min;
	}
	
	public void setUmidita_min(double umidita_min) {
		this.umidita_min = umidita_min;
	}

	public double getUmidita_max() {
		return umidita_max;
	}

	public void setUmidita_max(double umidita_max) {
		this.umidita_max = umidita_max;
	}
	
	public double getUmidita_avg() {
		return umidita_avg;
	}

	public void setUmidita_avg(double umidita_avg) {
		this.umidita_avg = umidita_avg;
	}
	
	public String getStazione() {
		return stazione;
	}

	public void setStazione(String stazione) {
		this.stazione = stazione;
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

	public double getRad_avg() {
		return rad_avg;
	}

	public void setRad_avg(double rad_avg) {
		this.rad_avg = rad_avg;
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
	
	public int getIddata() {
		return iddata;
	}
	
	public void setIddata(int iddata) {
		this.iddata = iddata;
	}
}
