package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.Eddy;
import it.cnr.ibimet.bikeclimate.entities.EddyStationDataModel;
import it.lr.libs.DBManager;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


@ManagedBean(name="eddyStationBean")
@SessionScoped
public class EddyStationBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
        private String clausulaWhere;
	private int passedId;
	private Eddy eddyStationSelezionato,eddyStationSelezionato2,eddyStationSelezionato3;
	private EddyStationDataModel eddyStationListModel;
	private List<Eddy> eddystationlist;

         @ManagedProperty(value="#{loginBean}")
	private LoginBean loginBean;
	
	public LoginBean getLoginBean() {
		return loginBean;
	}

	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}
        
        
    public String getClausulaWhere() {
        return clausulaWhere;
    }

    public void setClausulaWhere(String clausulaWhere) {
        this.clausulaWhere = clausulaWhere;
    }
	
	


	
	public Eddy getEddyStationSelezionato3() {
		return eddyStationSelezionato3;
	}



	public void setEddyStationSelezionato3(Eddy eddyStationSelezionato3) {
		this.eddyStationSelezionato3 = eddyStationSelezionato3;
	}



	public Eddy getEddyStationSelezionato2() {
		return eddyStationSelezionato2;
	}



	public void setEddyStationSelezionato2(Eddy eddyStationSelezionato2) {
		this.eddyStationSelezionato2 = eddyStationSelezionato2;
	}



	public Eddy getEddyStationSelezionato() {
		return eddyStationSelezionato;
	}

	public void setEddyStationSelezionato(Eddy eddyStationSelezionato) {
		this.eddyStationSelezionato = eddyStationSelezionato;
	}

	public int getPassedId() {
		return passedId;
	}

	public void setPassedId(int passedId) {
		this.passedId = passedId;
	}

	public EddyStationDataModel getEddyStationListModel() {
		return eddyStationListModel;
	}



	public void setEddyStationListModel(EddyStationDataModel eddyStationListModel) {
		this.eddyStationListModel = eddyStationListModel;
	}



	public List<Eddy> getEddystationlist() {
		return eddystationlist;
	}



	public void setEddystationlist(List<Eddy> eddystationlist) {
		this.eddystationlist = eddystationlist;
	}



	public void popola(){
		TDBManager dsm=null;
		try {
			dsm = new TDBManager("jdbc/urbandb");
			
				//giardino=idgiardini.get(0);
			System.out.println("EddystationBean - main - connessione aperta");
		
			
			
			String sqlString="select a.id_mobile_station, nome, descrizione, img, activated from mobile_stations a, station_types b "
                                + ", utenti_stations us " +
					"where us.id_utente=? and a.id_mobile_station= us.id_mobile_station and a.id_station_type=b.id_station_type and a.id_domain=? and b.tipo "+clausulaWhere+" order by 5 desc,2 asc";
			
			dsm.setPreparedStatementRef(sqlString);
			dsm.setParameter(DBManager.ParameterType.INT, ""+loginBean.getId_user(), 1);
			dsm.setParameter(DBManager.ParameterType.INT, ""+loginBean.getId_dominio(), 2);
			dsm.runPreparedQuery();
			eddystationlist = new ArrayList<Eddy>();
			
			
			while(dsm.next()){
				System.out.println("Ecco :"+dsm.getString(2)+" - "+dsm.getInteger(1)+" - "+dsm.getString(3));
				this.eddystationlist.add(new Eddy(dsm.getString(2),dsm.getInteger(1),dsm.getString(3),dsm.getString(4),dsm.getBoolean(5)));
				
			}


			if(eddystationlist.size() > 0){
				this.eddyStationListModel= new EddyStationDataModel(this.eddystationlist);
				this.eddyStationSelezionato=this.eddystationlist.get(0);
				this.eddyStationSelezionato2=this.eddystationlist.get(0);
				this.eddyStationSelezionato3=this.eddystationlist.get(0);
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
			dsm.setParameter(DBManager.ParameterType.INT, ""+passedId, 1);
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

		popola();

	}
	
	
	@PostConstruct
	public void init(){
		System.out.println("EddyStation - init");
		eddyStationSelezionato=new Eddy("", 0);
		eddyStationSelezionato2=new Eddy("", 0);
		eddyStationSelezionato3=new Eddy("",0);
		clausulaWhere="is null";
	//	popola();
	}
	

}
