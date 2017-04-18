/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.SWH4EConst;
import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;

import javax.annotation.PostConstruct;
import javax.faces.application.ConfigurableNavigationHandler;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

//import java.io.Serializable;


/**
 *
 * @author lerocchi
 */

@ManagedBean(name="adminBean")
@SessionScoped
public class AdminBean implements Serializable,   SWH4EConst{
    
    private static final long serialVersionUID = 1L;
	
    private boolean disabled;
    
    private String stationName;
    private String description;
    private String lon;
    private String lat;

    private Map<String,String> stationTypes, macroTypes;
    private String selectedStationType;
    private String selectedMacroType;

    private boolean latlongDisabled;



    private String tags;
    private String taggroups;
    private String selectedsensorSaved;
    private Date dataregistrazione;
    private String metaDescr;
    private String responsabileEmail;
    private String responsabile;
     
    private String enableThisElement;
    @ManagedProperty(value="#{loginBean}")
    private LoginBean loginBean;

    public String getSelectedsensorSaved() {
        return selectedsensorSaved;
    }

    public void setSelectedsensorSaved(String selectedsensorSaved) {
        this.selectedsensorSaved = selectedsensorSaved;
    }

    public boolean isLatlongDisabled() {
        return latlongDisabled;
    }

    public void setLatlongDisabled(boolean latlongDisabled) {
        this.latlongDisabled = latlongDisabled;
    }

    public boolean isDisabled() {
        return disabled;
    }
 
    public void setDisabled(boolean disabled) {
        this.disabled = disabled;
    }

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    public String getSelectedStationType() {
        return selectedStationType;
    }

    public void setSelectedStationType(String selectedStationType) {
        this.selectedStationType = selectedStationType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLon() {
        return lon;
    }

    public void setLon(String lon) {
        this.lon = lon;
    }

    public Map<String, String> getStationTypes() {
        return stationTypes;
    }

    public void setStationTypes(Map<String, String> stationTypes) {
        this.stationTypes = stationTypes;
    }

    public Map<String, String> getMacroTypes() {
        return macroTypes;
    }

    public void setMacroTypes(Map<String, String> macroTypes) {
        this.macroTypes = macroTypes;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getSelectedMacroType() {
        return selectedMacroType;
    }

    public void setSelectedMacroType(String selectedMacroType) {
        this.selectedMacroType = selectedMacroType;
    }

    public Date getDataregistrazione() {
        return dataregistrazione;
    }

    public void setDataregistrazione(Date dataregistrazione) {
        this.dataregistrazione = dataregistrazione;
    }

    public String getMetaDescr() {
        return metaDescr;
    }

    public void setMetaDescr(String metaDescr) {
        this.metaDescr = metaDescr;
    }

    public String getResponsabileEmail() {
        return responsabileEmail;
    }

    public void setResponsabileEmail(String responsabileEmail) {
        this.responsabileEmail = responsabileEmail;
    }

    public String getResponsabile() {
        return responsabile;
    }

    public void setResponsabile(String responsabile) {
        this.responsabile = responsabile;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getTaggroups() {
        return taggroups;
    }

    //Managed Beans
    
    public void setTaggroups(String taggroups) {
        this.taggroups = taggroups;
    }

    public LoginBean getLoginBean() {
            return loginBean;
    }
    public void setLoginBean(LoginBean loginBean) {
            this.loginBean = loginBean;
    }
    
    
    //Call adminsensors page
    public void nextStep() {
        if (stationName.matches("")) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Attenzione", "ID Stazione non inserita"));

        } else if (description.matches("")) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Attenzione",  "Nome stazione non inserito"));

        } else if (selectedMacroType.matches("")) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Attenzione", "Macro Tipologia non selezionata"));

        } else if (selectedStationType.matches("")) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Attenzione", "Specializzazione non selezionata"));

        } else if (!selectedMacroType.matches("M") && lat.matches("")) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Attenzione", "Latitudine non inserita"));

        } else if (!selectedMacroType.matches("M") && lon.matches("")) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Attenzione", "Longiturdine non inserita"));

        } else if (responsabile.matches("")) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Attenzione", "Responsabile non inserito"));

        } else if (responsabileEmail.matches("")) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Attenzione", "Email responsabile non inserito"));

        } else if (metaDescr.matches("")) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Attenzione", "Metadati non inseriti"));

        } else {
            FacesContext fcontext = FacesContext.getCurrentInstance();

            ConfigurableNavigationHandler nav = (ConfigurableNavigationHandler)
                    fcontext.getApplication().getNavigationHandler();
            nav.performNavigation("do_next");
        }
    }
    
    
   
    public void doCancella(){


        System.out.println("back home");

        FacesContext fcontext = FacesContext.getCurrentInstance();
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Operazione Annullata","");
        ConfigurableNavigationHandler nav = (ConfigurableNavigationHandler)
                fcontext.getApplication().getNavigationHandler();
        nav.performNavigation("cancel_insert");
    }
    
    public void nextbtnEnable(){
        this.disabled = false;
    }
    
    @PostConstruct
    public void init(){
        this.dataregistrazione = new Date();


        this.enableThisElement = NONE_STR;
        this.macroTypes = new HashMap<String, String>();
        this.latlongDisabled = true;
        this.disabled = true;
        TDBManager dsm=null;
        


        try {
            if(loginBean.getLogged()){

                dsm = new TDBManager("jdbc/urbandb");

                //Load Macro types
                String sqlString="select macro_type, description from macro_types order by 2";  //toolbarBean.createWhereString("c.tipo");

                dsm.setPreparedStatementRef(sqlString);
                dsm.runPreparedQuery();

                while(dsm.next()){
                    this.macroTypes.put(dsm.getString(2),dsm.getString(1));
                }

            }else{
                System.out.println("Utente non loggato");
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                    dsm.closeConnection();
            } catch (SQLException e) {

                    e.printStackTrace();
            }
        }

    }

    public void loadStationType(){
        TDBManager dsm=null;

        try {
            if(loginBean.getLogged()){



                dsm = new TDBManager("jdbc/urbandb");

                this.stationTypes = new HashMap<String, String>();
                String sqlString="select id_station_type, tipo from station_types where macro_type='"+selectedMacroType+"' order by 2";  //toolbarBean.createWhereString("c.tipo");

                dsm.setPreparedStatementRef(sqlString);
                dsm.runPreparedQuery();

                while(dsm.next()){

                    this.stationTypes.put(dsm.getString(2),""+dsm.getInteger(1));
                }


                if(selectedMacroType.matches("M")){
                    System.out.println("disabilitato");
                    this.latlongDisabled = true;
                }else{
                    System.out.println("abilitato");
                    this.latlongDisabled = false;
                }
            }else{
                System.out.println("Utente non loggato");
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                dsm.closeConnection();
            } catch (SQLException e) {

                e.printStackTrace();
            }
        }
    }
    
}
