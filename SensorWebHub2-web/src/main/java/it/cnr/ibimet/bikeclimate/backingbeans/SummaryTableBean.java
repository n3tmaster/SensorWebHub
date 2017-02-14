/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.SummaryTable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author lerocchi
 */
@ManagedBean(name="summaryTableBean")
@SessionScoped
public class SummaryTableBean implements Serializable{
    private final static String CLIMAURBANO = "CLIMAURBANO";
    private final static String AGROMETEO = "AGROMETEO";
    private final static String WEARABLE = "WEARABLE";
    private final static String METEO = "METEO";
    private final static String ENERGY = "ENERGY";
    private final static String INDOOR = "INDOOR";
    
    
    
    
    private List<SummaryTable> summaryTableList;

    public List<SummaryTable> getSummaryTableList() {
        return summaryTableList;
    }

    public void setSummaryTableList(List<SummaryTable> summaryTableList) {
        this.summaryTableList = summaryTableList;
    }
    
    
    @PostConstruct
    public void init(){
        System.out.println("SummaryTableBean - main - connessione aperta");
	 
        popolaTable();
    }
    
    @SuppressWarnings("null")
    public void popolaTable(){
        TDBManager dsm=null, dsm2=null;
        String sqlString,sqlString2;
        try {
            dsm = new TDBManager("jdbc/swhdb");
            dsm2 = new TDBManager("jdbc/swhdb");
            
            summaryTableList = new ArrayList<SummaryTable>();
            System.out.println("SummaryTableBean - main - connessione aperta");
			
            //prima faccio la lista dei parametri
            sqlString="select id_parametro, sigla from parametri order by id_parametro";
            sqlString2="select d.dominio "
                    + "from domini_parametri dp, domini d "
                    + "where d.id_dominio=dp.id_dominio "
                    + "and id_parametro=?";
            dsm.setPreparedStatementRef(sqlString);
            dsm2.setPreparedStatementRef(sqlString2);
            
            dsm.runPreparedQuery();
            while(dsm.next()){
                
                //adesso tiro fuori i domini che hanno questo parametro
                SummaryTable st = new SummaryTable(dsm.getString(2));
                
                System.out.println("questo param: "+dsm.getString(1));
                dsm2.setParameter(TDBManager.ParameterType.INT, dsm.getString(1), 1);
                
                dsm2.runPreparedQuery();
                
                while(dsm2.next()){
                    
                    System.out.println("ecco "+dsm2.getString(1));
                    
                    if(dsm2.getString(1).equalsIgnoreCase(AGROMETEO)){
                        st.setValore_agrometeo(SummaryTable.O);
                    }else if(dsm2.getString(1).equalsIgnoreCase(CLIMAURBANO)){
                        st.setValore_climaurbano(SummaryTable.O);
                    }else if(dsm2.getString(1).equalsIgnoreCase(METEO)){
                        st.setValore_clima(SummaryTable.O);
                    }else if(dsm2.getString(1).equalsIgnoreCase(ENERGY)){
                        st.setValore_energy(SummaryTable.O);
                    }else if(dsm2.getString(1).equalsIgnoreCase(INDOOR)){
                        st.setValore_indoor(SummaryTable.O);
                    }
                }
                summaryTableList.add(st);
                
            }
            
        }catch(Exception ex){
            Logger.getLogger(SummaryTableBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                dsm2.closeConnection();
            } catch (SQLException ex) {
                Logger.getLogger(SummaryTableBean.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                dsm.closeConnection();
            } catch (SQLException ex) {
                Logger.getLogger(SummaryTableBean.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
