/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.swhservices.servlets;

import it.cnr.ibimet.dbutils.TDBManager;
import it.cnr.ibimet.swhservices.entities.BikeDataServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;

/**
 *
 * @author lerocchi
 */
public class SetDataComplete3 extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			String valoreRitorno = "-2";
			int userLevel=-1;
			String userLevelStr=null;
			String rigaLetta=null;
			StringTokenizer st=null;
			TDBManager dsm=null;
			BikeDataServlet questeBikeData;
                        int questoHour, questoMinute, questoSecond;
			
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
				dsm = new TDBManager("jdbc/urbandb");
				
				//recupero stringa
				rigaLetta=request.getParameter("dato_in");
				rigaLetta=rigaLetta.replace(",,",",nan,");
				rigaLetta=rigaLetta.replace(",,",",nan,");
				st=new StringTokenizer(rigaLetta,",");
				System.out.println(rigaLetta);	
				questeBikeData=new BikeDataServlet(dsm);
				
				
				GregorianCalendar gc = new GregorianCalendar();
                                //YEAR
				int questoYear=Integer.parseInt(st.nextToken());   //skip year
			//	System.out.print("Year: "+questoYear+" ");
			//	gc.set(Calendar.YEAR,questoYear);
				
                                //MONTH
				questoYear= Integer.parseInt(st.nextToken());  //skip month
			//	System.out.print("..mese: "+questoYear+" ");
			//	gc.set(Calendar.MONTH,(questoYear-1));
				
				//DAY
		         	questoYear= Integer.parseInt(st.nextToken()); //skip day
			//	System.out.print("..giorno: "+questoYear+" ");
			//	gc.set(Calendar.DAY_OF_MONTH,(questoYear));
				questoYear= Integer.parseInt(st.nextToken());  //skip hour
                                questoYear= Integer.parseInt(st.nextToken());  //skip minute
                                //HOUR
			//	questoYear= Integer.parseInt(st.nextToken());
			//	System.out.print("..ora: "+questoYear+" ");
			//	gc.set(Calendar.HOUR_OF_DAY,(questoYear));
			
                                //MINUTE
			//	questoYear= Integer.parseInt(st.nextToken());
			//	System.out.print("..ora: "+questoYear+" ");
			//	gc.set(Calendar.MINUTE,(questoYear));
					
			//	questeBikeData.setDataDato(gc);
				
                                //stationID
                                questeBikeData.setNome_mobile_station((st.nextToken()));
				
                                //CO2
				questeBikeData.setCo2(Integer.parseInt(st.nextToken()));
				
                                //T-Air
                                questeBikeData.setTair((Double.parseDouble(st.nextToken())/10)); //divido per 10
				
                                //RH-Air
				questeBikeData.setRad(Double.parseDouble(st.nextToken())/10); //divido per 10
                                
                                //NOISE 
				questeBikeData.setNoise(Double.parseDouble(st.nextToken())); 
				
                                //O3
				questeBikeData.setO3(Integer.parseInt(st.nextToken()));
				
                                //NTC
                                questeBikeData.setNtc((Double.parseDouble(st.nextToken())/10)); //divido per 10
                                
                                //Ds18 - Sensor temperature
				questeBikeData.setDs18((Double.parseDouble(st.nextToken())/100)); //divido per 10
                                
                                //PK
				questeBikeData.setPk(Integer.parseInt(st.nextToken())); 
                                
                                //NO2
                                questeBikeData.setNo2(Integer.parseInt(st.nextToken())); 
                                
                                //CO
                                questeBikeData.setCo(Integer.parseInt(st.nextToken())); 
                                
                                //VOC
                                questeBikeData.setVoc(Integer.parseInt(st.nextToken())); 
				
                                //PM2_5
                                questeBikeData.setPm2_5(Integer.parseInt(st.nextToken())); 
				
                                //PM10
                                questeBikeData.setPm10(Integer.parseInt(st.nextToken())); 
				
				
				questeBikeData.setGpsstring((st.nextToken()));
				String questaCoord = st.nextToken();
			if(!questaCoord.equalsIgnoreCase("nan")){
				questeBikeData.setUtcSTR((questaCoord));
					
                                questoHour= Integer.parseInt(questeBikeData.getUtcSTR().substring(0,2));
                                System.out.print("..ora: "+questoHour+" ");
                               
                                questoMinute= Integer.parseInt(questeBikeData.getUtcSTR().substring(2,4));
                                System.out.print("..minuti: "+questoMinute+" ");
                               

                                questoSecond= Integer.parseInt(questeBikeData.getUtcSTR().substring(4,6));
                                System.out.print("..secondi: "+questoSecond+" ");
                            
				st.nextToken(); //skippo parametro vnn
				
				questaCoord=st.nextToken();
				if(!questaCoord.equalsIgnoreCase("nan")){
					
				
					questeBikeData.setLatitudine(questaCoord);
					st.nextToken(); //skippo parametro N
					questaCoord=st.nextToken();
					
					if(!questaCoord.equalsIgnoreCase("nan")){
						questeBikeData.setLongitudine(questaCoord);
				
					
                                                
                                                st.nextToken();
                                                st.nextToken();
                                                st.nextToken();
                                                
                                                
                                                
                                                questaCoord=st.nextToken(); //UTC stringa
                                                
                                                questeBikeData.setUtcSTR(questaCoord);
                                               
                                                questoYear= Integer.parseInt(questeBikeData.getUtcSTR().substring(0,2));
                                                System.out.print("..day: "+questoYear+" ");
                                                gc.set(Calendar.DAY_OF_MONTH,(questoYear));

                                                questoYear= Integer.parseInt(questeBikeData.getUtcSTR().substring(2,4));
                                                System.out.print("..month: "+questoYear+" ");
                                                gc.set(Calendar.MONTH,(questoYear-1));

                                                questoYear= Integer.parseInt(questeBikeData.getUtcSTR().substring(4,6));
                                                System.out.println("..year: "+questoYear+" ");
                                                gc.set(Calendar.YEAR,(questoYear+2000));
                               
                                                gc.set(Calendar.HOUR_OF_DAY,(questoHour));
                                                gc.set(Calendar.MINUTE,(questoMinute));
                                                gc.set(Calendar.SECOND,(questoSecond));
                                                gc.set(Calendar.MILLISECOND,(0));
                                                
                                              
                                                
                                                questeBikeData.setDataDato(gc);
                                                
                                                
                                                System.out.println("Data settata");
                                                System.out.print("salvo il dato...");
						questeBikeData.insertDato3();
					}else{
						System.out.println("Longitudine: none");
						questeBikeData.insertDatoNoGeo();
					}
				}else{
					System.out.println("Latitudine: nan");
					questeBikeData.insertDatoNoGeo();
				}
			}else{
			
				System.out.println("utc: nan");
				questeBikeData.insertDatoNoGeo();
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
    
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			String valoreRitorno = "-2";
			int userLevel=-1;
			String userLevelStr=null;
			String rigaLetta=null;
			StringTokenizer st=null;
			TDBManager dsm=null;
			BikeDataServlet questeBikeData;
                        int questoHour, questoMinute, questoSecond;
			
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
				dsm = new TDBManager("jdbc/urbandb");
				
				//recupero stringa
				rigaLetta=request.getParameter("dato_in");
				rigaLetta=rigaLetta.replace(",,",",nan,");
				rigaLetta=rigaLetta.replace(",,",",nan,");
				st=new StringTokenizer(rigaLetta,",");
				System.out.println(rigaLetta);	
				questeBikeData=new BikeDataServlet(dsm);
				
				
				GregorianCalendar gc = new GregorianCalendar();
                                //YEAR
				int questoYear=Integer.parseInt(st.nextToken());   //skip year
			//	System.out.print("Year: "+questoYear+" ");
			//	gc.set(Calendar.YEAR,questoYear);
				
                                //MONTH
				questoYear= Integer.parseInt(st.nextToken());  //skip month
			//	System.out.print("..mese: "+questoYear+" ");
			//	gc.set(Calendar.MONTH,(questoYear-1));
				
				//DAY
		         	questoYear= Integer.parseInt(st.nextToken()); //skip day
			//	System.out.print("..giorno: "+questoYear+" ");
			//	gc.set(Calendar.DAY_OF_MONTH,(questoYear));
				questoYear= Integer.parseInt(st.nextToken());  //skip hour
                                questoYear= Integer.parseInt(st.nextToken());  //skip minute
                                //HOUR
			//	questoYear= Integer.parseInt(st.nextToken());
			//	System.out.print("..ora: "+questoYear+" ");
			//	gc.set(Calendar.HOUR_OF_DAY,(questoYear));
			
                                //MINUTE
			//	questoYear= Integer.parseInt(st.nextToken());
			//	System.out.print("..ora: "+questoYear+" ");
			//	gc.set(Calendar.MINUTE,(questoYear));
					
			//	questeBikeData.setDataDato(gc);
				
                                //stationID
                                questeBikeData.setNome_mobile_station((st.nextToken()));
				
                                //CO2
				questeBikeData.setCo2(Integer.parseInt(st.nextToken()));
				
                                //T-Air
                                questeBikeData.setTair((Double.parseDouble(st.nextToken())/10)); //divido per 10
				
                                //RH-Air
				questeBikeData.setRad(Double.parseDouble(st.nextToken())/10); //divido per 10
                                
                                //NOISE 
				questeBikeData.setNoise(Double.parseDouble(st.nextToken())); 
				
                                //O3
				questeBikeData.setO3(Integer.parseInt(st.nextToken()));
				
                                //NTC
                                questeBikeData.setNtc((Double.parseDouble(st.nextToken())/10)); //divido per 10
                                
                                //Ds18 - Sensor temperature
				questeBikeData.setDs18((Double.parseDouble(st.nextToken())/100)); //divido per 10
                                
                                //PK
				questeBikeData.setPk(Integer.parseInt(st.nextToken())); 
                                
                                //NO2
                                questeBikeData.setNo2(Integer.parseInt(st.nextToken())); 
                                
                                //CO
                                questeBikeData.setCo(Integer.parseInt(st.nextToken())); 
                                
                                //VOC
                                questeBikeData.setVoc(Integer.parseInt(st.nextToken())); 
				
                                //PM2_5
                                questeBikeData.setPm2_5(Integer.parseInt(st.nextToken())); 
				
                                //PM10
                                questeBikeData.setPm10(Integer.parseInt(st.nextToken())); 
				
				
				questeBikeData.setGpsstring((st.nextToken()));
				String questaCoord = st.nextToken();
			if(!questaCoord.equalsIgnoreCase("nan")){
				questeBikeData.setUtcSTR((questaCoord));
					
                                questoHour= Integer.parseInt(questeBikeData.getUtcSTR().substring(0,2));
                                System.out.print("..ora: "+questoHour+" ");
                               
                                questoMinute= Integer.parseInt(questeBikeData.getUtcSTR().substring(2,4));
                                System.out.print("..minuti: "+questoMinute+" ");
                               

                                questoSecond= Integer.parseInt(questeBikeData.getUtcSTR().substring(4,6));
                                System.out.print("..secondi: "+questoSecond+" ");
                            
				st.nextToken(); //skippo parametro vnn
				
				questaCoord=st.nextToken();
				if(!questaCoord.equalsIgnoreCase("nan")){
					
				
					questeBikeData.setLatitudine(questaCoord);
					st.nextToken(); //skippo parametro N
					questaCoord=st.nextToken();
					
					if(!questaCoord.equalsIgnoreCase("nan")){
						questeBikeData.setLongitudine(questaCoord);
				
					
                                                
                                                st.nextToken();
                                                st.nextToken();
                                                st.nextToken();
                                                
                                                
                                                
                                                questaCoord=st.nextToken(); //UTC stringa
                                                
                                                questeBikeData.setUtcSTR(questaCoord);
                                               
                                                questoYear= Integer.parseInt(questeBikeData.getUtcSTR().substring(0,2));
                                                System.out.print("..day: "+questoYear+" ");
                                                gc.set(Calendar.DAY_OF_MONTH,(questoYear));

                                                questoYear= Integer.parseInt(questeBikeData.getUtcSTR().substring(2,4));
                                                System.out.print("..month: "+questoYear+" ");
                                                gc.set(Calendar.MONTH,(questoYear-1));

                                                questoYear= Integer.parseInt(questeBikeData.getUtcSTR().substring(4,6));
                                                System.out.println("..year: "+questoYear+" ");
                                                gc.set(Calendar.YEAR,(questoYear+2000));
                               
                                                gc.set(Calendar.HOUR_OF_DAY,(questoHour));
                                                gc.set(Calendar.MINUTE,(questoMinute));
                                                gc.set(Calendar.SECOND,(questoSecond));
                                                gc.set(Calendar.MILLISECOND,(0));
                                                questeBikeData.setDataDato(gc);
                                                System.out.println("data settata");
                                                System.out.print("salvo il dato...");
						questeBikeData.insertDato3();
					}else{
						System.out.println("Longitudine: none");
						questeBikeData.insertDatoNoGeo();
					}
				}else{
					System.out.println("Latitudine: nan");
					questeBikeData.insertDatoNoGeo();
				}
			}else{
			
				System.out.println("utc: nan");
				questeBikeData.insertDatoNoGeo();
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
