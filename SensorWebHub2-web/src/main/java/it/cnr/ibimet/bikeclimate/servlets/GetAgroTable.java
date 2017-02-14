package it.cnr.ibimet.bikeclimate.servlets;


import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.AgroDataMobile;
import it.cnr.ibimet.bikeclimate.entities.AgroMeteoDataServlet;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.ByteBuffer;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;
import java.util.Vector;


public class GetAgroTable extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			String valoreRitorno = "-2";
			int userLevel=-1;
			String userLevelStr=null;
			String daQui=null, finoAQui=null,questaStazione=null;
			StringTokenizer st=null;
			TDBManager dsm=null;
			ByteBuffer outputBB;
			AgroMeteoDataServlet questoRec;
			Vector<AgroDataMobile> questoResult;
			
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
				dsm = new TDBManager("jdbc/imetnetdb");
				System.out.println("GetAgroTable Servlet - sono dentro");
				java.util.Date d = new java.util.Date();
				GregorianCalendar gcI = new GregorianCalendar();
				gcI.setTimeInMillis(d.getTime());
				File filelog = new File("/var/www/html/log/getAgroTableServlet"+gcI.get(Calendar.DAY_OF_MONTH)+"-"+gcI.get(Calendar.MONTH)+"-"+gcI.get(Calendar.YEAR)+".txt");
				if(!filelog.exists()){
					filelog.createNewFile();
				}
				System.out.println("GetAgroTable Servlet: log creato /var/www/html/log/getAgroTableServlet"+gcI.get(Calendar.DAY_OF_MONTH)+"-"+gcI.get(Calendar.MONTH)+"-"+gcI.get(Calendar.YEAR)+".txt");
			
				FileWriter fileWriter = new FileWriter(filelog, true);
				BufferedWriter bW = new BufferedWriter(fileWriter);
				
				
				//recupero stringa
				questaStazione = request.getParameter("stazione");
				daQui=request.getParameter("da");
				finoAQui = request.getParameter("a");
				
					
				System.out.println("GetAgroTable - "+questaStazione+" - "+daQui+" - "+finoAQui);
				
				bW.write(questaStazione+" - "+daQui+" - "+finoAQui);
				
				
				bW.newLine();
				
				if( daQui.equalsIgnoreCase("-1")==true || 
						finoAQui.equalsIgnoreCase("-1")==true ){
					System.out.println("caso iniziale");
					
					questoRec = new AgroMeteoDataServlet(dsm);
				}else{
					
					System.out.println("caso con partenza precisa");
					
					questoRec = new AgroMeteoDataServlet(dsm,daQui,finoAQui,questaStazione);
					
					
				}
				questoRec.creaLista();
				bW.write(" - "+questoRec.getAgroDataList().size() + " records");
				bW.newLine();
				bW.close();
				fileWriter.close();
			
				questoResult=questoRec.getAgroDataList();
				
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				ObjectOutputStream oos = new ObjectOutputStream(baos);
				oos.writeObject(questoResult);
				outputBB = ByteBuffer.wrap(baos.toByteArray());
				ServletOutputStream sos = response.getOutputStream();
			    
	/*			System.out.println("Deserializzo");
				byte[] data = outputBB.array();
				System.out.println("Ecco la sua misura: "+data.length);
				
				ByteArrayInputStream aaa = new ByteArrayInputStream(data);
				System.out.println("DataTable Object dentro BIAS "+aaa.available());
				ObjectInputStream oi = new ObjectInputStream(aaa);
				//ObjectInputStream ois = new ObjectInputStream(aaa);
			
				System.out.println("DataTable Object dentro OIS "+oi.available());
				
				Vector<AgroData>amData=(Vector<AgroData>)oi.readObject();
				System.out.println("Ecco amData: "+amData.size());
*/				
				if(outputBB != null){
					response.setContentType("application/octet-stream");
					response.setContentLength(outputBB.capacity());
					System.out.println("isAndroid : settato la capacita :"+outputBB.capacity());
					sos.write(outputBB.array());
					System.out.println("isAndroid : ho messo array :");
					sos.flush();
					sos.close();
					
				}else{
					System.out.println("isAndroid : ERRORE!!!");
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
