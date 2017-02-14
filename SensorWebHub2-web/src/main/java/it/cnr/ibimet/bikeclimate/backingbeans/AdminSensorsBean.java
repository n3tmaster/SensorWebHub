/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.SWH4EConst;
import it.cnr.ibimet.bikeclimate.dbutils.SendMail;
import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.dbutils.TableSchema;
import it.cnr.ibimet.bikeclimate.entities.Sensor;
import it.lr.libs.DBManager;
import org.primefaces.event.SelectEvent;

import javax.annotation.PostConstruct;
import javax.faces.application.ConfigurableNavigationHandler;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.*;

/**
 *
 * @author lerocchi
 */

@ManagedBean(name="adminSensorsBean")
@SessionScoped
public class AdminSensorsBean implements Serializable,SWH4EConst{

    private static final long serialVersionUID = 1L;
    private Map<String,String> fieldsType;
    private List<Sensor> sensors;
    private String selectedChartType;
    private String selectedAggregationType;
    private String param_name;
    private String min_val, max_val, unit;
    private String selectedFieldType;
    private int icounter;
    
    //Managed Beans
    
    @ManagedProperty(value="#{loginBean}")
    private LoginBean loginBean;
    @ManagedProperty(value="#{adminBean}")
    private AdminBean adminBean;

    public LoginBean getLoginBean() {
            return loginBean;
    }
    
    public void setLoginBean(LoginBean loginBean) {
            this.loginBean = loginBean;
    }

    public int getIcounter() {
        return icounter;
    }

    public void setIcounter(int icounter) {
        this.icounter = icounter;
    }

    public String getSelectedAggregationType() {
        return selectedAggregationType;
    }

    public void setSelectedAggregationType(String selectedAggregationType) {
        this.selectedAggregationType = selectedAggregationType;
    }

    
    
    
    public AdminBean getAdminBean() {
        return adminBean;
    }

    public void setAdminBean(AdminBean adminBean) {
        this.adminBean = adminBean;
    }

    public Map<String, String> getFieldsType() {
        return fieldsType;
    }

    public void setFieldsType(Map<String, String> fieldsType) {
        this.fieldsType = fieldsType;
    }

    public List<Sensor> getSensors() {
        return sensors;
    }

    public void setSensors(List<Sensor> sensors) {
        this.sensors = sensors;
    }
    
    public String getSelectedFieldType() {
        return selectedFieldType;
    }

    public void setSelectedFieldType(String selectedFieldType) {
        this.selectedFieldType = selectedFieldType;
    }

    public String getParam_name() {
        return param_name;
    }

    public void setParam_name(String param_name) {
        this.param_name = param_name;
    }

    public String getMin_val() {
        return min_val;
    }

    public void setMin_val(String min_val) {
        this.min_val = min_val;
    }

    public String getSelectedChartType() {
        return selectedChartType;
    }

    public void setSelectedChartType(String selectedChartType) {
        this.selectedChartType = selectedChartType;
    }

    public String getMax_val() {
        return max_val;
    }

    public void setMax_val(String max_val) {
        this.max_val = max_val;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }   
    
    public void addSensor(){

        
        try{
           // this.sensors = new ArrayList<Sensor>();
           this.sensors.add(new Sensor(this.param_name, Double.parseDouble(this.min_val),Double.parseDouble(this.max_val),
                   this.unit,this.selectedChartType, this.selectedFieldType, icounter,this.selectedAggregationType));
            
           icounter = icounter + 1;
         
           //clean elements on the form
           this.param_name = "";
           this.max_val = "";
           this.min_val = "";
           this.unit = "";
           
        FacesContext.getCurrentInstance().addMessage(null, 
                new FacesMessage(FacesMessage.SEVERITY_INFO,"Attenzione!", "Sensore aggiunto!")); 
        }catch(Exception e){
            System.out.println("sono in catch");    
            System.out.println("Error "+e.getMessage());
            System.out.println("stack "+e.getStackTrace());
        }
    }
    
    
    @PostConstruct
    public void init(){
        sensors = new ArrayList<Sensor>();
        icounter=1;
        
        recreateFieldList();
    }
    
    public void cancella(){

        FacesContext fcontext = FacesContext.getCurrentInstance();
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Operazione Annullata","");
        ConfigurableNavigationHandler nav = (ConfigurableNavigationHandler)
                fcontext.getApplication().getNavigationHandler();
        nav.performNavigation("cancel_insert_sensor");
    }
     
    public void recreateFieldList(){
        TDBManager dsm=null;
        TableSchema thisTbl = null;
        String out = "-1";
        String selected_table = "";

        try {
            if(loginBean.getLogged()){

                dsm = new TDBManager("jdbc/urbandb");

                fieldsType = new HashMap<String, String>();
                //Get macro type and icon


                out = adminBean.getSelectedMacroType();

                
                System.out.println("ecco cosa è stato scelto "+out);
                
                if(out.matches("M")){
                    selected_table = "dati";

                //    thisTbl =new TableSchema(dsm, "dati");
                }else if(out.matches("T")){
                    selected_table = "dati_stazioni_fisse";
                //    thisTbl =new TableSchema(dsm, "dati_stazioni_fisse");
                }else if(out.matches("E")){
                    selected_table = "dati_eddy";
                //    thisTbl =new TableSchema(dsm, "dati_eddy");
                }

                String sqlString="select parameter_name, field_name from table_field_params_list where table_name = ?";


                dsm.setPreparedStatementRef(sqlString);
                dsm.setParameter(DBManager.ParameterType.STRING, selected_table,1);
                dsm.runPreparedQuery();


                while(dsm.next()){
                    fieldsType.put( dsm.getString(1), dsm.getString(2));
                }
            }else{
                FacesContext.getCurrentInstance().addMessage(null,
                new FacesMessage(FacesMessage.SEVERITY_FATAL,"Attenzione!", "Errore grave!")); 
            }
            
            
            
        }catch (Exception e) {
            e.printStackTrace();
            FacesContext.getCurrentInstance().addMessage(null, 
                new FacesMessage(FacesMessage.SEVERITY_FATAL,"Attenzione!", e.getMessage())); 
        }finally{
            try {
                    dsm.closeConnection();
            } catch (SQLException e) {

                    e.printStackTrace();
            }
        }
        
    }
     
     
     
     public void saveStation(){
        
        String icon="", macro_type="";
        long newID=-1;
     	GregorianCalendar result1 = null; 
        result1 = new GregorianCalendar(); 
        result1.setTimeInMillis(adminBean.getDataregistrazione().getTime()); 
        
        
        //check if user has selected one station type
        if(Integer.parseInt(adminBean.getSelectedStationType())==-1){
            FacesContext.getCurrentInstance().addMessage(null, 
                new FacesMessage(FacesMessage.SEVERITY_INFO,"Attenzione!", "Seleziona una tipologia!")); 
        }
        
        TDBManager dsm=null;
        try {
            if(loginBean.getLogged()){

                dsm = new TDBManager("jdbc/urbandb");

                //Get macro type and icon
                
                String sqlString="select icona, macro_type from station_types where id_station_type="+adminBean.getSelectedStationType();
                
                dsm.setPreparedStatementRef(sqlString);
                dsm.runPreparedQuery();
                
                if(dsm.next()){
                    icon = dsm.getString(1);
                    macro_type = dsm.getString(2);
                }
                
                //Retrieve new ID
                sqlString="select max(id_mobile_station) from mobile_stations";
                
                dsm.setPreparedStatementRef(sqlString);
                dsm.runPreparedQuery();
                
                if(dsm.next()){
                    newID = dsm.getInteger(1) +1 ;
                }
                
                if(macro_type.equalsIgnoreCase("T") || macro_type.equalsIgnoreCase("E")){
                    //Check coordinates
                    if(adminBean.getLat().matches("")==false && adminBean.getLon().matches("")==false){
                        sqlString="insert into mobile_stations (nome, img, tipo, descrizione, id_station_type,the_geom,id_domain) "
                                + "values "
                                + "(?,?,?,?,?,ST_GeomFromText(POINT("+adminBean.getLon()+" "+adminBean.getLat()+"), 4326),1)";
                    }else{
                         FacesContext.getCurrentInstance().addMessage(null, 
                            new FacesMessage(FacesMessage.SEVERITY_INFO,"Attenzione!", "Le stazioni fisse devono avere le coordinate inserite!")); 
                    }
                }else{
                     sqlString="insert into mobile_stations (nome, img, tipo, descrizione, id_station_type,id_domain) "
                                + "values "
                                + "(?,?,?,?,?,1)";
                }
                
                System.out.println(sqlString);
                
                dsm.setPreparedStatementRef(sqlString);
                dsm.setParameter(DBManager.ParameterType.STRING, adminBean.getStationName(), 1);
                dsm.setParameter(DBManager.ParameterType.STRING, icon, 2);
                dsm.setParameter(DBManager.ParameterType.STRING, macro_type, 3);
                dsm.setParameter(DBManager.ParameterType.STRING, adminBean.getDescription(), 4);
                dsm.setParameter(DBManager.ParameterType.INT, adminBean.getSelectedStationType(), 5);
                dsm.performInsert();
                dsm.commit();
                
                
                 //Retrieve new ID
                sqlString="select max(id_mobile_station) from mobile_stations";
                
                dsm.setPreparedStatementRef(sqlString);
                dsm.runPreparedQuery();
                
                if(dsm.next()){
                    newID = dsm.getInteger(1) ;
                }
                
                //Insert metadata
                
                sqlString="insert into metadati (id_mobile_station, responsabile, data_registrazione, descrizione, email) "
                                + "values "
                                + "(?,?,?,?,?)";
                
                System.out.println(sqlString);
               
                dsm.setPreparedStatementRef(sqlString);
                dsm.setParameter(DBManager.ParameterType.INT, ""+newID, 1);
                dsm.setParameter(DBManager.ParameterType.STRING, adminBean.getResponsabile(), 2);
                dsm.setParameter(DBManager.ParameterType.DATE, result1, 3);
                dsm.setParameter(DBManager.ParameterType.STRING, adminBean.getMetaDescr(), 4);
                dsm.setParameter(DBManager.ParameterType.STRING, adminBean.getResponsabileEmail(), 5);
                dsm.performInsert();
                dsm.commit();
                //Add sensors
                sqlString="insert into chart_params (id_mobile_station, param, "+
                        "param_name_en, param_name_fr, param_name_it, "+
                        "chart_type, aggregation_type, unit, "+
                        "min_limit, max_limit) "+
                        "values " +
                        "(?,?,"+
                        "?,?,?,"+
                        "?,?,?,"+
                        "?,?)";
                
                System.out.println(sqlString);
                dsm.setPreparedStatementRef(sqlString);
                for(Sensor thisElem: sensors){
                
                    dsm.setParameter(DBManager.ParameterType.INT, ""+newID, 1);
                    dsm.setParameter(DBManager.ParameterType.STRING, thisElem.getField_name(), 2);
                    dsm.setParameter(DBManager.ParameterType.STRING, thisElem.getParam_name(), 3);
                    dsm.setParameter(DBManager.ParameterType.STRING, thisElem.getParam_name(), 4);
                    dsm.setParameter(DBManager.ParameterType.STRING, thisElem.getParam_name(), 5);
                    dsm.setParameter(DBManager.ParameterType.STRING, thisElem.getChart_type(), 6);
                    dsm.setParameter(DBManager.ParameterType.STRING, thisElem.getAggregation_type(), 7);
                    dsm.setParameter(DBManager.ParameterType.STRING, thisElem.getUnit(), 8);
                    dsm.setParameter(DBManager.ParameterType.DOUBLE, ""+thisElem.getMin_value(), 9);
                    dsm.setParameter(DBManager.ParameterType.DOUBLE, ""+thisElem.getMax_value(), 10);
                    
                    dsm.performInsert();
                }
                
                
                
                dsm.commit();
                
                
            }else{
                System.out.println("Utente non loggato");
                
                FacesContext.getCurrentInstance().addMessage(null, 
                new FacesMessage(FacesMessage.SEVERITY_FATAL,"Attenzione!", "Errore grave!")); 

            }
            
        }catch (Exception e) {
            e.printStackTrace();
            FacesContext.getCurrentInstance().addMessage(null, 
                new FacesMessage(FacesMessage.SEVERITY_FATAL,"Attenzione!", e.getMessage())); 
        }finally{
            try {
                    dsm.closeConnection();
            } catch (SQLException e) {

                    e.printStackTrace();
            }
        }

        
        //send email
        SendMail.sendEmail("l.rocchi@ibimet.cnr.it","[SensorWebHub]: nuova stazione registrata","Registrata la stazione: "+adminBean.getStationName()+" - Responsabile: "+adminBean.getDescription() + " - "+adminBean.getResponsabileEmail());
        SendMail.sendEmail("t.de.filippis@ibimet.cnr.it","[SensorWebHub]: nuova stazione registrata","Registrata la stazione: "+adminBean.getStationName()+" - Responsabile: "+adminBean.getDescription() + " - "+adminBean.getResponsabileEmail());
        SendMail.sendEmail(adminBean.getResponsabileEmail(),"[SensorWebHub]: nuova stazione registrata","Registrata la stazione: "+adminBean.getStationName()+" - Responsabile: "+adminBean.getDescription() + " - "+adminBean.getResponsabileEmail());
        
        

         FacesContext fcontext = FacesContext.getCurrentInstance();
         FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Attenzione","Stazione salvata con successo!");
         ConfigurableNavigationHandler nav = (ConfigurableNavigationHandler)
                 fcontext.getApplication().getNavigationHandler();
         nav.performNavigation("save_station");
    }


    public void onRowSelect(SelectEvent event) {
        System.out.println("AdminSensorBean - Ci sono???");

        Sensor questoElemento = (Sensor) event.getObject();

        sensors.remove(questoElemento);
    }
}
