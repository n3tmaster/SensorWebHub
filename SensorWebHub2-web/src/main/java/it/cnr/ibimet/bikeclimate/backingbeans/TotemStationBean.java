package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.Totem;
import it.cnr.ibimet.bikeclimate.entities.TotemStationDataModel;
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


@ManagedBean(name="totemStationBean")
@SessionScoped
public class TotemStationBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private int passedId;
	private Totem totemStationSelezionato,totemStationSelezionato2,totemStationSelezionato3;
	private TotemStationDataModel totemStationListModel; 
	private List<Totem> totemstationlist;

	private String clausulaWhere ;

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
        
	
	public Totem getTotemStationSelezionato3() {
		return totemStationSelezionato3;
	}



	public void setTotemStationSelezionato3(Totem totemStationSelezionato3) {
		this.totemStationSelezionato3 = totemStationSelezionato3;
	}


	public int getPassedId() {
		return passedId;
	}

	public void setPassedId(int passedId) {
		this.passedId = passedId;
	}

	public Totem getTotemStationSelezionato2() {
		return totemStationSelezionato2;
	}



	public void setTotemStationSelezionato2(Totem totemStationSelezionato2) {
		this.totemStationSelezionato2 = totemStationSelezionato2;
	}



	public List<Totem> getTotemstationlist() {
		return totemstationlist;
	}



	public void setTotemstationlist(List<Totem> totemstationlist) {
		this.totemstationlist = totemstationlist;
	}



	public Totem getTotemStationSelezionato() {
		return totemStationSelezionato;
	}



	public void setTotemStationSelezionato(Totem totemStationSelezionato) {
		this.totemStationSelezionato = totemStationSelezionato;
	}



	public TotemStationDataModel getTotemStationListModel() {
		return totemStationListModel;
	}



	public void setTotemStationListModel(TotemStationDataModel totemStationListModel) {
		this.totemStationListModel = totemStationListModel;
	}



	public void popola(){
		TDBManager dsm=null;
		TDBManager dsm2=null;
		try {
                    dsm = new TDBManager("jdbc/urbandb");
					dsm2 = new TDBManager("jdbc/urbandb");

                            //giardino=idgiardini.get(0);
                    System.out.println("TotemstationBean - main - connessione aperta");



                    String sqlString="select id_mobile_station, nome,img, descrizione, activated, external " +
                            "from mobile_stations a, station_types b where a.id_station_type=b.id_station_type and id_domain=? and b.tipo "+clausulaWhere+" order by 5 desc,2 asc";

					dsm2.setPreparedStatementRef("select webservice, fromdate, operation_type from interoperability where id_mobile_station = ?");

					dsm.setPreparedStatementRef(sqlString);
                    dsm.setParameter(DBManager.ParameterType.INT, ""+loginBean.getId_dominio(), 1);
                    dsm.runPreparedQuery();
                    totemstationlist = new ArrayList<Totem>();

                    while(dsm.next()){

						if(dsm.getBoolean(6)){

							dsm2.setParameter(DBManager.ParameterType.INT, ""+dsm.getInteger(1), 1);
							dsm2.runPreparedQuery();

							if(dsm2.next()){
								this.totemstationlist.add(new Totem( dsm.getString(2),dsm.getInteger(1), dsm.getString(4),
										dsm.getString(3),dsm.getBoolean(5),dsm2.getString(1),dsm2.getString(2), dsm2.getString(3)));
							}else{
								this.totemstationlist.add(new Totem( dsm.getString(2),dsm.getInteger(1), dsm.getString(4),dsm.getString(3),dsm.getBoolean(5)));
							}

							this.totemstationlist.add(new Totem( dsm.getString(2),dsm.getInteger(1), dsm.getString(4),dsm.getString(3),dsm.getBoolean(5)));

						}else{
							this.totemstationlist.add(new Totem( dsm.getString(2),dsm.getInteger(1), dsm.getString(4),dsm.getString(3),dsm.getBoolean(5)));
						}


                    }

					if(totemstationlist.size() > 0){
						this.totemStationListModel= new TotemStationDataModel(this.totemstationlist);
						this.totemStationSelezionato = this.totemstationlist.get(0);
						this.totemStationSelezionato2 = this.totemstationlist.get(0);
						this.totemStationSelezionato3 = this.totemstationlist.get(0);
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
			try{
				dsm2.closeConnection();
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
		System.out.println("TotemStation - init");
		totemStationSelezionato=new Totem("", 0);
		totemStationSelezionato2=new Totem("", 0);
		totemStationSelezionato3=new Totem("", 0);
		clausulaWhere="is null";
		//popola();
	}
	

}
