package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.SWH4EConst;
import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager;

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
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lerocchi on 27/01/17.
 *
 * Class for editing station meta-data
 */
@ManagedBean(name="editStationBean")
@SessionScoped
public class EditStationBean implements Serializable, SWH4EConst {

    private static final long serialVersionUID = 1L;

    private int passedId;  //used for parameter management
    private String stationName;

    private String stationDescr;
    private String stationResponsible;
    private Date stationDataReg;
    private String stationMetadata;
    private String stationEmail;
    private String stationTipo;

    private String selectedMT;
    private String lat, lon;

    private Map<String,String> stationTypes, macroTypes;
    private String selectedStationType;
    private String selectedMacroType;

    @ManagedProperty(value="#{loginBean}")
    private LoginBean loginBean;

    @ManagedProperty(value="#{mobileStationBean}")
    private MobileStationBean mobileStationBean;

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
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

    public String getSelectedStationType() {
        return selectedStationType;
    }

    public void setSelectedStationType(String selectedStationType) {
        this.selectedStationType = selectedStationType;
    }

    public String getSelectedMacroType() {
        return selectedMacroType;
    }

    public void setSelectedMacroType(String selectedMacroType) {
        this.selectedMacroType = selectedMacroType;
    }

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    public int getPassedId() {
        return passedId;
    }

    public void setPassedId(int passedId) {
        this.passedId = passedId;
    }

    public String getStationDescr() {
        return stationDescr;
    }

    public void setStationDescr(String stationDescr) {
        this.stationDescr = stationDescr;
    }

    public String getStationResponsible() {
        return stationResponsible;
    }

    public void setStationResponsible(String stationResponsible) {
        this.stationResponsible = stationResponsible;
    }

    public Date getStationDataReg() {
        return stationDataReg;
    }

    public void setStationDataReg(Date stationDataReg) {
        this.stationDataReg = stationDataReg;
    }

    public String getStationMetadata() {
        return stationMetadata;
    }

    public void setStationMetadata(String stationMetadata) {
        this.stationMetadata = stationMetadata;
    }

    public String getStationEmail() {
        return stationEmail;
    }

    public void setStationEmail(String stationEmail) {
        this.stationEmail = stationEmail;
    }

    public String getStationTipo() {
        return stationTipo;
    }

    public void setStationTipo(String stationTipo) {
        this.stationTipo = stationTipo;
    }

    public MobileStationBean getMobileStationBean() {
        return mobileStationBean;
    }

    public void setMobileStationBean(MobileStationBean mobileStationBean) {
        this.mobileStationBean = mobileStationBean;
    }

//Managed Beans


    public LoginBean getLoginBean() {
        return loginBean;
    }
    public void setLoginBean(LoginBean loginBean) {
        this.loginBean = loginBean;
    }


    //Call adminsensors page
    public void nextStep() {

    }

    public void saveStation(){

    }

    public void doCancella(){

        FacesContext fcontext = FacesContext.getCurrentInstance();
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Operazione Annullata","");
        ConfigurableNavigationHandler nav = (ConfigurableNavigationHandler)
                fcontext.getApplication().getNavigationHandler();
        nav.performNavigation("cancel_insert");
    }


    @PostConstruct
    public void init(){

        TDBManager dsm=null;

        loadStationType();
        try {
            if(loginBean.getLogged()){

                dsm = new TDBManager("jdbc/urbandb");

                //Load Macro types
                String sqlString="select ms.nome, ms.tipo, ms.descrizione, " +
                        "m.responsabile, m.data_registrazione,m.descrizione, " +
                        "m.email,st.tipo, st_x(the_geom), st_y(the_geom), mt.description " +
                        "from mobile_stations ms, metadati m, " +
                        "station_types st, macro_types mt " +
                        "where ms.id_mobile_station = m.id_mobile_station " +
                        "and   ms.id_station_type = st.id_station_type " +
                        "and   ms.tipo = mt.macro_type "+
                        "and   ms.id_mobile_station = ?";

                System.out.println("passedID: "+mobileStationBean.getPassedId());

                dsm.setPreparedStatementRef(sqlString);
                dsm.setParameter(DBManager.ParameterType.INT,""+mobileStationBean.getPassedId(),1);
                dsm.runPreparedQuery();

                while(dsm.next()){

                    this.stationName = dsm.getString(1);
                    this.selectedMacroType = dsm.getString(11);
                    this.stationDescr = dsm.getString(3);
                    this.stationResponsible = dsm.getString(4);
                    GregorianCalendar gc = dsm.getData(5);
                   // this.stationDataReg = dsm.get(5);
                    this.stationMetadata = dsm.getString(6);
                    this.stationEmail = dsm.getString(7);
                    this.stationTipo = dsm.getString(8);

                    this.selectedMT = dsm.getString(2);
                    if(!dsm.getString(2).matches("M")){
                        this.lat = dsm.getString(11);
                        this.lon = dsm.getString(10);
                    }

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
                String sqlString="select id_station_type, tipo from station_types where macro_type='"+selectedMT+"' order by 2";  //toolbarBean.createWhereString("c.tipo");

                dsm.setPreparedStatementRef(sqlString);
                dsm.runPreparedQuery();

                while(dsm.next()){

                    this.stationTypes.put(dsm.getString(2),""+dsm.getInteger(1));
                }

              //  this.selectedStationType = this.stationTipo;

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
