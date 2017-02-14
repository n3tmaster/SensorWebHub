package it.cnr.ibimet.bikeclimate.servlets;


import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.BikeDataServlet;
import it.cnr.ibimet.bikeclimate.utils.HttpURLManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;


public class SetData extends HttpServlet {
	
	private static final int SWE = 1;
	private static final int BIKE = 2;

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

			if( userAgent != null)
				clientBrowser = userAgent;



			//Effettuo controllo sul db
			try {

				rigaLetta=request.getParameter("dato_in");


				System.out.println("Riga in arrivo: "+rigaLetta);
				rigaLetta=rigaLetta.replace(",,",",nan,");
				rigaLetta=rigaLetta.replace(",,",",nan,");
				System.out.println("Riga riformattata:"+rigaLetta);
				st=new StringTokenizer(rigaLetta,",");

				questeBikeData=new BikeDataServlet();


				GregorianCalendar gc = new GregorianCalendar();
				int questoYear=Integer.parseInt(st.nextToken());
				System.out.print("Year: "+questoYear+" ");
				gc.set(Calendar.YEAR,questoYear);

				questoYear= Integer.parseInt(st.nextToken());
				System.out.print("..mese: "+questoYear+" ");
				gc.set(Calendar.MONTH,(questoYear-1));


				questoYear= Integer.parseInt(st.nextToken());
				System.out.print("..giorno: "+questoYear+" ");
				gc.set(Calendar.DAY_OF_MONTH,(questoYear));

				questoYear= Integer.parseInt(st.nextToken());
				System.out.print("..ora: "+questoYear+" ");
				gc.set(Calendar.HOUR_OF_DAY,(questoYear));

				questoYear= Integer.parseInt(st.nextToken());
				System.out.print("..ora: "+questoYear+" ");
				gc.set(Calendar.MINUTE,(questoYear));

				questeBikeData.setDataDato(gc);

				questeBikeData.setNome_mobile_station((st.nextToken()));

				//controllo il tipo di stazione
				if(questeBikeData.getNome_mobile_station().length()>=3){
					if(questeBikeData.getNome_mobile_station().substring(0, 3).equalsIgnoreCase("SWE")){
					System.out.println("Caso SWE");
					creaFileLog(SWE, rigaLetta);

					//faccio una get verso un altro indirizzo
					HttpURLManager invia = new HttpURLManager("http://www.ibionet.eu/acqmon.php?msg="+request.getParameter("dato_in"));

					invia.sendGet();



						dsm = new TDBManager("jdbc/urbandb");


						questeBikeData.setTdbm(dsm);
						questeBikeData.calcolaID();
					}
				}else{
					if(questeBikeData.getNome_mobile_station().substring(0, 1).equalsIgnoreCase("B")){
						System.out.println("Caso Bike");
						creaFileLog(BIKE, rigaLetta);
						dsm = new TDBManager("jdbc/urbandb");

						questeBikeData.setTdbm(dsm);
						questeBikeData.calcolaID();
					}
				}

				System.out.println("nome stazione: "+questeBikeData.getNome_mobile_station()+" ");
				questeBikeData.setCo2(Integer.parseInt(st.nextToken()));
				System.out.println("co2: "+questeBikeData.getCo2()+" ");
				questeBikeData.setTair(Double.parseDouble(st.nextToken()));
				questeBikeData.setRad(Double.parseDouble(st.nextToken()));
				questeBikeData.setNoise(Double.parseDouble(st.nextToken()));
				questeBikeData.setGpsstring((st.nextToken()));
				String questaCoord = st.nextToken();
			if(!questaCoord.equalsIgnoreCase("nan")){
				questeBikeData.setUtc(Double.parseDouble(questaCoord));



				st.nextToken(); //skippo parametro v

				questaCoord=st.nextToken();
				if(!questaCoord.equalsIgnoreCase("nan")){


					questeBikeData.setLatitudine(questaCoord);
					st.nextToken(); //skippo parametro N
					questaCoord=st.nextToken();

					if(!questaCoord.equalsIgnoreCase("nan")){
						questeBikeData.setLongitudine(questaCoord);

						System.out.print("salvo il dato...");
						questeBikeData.insertDato();
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
	
	private void creaFileLog(int tipo, String rigaLetta) throws IOException{
		java.util.Date d = new java.util.Date();
		GregorianCalendar gcI = new GregorianCalendar();
		gcI.setTimeInMillis(d.getTime());
		File filelog=null;
		switch(tipo){
		
		case SWE:
			filelog = new File("/var/www/html/log/SWE_logfile"+gcI.get(Calendar.DAY_OF_MONTH)+"-"+(gcI.get(Calendar.MONTH)+1)+"-"+gcI.get(Calendar.YEAR)+".txt");
			break;
		case BIKE:
			filelog = new File("/var/www/html/log/BIKE_logfile"+gcI.get(Calendar.DAY_OF_MONTH)+"-"+(gcI.get(Calendar.MONTH)+1)+"-"+gcI.get(Calendar.YEAR)+".txt");
			break;
		}
	
		if(!filelog.exists()){
			filelog.createNewFile();
		}
		
	
		FileWriter fileWriter = new FileWriter(filelog, true);
		BufferedWriter bW = new BufferedWriter(fileWriter);
		
		
		
		
		bW.write(rigaLetta);
		bW.newLine();
		bW.close();
		fileWriter.close();
	}
	
}
