package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.MobileStation;
import it.cnr.ibimet.bikeclimate.entities.MobileStationDataModel;
import it.lr.libs.DBManager.ParameterType;

import javax.annotation.PostConstruct;
import javax.faces.application.ConfigurableNavigationHandler;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


@ManagedBean(name="mobileStationBean")
@SessionScoped
public class MobileStationBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int passedId;  //used for parameter management
	private List<MobileStation> mobilestationlist;
	private MobileStation mobileStationSelezionato001,mobileStationSelezionato002,mobileStationSelezionato003;
	
//	private MobileStation mobileStationSelezionato;
	private MobileStationDataModel mobileStationListModel;
	

	private String clausulaWhere ;
    @ManagedProperty(value="#{loginBean}")
	private LoginBean loginBean;

    public String getClausulaWhere() {
        return clausulaWhere;
    }
        
    public void setClausulaWhere(String clausulaWhere) {
        this.clausulaWhere = clausulaWhere;
    }
	
	public LoginBean getLoginBean() {
		return loginBean;
	}

	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}

	public MobileStation getMobileStationSelezionato002() {
		return mobileStationSelezionato002;
	}
	public void setMobileStationSelezionato002(
			MobileStation mobileStationSelezionato002) {
		this.mobileStationSelezionato002 = mobileStationSelezionato002;
	}
	public MobileStation getMobileStationSelezionato001() {
		return mobileStationSelezionato001;
	}
	public void setMobileStationSelezionato001(
			MobileStation mobileStationSelezionato001) {
		this.mobileStationSelezionato001 = mobileStationSelezionato001;
	}

	
	public List<MobileStation> getMobilestationlist() {
		return mobilestationlist;
	}
	public void setMobilestationlist(List<MobileStation> mobilestationlist) {
		this.mobilestationlist = mobilestationlist;
	}

	public MobileStation getMobileStationSelezionato003() {
		return mobileStationSelezionato003;
	}
	public void setMobileStationSelezionato003(
			MobileStation mobileStationSelezionato003) {
		this.mobileStationSelezionato003 = mobileStationSelezionato003;
	}

	public MobileStationDataModel getMobileStationListModel() {
		return mobileStationListModel;
	}
	public void setMobileStationListModel(
			MobileStationDataModel mobileStationListModel) {
		this.mobileStationListModel = mobileStationListModel;
	}

	public int getPassedId() {
		return passedId;
	}

	public void setPassedId(int passedId) {
		this.passedId = passedId;
	}

	public void popola(){
		TDBManager dsm=null;
		try {
                    
			if(clausulaWhere==null)
				return;

			dsm = new TDBManager("jdbc/urbandb");
			
				//giardino=idgiardini.get(0);
			System.out.println("MobilestationBean - main - connessione aperta");
		
			
			String sqlString="select id_mobile_station, nome, img, descrizione, activated " +
                                "from mobile_stations a, station_types b " +
                                "where a.id_station_type=b.id_station_type and id_domain=? and b.tipo "+clausulaWhere+" order by 5 desc,2 asc";
			
                        System.out.println("ecoc la query: "+sqlString);
                        
                        
			dsm.setPreparedStatementRef(sqlString);
			dsm.setParameter(ParameterType.INT, ""+loginBean.getId_dominio(), 1);
			dsm.runPreparedQuery();
			mobilestationlist = new ArrayList<MobileStation>();
//			mobilestationlist2 = new ArrayList<MobileStation>();


			while(dsm.next()){
				this.mobilestationlist.add(new MobileStation(dsm.getInteger(1),dsm.getString(3),dsm.getString(2),dsm.getString(4),dsm.getBoolean(5)));
//				this.mobilestationlist2.add(new MobileStation(dsm.getInteger(1),dsm.getString(3),dsm.getString(2)));
				
			}

			if(mobilestationlist.size()>0){
				this.mobileStationListModel= new MobileStationDataModel(this.mobilestationlist);
				this.mobileStationSelezionato001 = this.mobilestationlist.get(0);
				this.mobileStationSelezionato002 = this.mobilestationlist.get(0);
				this.mobileStationSelezionato003 = this.mobilestationlist.get(0);
			}else{
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Attenzione", "Nessun dato presente"));
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		} finally{
			try{
				dsm.closeConnection();
			}catch(Exception e){
				e.getStackTrace();
			}
		}
		
	}

	/**
	 * switchActivate switch station status between ativate and deactivate
	 */
	public void switchActivate(){

		TDBManager dsm=null;
		try {
			dsm = new TDBManager("jdbc/urbandb");


			String sqlString="update mobile_stations set activated = not activated where id_mobile_station = ?";

			dsm.setPreparedStatementRef(sqlString);
			dsm.setParameter(ParameterType.INT, ""+passedId, 1);
			dsm.performInsert();

		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try{
				dsm.closeConnection();
			}catch(Exception e){
				e.getStackTrace();
			}
		}

		//launch populate
		//System.out.println("ora popolo di nuovo");
		popola();

	}

	/**
	 * openEdit open edit windows for selected station
	 */
	public void openEdit(){

		FacesContext fcontext = FacesContext.getCurrentInstance();

		ConfigurableNavigationHandler nav = (ConfigurableNavigationHandler)
				fcontext.getApplication().getNavigationHandler();
		nav.performNavigation("open_edit");

	}

	@PostConstruct
	public void init(){
		System.out.println("MobileStation - init");

		mobileStationSelezionato001=new MobileStation(0, "", "");
		mobileStationSelezionato002=new MobileStation(0, "", "");
		mobileStationSelezionato003=new MobileStation(0, "", "");

		clausulaWhere="is null";

	}
	
	public void popolaTracks(){
		
		System.out.println("MobileSasdasdasdasdastation - init");
		
	}
}
