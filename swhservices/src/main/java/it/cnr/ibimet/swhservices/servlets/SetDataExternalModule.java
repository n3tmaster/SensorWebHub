package it.cnr.ibimet.swhservices.servlets;


import it.cnr.ibimet.dbutils.TDBManager;
import it.cnr.ibimet.swhservices.entities.BikeDataServlet;
import it.cnr.ibimet.swhservices.entities.SolarDataServlet;
import it.cnr.ibimet.swhservices.entities.TotemDataServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;


public class SetDataExternalModule extends HttpServlet {
	private final  int FISSO = 0;
        private final  int MOBILE = 1;
        private final  int EDDY = 2;
        private final  int FOTOVOLTAICO = 3;
        
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			String valoreRitorno = "-2";
			int userLevel=-1;
			String userLevelStr=null;
			String rigaLetta=null;
			
			TDBManager dsm=null;
			BikeDataServlet questeBikeData;
			
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
				dsm = new TDBManager("jdbc/urbandb");
				
				//recupero stringa
				
				
				GregorianCalendar gc = new GregorianCalendar();
                                
                                
                                String elem=request.getParameter("year");
                                int questoYear=Integer.parseInt(elem);
                                System.out.print("Year: "+questoYear+" ");
				gc.set(Calendar.YEAR,questoYear);
				
                                elem=request.getParameter("month");
                                questoYear= Integer.parseInt(elem);
                                System.out.print("..mese: "+questoYear+" ");
				gc.set(Calendar.MONTH,(questoYear-1));
				
                                elem=request.getParameter("day");
				questoYear= Integer.parseInt(elem);
                                System.out.print("..giorno: "+questoYear+" ");
				gc.set(Calendar.DAY_OF_MONTH,(questoYear));
				
                                elem=request.getParameter("hour");
				questoYear= Integer.parseInt(elem);
                                System.out.print("..ora: "+questoYear+" ");
				gc.set(Calendar.HOUR_OF_DAY,(questoYear));
                                
                                
                                elem=request.getParameter("minute");
				questoYear= Integer.parseInt(elem);
                                System.out.print("..minuto: "+questoYear+" ");
				gc.set(Calendar.MINUTE,(questoYear));
                                
                                elem=request.getParameter("second");
                                questoYear= Integer.parseInt(elem);
				System.out.print("..secondo: "+questoYear+" ");
				gc.set(Calendar.SECOND,(questoYear));
                                
                                elem=request.getParameter("type");
                                
                                int questoElem = Integer.parseInt(elem);
                                
                                if(questoElem == FISSO){
                                    System.out.println("Tipologia stazione: "+questoElem);
                                    TotemDataServlet tds = new TotemDataServlet(dsm);
                                    
                                    tds.setDataDato(gc);
                                    tds.setNome_mobile_station(request.getParameter("station"));
                                    
                                    if(request.getParameter("bf")!=null) //bagntura fogliare
                                        tds.setBagnatura_fogliare(Integer.parseInt(request.getParameter("bf")));
                                    
                                    if(request.getParameter("ds18")!=null) //bagntura fogliare
                                        tds.setDs18(Double.parseDouble(request.getParameter("ds18")));
                                    
                                    if(request.getParameter("ntc")!=null) //bagntura fogliare
                                        tds.setDs18(Double.parseDouble(request.getParameter("ntc")));
                                    
                                    if(request.getParameter("bat_lvl")!=null) //batteria min level
                                        tds.setBatt_min_level(Double.parseDouble(request.getParameter("bat_lvl")));
                                    
                                    if(request.getParameter("co2")!=null) //co2
                                        tds.setCo2(Integer.parseInt(request.getParameter("co2")));
                                    
                                    if(request.getParameter("r3wavg")!=null) //r3_w_avg
                                        tds.setHb_r3_w_avg(Double.parseDouble(request.getParameter("r3wavg")));
                                    
                                    if(request.getParameter("humrel")!=null) //umidita relativa
                                        tds.setHum_rel(Double.parseDouble(request.getParameter("humrel")));
                                    
                                    if(request.getParameter("ks")!=null) //k_s
                                        tds.setK_s(Integer.parseInt(request.getParameter("ks")));
                                    
                                    if(request.getParameter("noise")!=null) //Noise
                                        tds.setNoise(Double.parseDouble(request.getParameter("noise")));
                                    
                                    if(request.getParameter("o3")!=null) //ozono
                                        tds.setO3(Integer.parseInt(request.getParameter("o3")));
                                    
                                    if(request.getParameter("pk")!=null) //pk
                                        tds.setPk(Integer.parseInt(request.getParameter("pk")));
                                    
                                    if(request.getParameter("rain")!=null) //rain
                                        tds.setRain(Double.parseDouble(request.getParameter("rain")));
                                    
                                    if(request.getParameter("pt100savg")!=null) //PT100 Sup Avg
                                        tds.setPt100_sup_avg(Double.parseDouble(request.getParameter("pt100savg")));
                                    
                                    if(request.getParameter("hum")!=null) //humidita
                                        tds.setRad(Double.parseDouble(request.getParameter("hum")));
                                    
                                    if(request.getParameter("rad")!=null) //solar radiation
                                        tds.setRad_solare(Double.parseDouble(request.getParameter("hum")));
                                    
                                    if(request.getParameter("rsavg")!=null) //RS Solar Avg
                                        tds.setRs_solar_avg(Double.parseDouble(request.getParameter("rsavg")));
                                    
                                    if(request.getParameter("rsmax")!=null) //RS Solar Max
                                        tds.setRs_solar_max(Double.parseDouble(request.getParameter("rsmax")));
                                    
                                    if(request.getParameter("sw2avg")!=null) //Solar W2 avg
                                        tds.setSolar_w2_avg(Double.parseDouble(request.getParameter("sw2avg")));
                                    
                                    if(request.getParameter("sw2max")!=null) //Solar W2 max
                                        tds.setSolar_w_2_max(Double.parseDouble(request.getParameter("sw2max")));
                                    
                                    if(request.getParameter("swm2avg")!=null) //Solar WM2 Avg
                                        tds.setSolar_wm2_avg(Double.parseDouble(request.getParameter("swm2avg")));
                                    
                                    if(request.getParameter("swm2max")!=null) //Solar WM2 Max
                                        tds.setSolar_wm2_max(Double.parseDouble(request.getParameter("swm2max")));
                                    
                                    if(request.getParameter("tair")!=null) //air temperature
                                        tds.setTair(Double.parseDouble(request.getParameter("tair")));
                                    
                                    if(request.getParameter("utc")!=null) //utc
                                        tds.setUtc(Double.parseDouble(request.getParameter("utc")));
                                    
                                    if(request.getParameter("wind")!=null) //wind
                                        tds.setWind(Double.parseDouble(request.getParameter("wind")));
                                    
                                    
                                    System.out.println("inserisco il dato acquisito");
                                    tds.insertDato();
                                    dsm.commit();
                                }else if(questoElem == FOTOVOLTAICO){
                                    System.out.println("Tipologia stazione: "+questoElem);
                                    SolarDataServlet tds = new SolarDataServlet(dsm);
                                    
                                    tds.setDataDato(gc);
                                    tds.setNome_mobile_station(request.getParameter("station"));
                                    
                                    if(request.getParameter("upv_lst")!=null) //bagntura fogliare
                                        tds.setUpv_lst(Double.parseDouble(request.getParameter("upv_lst")));
                                   
                                    if(request.getParameter("pac")!=null) //bagntura fogliare
                                        tds.setPac(Double.parseDouble(request.getParameter("pac")));
                                    
                                    if(request.getParameter("uac")!=null) //bagntura fogliare
                                        tds.setUac(Double.parseDouble(request.getParameter("uac")));
                                    
                                    if(request.getParameter("upv_soll")!=null) //batteria min level
                                        tds.setUpv_soll(Double.parseDouble(request.getParameter("upv_soll")));
                                    
                                    if(request.getParameter("iac_ist")!=null) //batteria min level
                                        tds.setIac_ist(Double.parseDouble(request.getParameter("iac_ist")));
                                    
                                    if(request.getParameter("iac_soll")!=null) //batteria min level
                                        tds.setIac_soll(Double.parseDouble(request.getParameter("iac_soll")));
                                    
                                    if(request.getParameter("fac")!=null) //co2
                                        tds.setFac(Double.parseDouble(request.getParameter("fac")));
                                    
                                    if(request.getParameter("zac")!=null) //r3_w_avg
                                        tds.setZac(Double.parseDouble(request.getParameter("zac")));
                                    
                                     if(request.getParameter("dzac")!=null) //r3_w_avg
                                        tds.setZac(Double.parseDouble(request.getParameter("dzac")));
                                    
                                    if(request.getParameter("riso")!=null) //umidita relativa
                                        tds.setRiso(Double.parseDouble(request.getParameter("riso")));
                                    
                                    if(request.getParameter("lac_soll")!=null) //k_s
                                        tds.setLac_soll(Double.parseDouble(request.getParameter("lac_soll")));
                                    
                                    if(request.getParameter("uac_srr")!=null) //Noise
                                        tds.setUac_srr(Double.parseDouble(request.getParameter("uac_srr")));
                                    
                                    if(request.getParameter("fac_srr")!=null) //ozono
                                        tds.setFac_srr(Double.parseDouble(request.getParameter("fac_srr")));
                                    
                                    if(request.getParameter("zac_srr")!=null) //pk
                                        tds.setZac_srr(Double.parseDouble(request.getParameter("zac_srr")));
                                    
                                    if(request.getParameter("lzac")!=null) //rain
                                        tds.setLzac(Double.parseDouble(request.getParameter("lzac")));
                                    
                                    if(request.getParameter("lpv")!=null) //PT100 Sup Avg
                                        tds.setLpv(Double.parseDouble(request.getParameter("lpv")));
                                    
                                    if(request.getParameter("netz_ein")!=null) //humidita
                                        tds.setNetz_ein(Double.parseDouble(request.getParameter("netz_ein")));
                                    
                                    if(request.getParameter("event_cnt")!=null) //solar radiation
                                        tds.setEvent_cnt(Double.parseDouble(request.getParameter("event_cnt")));
                                    
                                    if(request.getParameter("serial_nummer")!=null) //RS Solar Avg
                                        tds.setSerial_nummer(Double.parseDouble(request.getParameter("serial_nummer")));
                                    
                                    if(request.getParameter("status")!=null) //RS Solar Max
                                        tds.setStatus(request.getParameter("status"));
                                    
                                    if(request.getParameter("fehler")!=null) //RS Solar Max
                                        tds.setStatus(request.getParameter("fehler"));
                                    
                                    if(request.getParameter("tkk_max")!=null) //Solar W2 max
                                        tds.setTkk_max(Double.parseDouble(request.getParameter("tkk_max")));
                                    
                                    if(request.getParameter("upv_max")!=null) //Solar WM2 Avg
                                        tds.setUpv_max(Double.parseDouble(request.getParameter("upv_max")));
                                    
                                    if(request.getParameter("e_total")!=null) //Solar WM2 Max
                                        tds.setE_total(Double.parseDouble(request.getParameter("e_total")));
                                    
                                    if(request.getParameter("h_total")!=null) //air temperature
                                        tds.setH_total(Double.parseDouble(request.getParameter("h_total")));
                                    
                                    if(request.getParameter("h_on")!=null) //utc
                                        tds.setH_on(Double.parseDouble(request.getParameter("h_on")));
                                    
                                    
                                    
                                    System.out.println("inserisco il dato acquisito");
                                    tds.insertDato();
                                    dsm.commit();
                                }
                                
                                
                                
                                
                                
                                
				
				
		} catch (Exception e) {
				
				e.printStackTrace();
		} finally {
			try {
				dsm.closeConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
}
