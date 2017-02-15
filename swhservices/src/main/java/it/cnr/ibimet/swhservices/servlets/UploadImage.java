package it.cnr.ibimet.swhservices.servlets;


import it.cnr.ibimet.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;


public class UploadImage extends HttpServlet {
    TDBManager dsm=null;
    GregorianCalendar gc;
    private boolean isMultipart;
    private int maxMemSize = 600 * 1024;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            System.out.println("ci sono nel service ");
    }

    public void doPost(HttpServletRequest request, 
           HttpServletResponse response)
          throws ServletException, java.io.IOException {
        String giorno, mese, anno, ora, minuto, inserisco;
        String queryStr="";
        int parData=0, parImg=0;
        
        
        
        giorno = request.getHeader("giorno");
        mese = request.getHeader("mese");
        anno = request.getHeader("anno");
        ora = request.getHeader("ora");
        minuto = request.getHeader("minuto");
        inserisco = request.getHeader("inserisco");
        System.out.println("Anno: "+anno);
        System.out.println("Mese: "+mese);
        System.out.println("Giorno: "+giorno);
        System.out.println("Ora: "+ora);
        System.out.println("Minuto: "+minuto);
        System.out.println("Inserisco: "+inserisco);
        
        // Gets file name for HTTP header
        String fileName = request.getHeader("fileName");
 //       File saveFile = new File(SAVE_DIR + fileName);
         
        // prints out all header values
       
         
        // opens input stream of the request for reading data
       
        
        
        gc= new GregorianCalendar(Integer.parseInt(anno),(Integer.parseInt(mese)-1),
                Integer.parseInt(giorno), Integer.parseInt(ora), Integer.parseInt(minuto));
        
    
        InputStream is1= request.getInputStream(); //recupero l'input stream
        
        
            // prints out some information for debugging
     
        
        
        
        try{

            
           
            dsm = new TDBManager("jdbc/urbandb");
            System.out.println("Prima della open connection");
            
            System.out.println("Dopo la open");
            
            System.out.println("Ora controllo questo: "+Integer.parseInt(inserisco));
            switch(Integer.parseInt(inserisco)){
                case 1:
                    queryStr="insert into dati_raster " +
					"(data, temperatura) "+
					"values "+
					"(?,?)";
                    parData=1;
                    parImg=2;
                    break;
                
                case 2:
                    queryStr="update dati_raster set precipitazione=? " +
					"where data=? ";
                    parImg=1;
                    parData=2;
                    break;
                case 3:
                    queryStr="update dati_raster set a_fenologico=? " +
					"where data=? ";
                    parImg=1;
                    parData=2;
                    break;
                case 4:
                    queryStr="update dati_raster set a_patologico=? " +
					"where data=? ";
                    parImg=1;
                    parData=2;
                    break;
                
                
            }
        
		System.out.println("Ci sono ");
		
         
            
           /*File saveFile = new File("./" + fileName);
            
            FileOutputStream outputStream = new FileOutputStream(saveFile);
         
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        System.out.println("Receiving data...");
         
        while ((bytesRead = is1.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
         
        System.out.println("Data received.");
        outputStream.close();
    
        System.out.println("File written to: " + saveFile.getAbsolutePath());
         
        // sends response to client
        response.getWriter().print("UPLOAD DONE");
            */
        
        
           dsm.setPreparedStatementRef(queryStr);
            dsm.setParameter(ParameterType.DATE,this.gc,parData);
            
            System.out.println("Lunghezza: "+Integer.parseInt(request.getHeader("content-length")));
            
            dsm.getPStmt().setBinaryStream(parImg,is1,Integer.parseInt(request.getHeader("content-length")));

            
            dsm.performInsert();
            dsm.commit();
        
        
        is1.close();

            
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try {
                dsm.closeConnection();
            } catch (SQLException ex) {
                Logger.getLogger(UploadImage.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
    }
}
