package it.cnr.ibimet.swhservices.entities;


import it.cnr.ibimet.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class SolarDataServlet {
private GregorianCalendar dataDato;
private String dataDatoStr;
private int id_mobile_station;
private SolarPanel solarPanel;
private String nome_mobile_station;


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
        private String status;//  -- display of current operating state
        private String fehler; //   -- total number of error
        private double tkk_max;//  
        private double upv_max;//  
        private double e_total;//   -- total power fed to the grid acccumulated from the day  of installation
        private double h_total;//   -- total sum of operating hours in feeding operation
        private double h_on ;
        private double iac_ist;
        private double iac_soll;
        private double dzac;
private TDBManager tdbm;

public SolarDataServlet(){
	super();

          upv_lst = -9999; //   -- PV generator voltage
          pac= -9999; //   -- present output power
          uac= -9999; //   -- grid voltage
          fac= -9999;//   -- Grid frequency
          zac= -9999;//   -- grid impedence
          riso= -9999;//   -- insulation resistance of pv plant before the connection to the grid
          lac_soll= -9999;//   -- current perc????
          uac_srr= -9999;
          fac_srr= -9999;
          zac_srr= -9999;
          lzac= -9999;
          lpv= -9999;//   -- continous current
          netz_ein= -9999;//   -- total number of connections to the grid
          event_cnt= -9999;//   --
          serial_nummer= -9999;//   -- serial number of the sunny boy
          fehler= "-9999";
          status = "-9999";
           dzac = -9999;
    iac_ist = -9999;
iac_soll = -9999;//   -- total number of error
          tkk_max= -9999;//
          upv_max= -9999;//
          e_total= -9999;//   -- total power fed to the grid acccumulated from the day  of installation
          h_total= -9999;//   -- total sum of operating hours in feeding operation
          h_on= -9999 ;


}

public SolarDataServlet(TDBManager tdbm){
	this();
	this.tdbm=tdbm;

}

public SolarDataServlet(int anno, int mese, int giorno, int ora, int minuti,
 int id_mobile_station,
 int co2,
 double tair,
 double rad,
 double noise,

 double utc,
 TDBManager tdbm,int o3){
	this(tdbm);

	String meseStr, giornoStr, oraStr, minutiStr;

	if(mese<10)
		meseStr="0"+mese;
	else
		meseStr=""+mese;

	if(giorno<10)
		giornoStr="0"+giorno;
	else
		giornoStr=""+giorno;

	if(ora<10)
		oraStr="0"+ora;
	else
		oraStr=""+ora;

	if(minuti<10)
		minutiStr="0"+minuti;
	else
		minutiStr=""+minuti;

	this.dataDatoStr=anno+"-"+meseStr+"-"+giornoStr+" "+oraStr+":"+minutiStr;
	this.id_mobile_station=id_mobile_station;




	this.dataDato = new GregorianCalendar();
	this.dataDato.set(Calendar.YEAR,anno);
	this.dataDato.set(Calendar.MONTH, mese);
	this.dataDato.set(Calendar.DAY_OF_MONTH, giorno);
	this.dataDato.set(Calendar.HOUR_OF_DAY, ora);
	this.dataDato.set(Calendar.MINUTE,minuti);




}

    public String getFehler() {
        return fehler;
    }

    public void setFehler(String fehler) {
        this.fehler = fehler;
    }

    public double getIac_ist() {
        return iac_ist;
    }

    public void setIac_ist(double iac_ist) {
        this.iac_ist = iac_ist;
    }
        
    public double getIac_soll() {
        return iac_soll;
    }

    public void setIac_soll(double iac_soll) {
        this.iac_soll = iac_soll;
    }

    public double getDzac() {
        return dzac;
    }

    public void setDzac(double dzac) {
        this.dzac = dzac;
    }

    public SolarPanel getSolarPanel() {
        return solarPanel;
    }

    public void setSolarPanel(SolarPanel solarPanel) {
        this.solarPanel = solarPanel;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public String getDataDatoStr() {
        return dataDatoStr;
    }

    public void setDataDatoStr(String dataDatoStr) {
        this.dataDatoStr = dataDatoStr;
    }

public String getNome_mobile_station() {
	return nome_mobile_station;
}

public void setNome_mobile_station(String nome_mobile_station) throws SQLException {

	this.nome_mobile_station = nome_mobile_station;

	this.solarPanel=new SolarPanel(this.tdbm, nome_mobile_station);

	this.id_mobile_station=this.solarPanel.getId_bike_sensor();

}

public TDBManager getTdbm() {
	return tdbm;
}

public void setTdbm(TDBManager tdbm) {

	this.tdbm = tdbm;
}

public void insertDato() throws SQLException{
	
	
	
	String sqlString = "insert into dati_fotovoltaico (data, id_mobile_station, upv_lst,"+
					"pac, uac,   upv_soll," +
                                        "iac_ist, iac_soll, " +
                                        "fac,zac,dzac,riso," +
                                        "uac_srr,fac_srr," +
                                        "zac_srr,lzac,lpv," +
                                        "netz_ein,event_cnt,serial_nummer," +
                                        "status,fehler,tkk_max," +
                                        "upv_max,e_total,h_total," +
                                        "h_on) " +
                                        "values "+
					"(?,?,?,"+  
					"?,?,?,"+
                                        "?,?,"+
                                        "?,?,?,?,"+
                                        "?,?,"+
                                        "?,?,?,"+
                                        "?,?,?,"+
                                        "?,?,?,"+
                                        "?,?,?,"
                                        + "?)";
                                        
	
	tdbm.setPreparedStatementRef(sqlString);
	
        
        //data, id_station,co2
	tdbm.setParameter(ParameterType.DATE, this.dataDato, 1);
	tdbm.setParameter(ParameterType.INT, ""+this.id_mobile_station, 2);

        if(this.upv_lst == -9999)
            tdbm.setParameterNull(3);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.upv_lst, 3);
        
        //tair, rad, noise,
        if(this.pac == -9999)
            tdbm.setParameterNull(4);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.pac, 4);
        
        if(this.uac == -9999)
            tdbm.setParameterNull(5);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.uac, 5);
        
        if(this.upv_soll == -9999)
            tdbm.setParameterNull(6);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.upv_soll, 6);
        
        if(this.iac_ist == -9999)
            tdbm.setParameterNull(7);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.iac_ist, 7);
        
        if(this.iac_soll == -9999)
            tdbm.setParameterNull(8);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.iac_soll, 8);
        
        
        //o3,ntc,ds18,
        if(this.fac == -9999)
            tdbm.setParameterNull(9);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.fac, 9);
        
        if(this.zac == -9999)
            tdbm.setParameterNull(10);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.zac, 10);
        
        if(this.dzac == -9999)
            tdbm.setParameterNull(11);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.dzac, 11);
        
        
        if(this.riso == -9999)
            tdbm.setParameterNull(12);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.riso, 12);
        
        //pk,utc,k_s,
      
        if(this.uac_srr == -9999)
            tdbm.setParameterNull(13);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.uac_srr, 13);
        
        if(this.fac_srr == -9999)
            tdbm.setParameterNull(14);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.fac_srr, 14);
        
        //wind,rain,rad_solare,
        if(this.zac_srr == -9999)
            tdbm.setParameterNull(15);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.zac_srr, 15);
        
        if(this.lzac == -9999)
            tdbm.setParameterNull(16);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.lzac, 16);
        
        if(this.lpv == -9999)
            tdbm.setParameterNull(17);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.lpv, 17);
        
         //bagnatura_fogliare,solar_wm2_avg,solar_wm2_max,
        if(this.netz_ein == -9999)
            tdbm.setParameterNull(18);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.netz_ein, 18);
        
        if(this.event_cnt == -9999)
            tdbm.setParameterNull(19);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.event_cnt, 19);
        
        if(this.serial_nummer == -9999)
            tdbm.setParameterNull(20);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.serial_nummer, 20);
        
	 //solar_w2_avg,solar_w_2_max,rs_solar_avg,
        if(this.status.equals("-9999"))
            tdbm.setParameterNull(21);
        else
            tdbm.setParameter(ParameterType.STRING, this.status, 21);
        
        if(this.fehler.equals("-9999"))
            tdbm.setParameterNull(22);
        else
            tdbm.setParameter(ParameterType.STRING, this.fehler, 22);
        
        
        if(this.tkk_max == -9999)
            tdbm.setParameterNull(23);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.tkk_max, 23);
        
        //rs_solar_max,hb_r3_w_avg,batt_min_level,
        if(this.upv_max == -9999)
            tdbm.setParameterNull(24);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.upv_max, 24);
        
        if(this.e_total == -9999)
            tdbm.setParameterNull(25);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.e_total, 25);
        
        if(this.h_total == -9999)
            tdbm.setParameterNull(26);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.h_total, 26);
        
        //pt100_sup_avg
        if(this.h_on == -9999)
            tdbm.setParameterNull(27);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.h_on, 27);
        
	tdbm.performInsert();
	
}



public GregorianCalendar getDataDato() {
	return dataDato;
}

public void setDataDato(GregorianCalendar dataDato) {
	this.dataDato = dataDato;
}

public int getId_mobile_station() {
	return id_mobile_station;
}

public void setId_mobile_station(int id_mobile_station) {
	this.id_mobile_station = id_mobile_station;
}




	
}
