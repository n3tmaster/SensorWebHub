package it.cnr.ibimet.swhservices.entities;

import it.cnr.ibimet.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.sql.SQLException;

public class SolarPanel {
	private String nomeSolar;
	private int id_bike_sensor;
	private TDBManager tdbm;
	
        private double upv_lst; //   -- PV generator voltage
        private double pac; //   -- present output power
        private double uac; //   -- grid voltage
        private double upv_soll; //   -- PV nominal voltage
        private double fac;//   -- Grid frequency
        private double zac;//   -- grid impedence
        private double riso;//   -- insulation resistance of pv plant before the connection to the grid
        private double lac_soll;//   -- current perc????
        private double uac_srr;  
        private double fac_srr;  
        private double zac_srr;  
        private double lzac;  
        private double lpv;//   -- continous current
        private double netz_ein;//   -- total number of connections to the grid
        private double event_cnt;//   -- 
        private double serial_nummer;//   -- serial number of the sunny boy
        private double status;//  -- display of current operating state
        private double fehler; //   -- total number of error
        private double tkk_max;//  
        private double upv_max;//  
        private double e_total;//   -- total power fed to the grid acccumulated from the day  of installation
        private double h_total;//   -- total sum of operating hours in feeding operation
        private double h_on ;

	public SolarPanel(TDBManager tdbm){
		this.tdbm=tdbm;
	}

	public SolarPanel(TDBManager tdbm, String nomeSolar) throws SQLException{
		this(tdbm);
		this.nomeSolar=nomeSolar;

		getBikeInfo();
	}

    public String getNomeSolar() {
        return nomeSolar;
    }

    public void setNomeSolar(String nomeSolar) {
        this.nomeSolar = nomeSolar;
    }

    public TDBManager getTdbm() {
        return tdbm;
    }

    public void setTdbm(TDBManager tdbm) {
        this.tdbm = tdbm;
    }

    public double getUpv_lst() {
        return upv_lst;
    }

    public void setUpv_lst(double upv_lst) {
        this.upv_lst = upv_lst;
    }

    public double getPac() {
        return pac;
    }

    public void setPac(double pac) {
        this.pac = pac;
    }

    public double getUac() {
        return uac;
    }

    public void setUac(double uac) {
        this.uac = uac;
    }

    public double getUpv_soll() {
        return upv_soll;
    }

    public void setUpv_soll(double upv_soll) {
        this.upv_soll = upv_soll;
    }

    public double getFac() {
        return fac;
    }

    public void setFac(double fac) {
        this.fac = fac;
    }

    public double getZac() {
        return zac;
    }

    public void setZac(double zac) {
        this.zac = zac;
    }

    public double getRiso() {
        return riso;
    }

    public void setRiso(double riso) {
        this.riso = riso;
    }

    public double getLac_soll() {
        return lac_soll;
    }

    public void setLac_soll(double lac_soll) {
        this.lac_soll = lac_soll;
    }

    public double getUac_srr() {
        return uac_srr;
    }

    public void setUac_srr(double uac_srr) {
        this.uac_srr = uac_srr;
    }

    public double getFac_srr() {
        return fac_srr;
    }

    public void setFac_srr(double fac_srr) {
        this.fac_srr = fac_srr;
    }

    public double getZac_srr() {
        return zac_srr;
    }

    public void setZac_srr(double zac_srr) {
        this.zac_srr = zac_srr;
    }

    public double getLzac() {
        return lzac;
    }

    public void setLzac(double lzac) {
        this.lzac = lzac;
    }

    public double getLpv() {
        return lpv;
    }

    public void setLpv(double lpv) {
        this.lpv = lpv;
    }

    public double getNetz_ein() {
        return netz_ein;
    }

    public void setNetz_ein(double netz_ein) {
        this.netz_ein = netz_ein;
    }

    public double getEvent_cnt() {
        return event_cnt;
    }

    public void setEvent_cnt(double event_cnt) {
        this.event_cnt = event_cnt;
    }

    public double getSerial_nummer() {
        return serial_nummer;
    }

    public void setSerial_nummer(double serial_nummer) {
        this.serial_nummer = serial_nummer;
    }

    public double getStatus() {
        return status;
    }

    public void setStatus(double status) {
        this.status = status;
    }

    public double getFehler() {
        return fehler;
    }

    public void setFehler(double fehler) {
        this.fehler = fehler;
    }

    public double getTkk_max() {
        return tkk_max;
    }

    public void setTkk_max(double tkk_max) {
        this.tkk_max = tkk_max;
    }

    public double getUpv_max() {
        return upv_max;
    }

    public void setUpv_max(double upv_max) {
        this.upv_max = upv_max;
    }

    public double getE_total() {
        return e_total;
    }

    public void setE_total(double e_total) {
        this.e_total = e_total;
    }

    public double getH_total() {
        return h_total;
    }

    public void setH_total(double h_total) {
        this.h_total = h_total;
    }
	
    public double getH_on() {
        return h_on;
    }

    public void setH_on(double h_on) {
        this.h_on = h_on;
    }

	public int getId_bike_sensor() {
		return id_bike_sensor;
	}
	
	public void setId_bike_sensor(int id_bike_sensor) {
		this.id_bike_sensor = id_bike_sensor;
	}

	public void getBikeInfo() throws SQLException{

		String sqlString = "select id_mobile_station from mobile_stations where nome=? ";
		
		
		tdbm.setPreparedStatementRef(sqlString);

		tdbm.setParameter(ParameterType.STRING,this.nomeSolar, 1);
		tdbm.runPreparedQuery();
		
		if(tdbm.next()){
                            
			this.id_bike_sensor=tdbm.getInteger(1);
                        System.out.println("Ecco id_bike "+this.id_bike_sensor);
		}else{
			this.id_bike_sensor=-1;
                        System.out.println("Ecco id_bike = -1");
		}
			
	}
	
}
