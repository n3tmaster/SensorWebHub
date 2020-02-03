package it.cnr.ibimet.bikeclimate.backingbeans;


import it.cnr.ibimet.bikeclimate.dbutils.SWH4EConst;
import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;
import org.primefaces.context.RequestContext;

import javax.annotation.PostConstruct;
import javax.faces.application.ConfigurableNavigationHandler;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import java.io.Serializable;
import java.sql.SQLException;

/**
 * Bean for login management
 * This bean performs initialization activities as domain checking and user privileges 
 * @author lerocchi
 */
@ManagedBean(name="loginBean")
@SessionScoped
public class LoginBean implements Serializable, SWH4EConst{
	public static final int AGROMETEOLOGIN=1;
	public static final int URBANLOGIN=2;
	public static final int RENEWABLELOGIN=3;
	private static final long serialVersionUID = 1L;
	private static final int NOLOGIN=-1;
	private static final String USERGUEST = "guest";
	private static final String PWDGUEST = "guest";
	private static final String URBANCLIMATE_IN = "urban";
	private static final String AGROMETEO_IN = "agrometeo";
 	private static final String RENEWABLE_IN = "renew";
	private static final String GREY="_grey.png";
	private static final String ORANGE="_orange.png";
	private static final String AGROMETEOURL="images/agrometeo";
	private static final String METEOURL="images/meteo";
	private static final String CLIMAURBANOURL="images/clima_urbano";
	private static final String INDOORURL="images/indoor";
	private static final String ENERGIEURL="images/energie";
	private String username;
	private String password;
	private boolean logged,loggedout;
	private boolean level5,noLevel5;
	private boolean doAgroMeteo, doMeteo, doUrban, doIndor, doEnergie;
	private String  doAgroMeteoURL,doMeteoURL,doClimaUrbanoURL,doIndoorURL,doEnergieURL;
	private boolean disabledEditBtn;
	private int     id_dominio;
	private String enableAtivateBtn, enableAtivateLabel;
	private int newLogin;
	private String usernamehide="", passwordhide="", dominiohide="";
	private int    initialized = -1;
	private int livello;
	private String adminstatus;
	private String lingua;
	private double zoomfactor, center_x, center_y;
	private int id_user;

	public LoginBean(){
		System.out.println("sono in costruttore");
	}

    public String getLingua() {
        return lingua;
    }

    public void setLingua(String lingua) {
        this.lingua = lingua;
    }

	public String getEnableAtivateBtn() {
		return enableAtivateBtn;
	}

	public void setEnableAtivateBtn(String enableAtivateBtn) {
		this.enableAtivateBtn = enableAtivateBtn;
	}

	public String getAdminstatus() {
        return adminstatus;
    }

    public void setAdminstatus(String adminstatus) {
        this.adminstatus = adminstatus;
    }

	public String getEnableAtivateLabel() {
		return enableAtivateLabel;
	}
        
	public void setEnableAtivateLabel(String enableAtivateLabel) {
		this.enableAtivateLabel = enableAtivateLabel;
	}

	public String getUsernamehide() {
        return usernamehide;
    }
	
    public void setUsernamehide(String usernamehide) {
        this.usernamehide = usernamehide;
    }

    public String getPasswordhide() {
        return passwordhide;
    }

    public void setPasswordhide(String passwordhide) {
        this.passwordhide = passwordhide;
    }

    public String getDominiohide() {
        return dominiohide;
    }

    public void setDominiohide(String dominiohide) {
        this.dominiohide = dominiohide;
    }

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public double getZoomfactor() {
		return zoomfactor;
	}

	public void setZoomfactor(double zoomfactor) {
		this.zoomfactor = zoomfactor;
	}

	public double getCenter_x() {
		return center_x;
	}

	public void setCenter_x(double center_x) {
		this.center_x = center_x;
	}

	public double getCenter_y() {
		return center_y;
	}

	public void setCenter_y(double center_y) {
		this.center_y = center_y;
	}

	public void goAdmin(){

        if(livello>=5){
            System.out.println("go ADMIN");

			FacesContext fcontext = FacesContext.getCurrentInstance();

			ConfigurableNavigationHandler nav = (ConfigurableNavigationHandler)
					fcontext.getApplication().getNavigationHandler();
			nav.performNavigation("do_admin");

        }else{
            System.out.println("NOT GO ADMIN");


        }

    }

	public boolean isDisabledEditBtn() {
		return disabledEditBtn;
	}

	public void setDisabledEditBtn(boolean disabledEditBtn) {
		this.disabledEditBtn = disabledEditBtn;
	}

	public int getId_dominio() {
        return id_dominio;
    }

    public void setId_dominio(int id_dominio) {
        this.id_dominio = id_dominio;
    }

	public int getNewLogin() {
		return newLogin;
	}

	public void setNewLogin(int newLogin) {
		this.newLogin = newLogin;
	}

	public String getDoEnergieURL() {
		return doEnergieURL;
	}

	public void setDoEnergieURL(String doEnergieURL) {
		this.doEnergieURL = doEnergieURL;
	}

	public String getDoIndoorURL() {
		return doIndoorURL;
	}

	public void setDoIndoorURL(String doIndoorURL) {
		this.doIndoorURL = doIndoorURL;
	}

	public String getDoClimaUrbanoURL() {
		return doClimaUrbanoURL;
	}

	public void setDoClimaUrbanoURL(String doClimaUrbanoURL) {
		this.doClimaUrbanoURL = doClimaUrbanoURL;
	}

	public String getDoMeteoURL() {
		return doMeteoURL;
	}
	
	public void setDoMeteoURL(String doMeteoURL) {
		this.doMeteoURL = doMeteoURL;
	}

	public boolean isNoLevel5() {
		return noLevel5;
	}

	public void setNoLevel5(boolean noLevel5) {
		this.noLevel5 = noLevel5;
	}

	public boolean isLevel5() {
		return level5;
	}

	public void setLevel5(boolean level5) {
		this.level5 = level5;
	}

	public boolean getLoggedout() {
		return loggedout;
	}

	public void setLoggedout(boolean loggedout) {
		this.loggedout = loggedout;
	}
	
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setPassword(String password){
		this.password=password;
	}

	public boolean getLogged(){
		return this.logged;
	}
	
	public void setLogged(boolean logged){
		this.logged=logged;

	}
	
	public void externalLogin(){
		RequestContext context= RequestContext.getCurrentInstance();
		FacesMessage msg = null;
		boolean loggedIn=false;
		int id=-1;

                System.out.println("LoginBean - ci sono");

		TDBManager dsm=null;

		FacesContext fcontext = FacesContext.getCurrentInstance();
		if(username==null || password==null){
			loggedIn=false;

		}else{

			try {
                            System.out.println("LoginBean - ci sono 2");

				dsm = new TDBManager("jdbc/urbandb");

				System.out.println("LoginBean - main - connessione aperta");

				String sqlString="select livello, id_utente, "+
							"id_domain, ST_X(center), ST_Y(center), zoomlevel " +
							"from utenti "+
							"where userid=? and pwd=?";

				dsm.setPreparedStatementRef(sqlString);
				dsm.setParameter(ParameterType.STRING, username, 1);
				dsm.setParameter(ParameterType.STRING, password, 2);
				dsm.runPreparedQuery();


				if(dsm.next()){
					loggedIn=true;

					livello=dsm.getInteger(1);
					id=dsm.getInteger(2);
					id_dominio = dsm.getInteger(3);
					id_user = id;
					center_x = dsm.getDouble(4);
					center_y = dsm.getDouble(5);
					zoomfactor = dsm.getDouble(6);


					System.out.println("LoginBean - main - utente trovato, livello: "+dsm.getInteger(1));
				}else{
					loggedIn=false;
				}


			} catch (Exception e) {

				e.printStackTrace();
			}finally{
				try {
					dsm.closeConnection();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}



		if(loggedIn){
			msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Benvenuto", username);

			fcontext.getExternalContext().getSessionMap().put("id", id);
			fcontext.getExternalContext().getSessionMap().put("username", username);
			fcontext.getExternalContext().getSessionMap().put("livello", livello);


			ConfigurableNavigationHandler nav = (ConfigurableNavigationHandler)
			fcontext.getApplication().getNavigationHandler();
			nav.performNavigation("login_urban");
		}else{
			msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Login Error", "Credenziali errate!!!");
		}

		FacesContext.getCurrentInstance().addMessage(null, msg);


       // context.addCallbackParam("loggedIn", loggedIn);

       if(loggedIn){
        	this.logged=true;
        	this.loggedout=false;

        	if(livello>=5){
        		this.level5=false;
        		this.noLevel5=true;

				this.adminstatus=BLOCK_STR;
				this.enableAtivateBtn = BLOCK_STR;
				this.enableAtivateLabel = NONE_STR;



			}else{
        		this.level5=true;
        		this.noLevel5=false;
				this.adminstatus=NONE_STR;
				this.enableAtivateBtn = NONE_STR;
				this.enableAtivateLabel = BLOCK_STR;

			}

       // 	return "loggato";
        }
        this.logged=false;
        this.loggedout=false;
        //return "nologgato";
	}
        
	@PostConstruct
	public void init(){
            System.out.println("sono in init");
            
            lingua="it";
            
            if (this.initialized == -1) {
                this.doAgroMeteo=false;
                this.doIndor=false;
                this.doMeteo=false;
                this.doUrban=false;
                this.newLogin=-1;
                this.livello=-1;
				this.enableAtivateBtn = NONE_STR;
				this.disabledEditBtn = true;
                this.doEnergieURL=ENERGIEURL+GREY;
                this.doAgroMeteoURL=AGROMETEOURL+GREY;
                this.doMeteoURL=METEOURL+GREY; //TODO: da aggiornare quando creato
                this.doClimaUrbanoURL=CLIMAURBANOURL+GREY;
                this.doIndoorURL=INDOORURL+GREY;

			}

  
            if(!this.dominiohide.equals("")){
                if(this.dominiohide.equals(URBANCLIMATE_IN)){
                    doClimaUrbano();
                }else if(this.dominiohide.equals(AGROMETEO_IN)){
                    doAgroMeteo();
                }else if(this.dominiohide.equals(RENEWABLE_IN)){
                    doEnergie();
                }

            }
	}
	
	
	
	public String getDoAgroMeteoURL() {
		return doAgroMeteoURL;
	}

	public void setDoAgroMeteoURL(String doAgroMeteoURL) {
		this.doAgroMeteoURL = doAgroMeteoURL;
	}
        
        
	public String logremote(){

		RequestContext context= RequestContext.getCurrentInstance();
		FacesMessage msg = null;
		boolean loggedIn=false;
		int livello=-1,id=-1;
		String login_where = "";

                System.out.println("LoginBean - LOGIN REMOTO");
               
		TDBManager dsm=null;
		
		
		
		FacesContext fcontext = FacesContext.getCurrentInstance();
		if(!(doIndor || doAgroMeteo || doEnergie 
				|| doMeteo || doUrban)){
			msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Errore", "Selezionare un Dominio prima!");  
			FacesContext.getCurrentInstance().addMessage(null, msg);  
		      this.logged=false;
		        this.loggedout=false;
		        return "-1";
		}else if(doUrban ){
					
			
			{
			
				try {
                                    System.out.println("LoginBean - ci sono 22");
               
					dsm = new TDBManager("jdbc/urbandb");
					
					System.out.println("LoginBean - main - connessione aperta");

					String sqlString="select livello, id_utente, "+
							"id_domain, ST_X(center), ST_Y(center), zoomlevel " +
							"from utenti "+
							"where userid='guest' and pwd='guest'";


					dsm.setPreparedStatementRef(sqlString);
					
					dsm.runPreparedQuery();
					
					
					if(dsm.next()){
						loggedIn=true;
						newLogin=URBANLOGIN;
						livello=dsm.getInteger(1);
						id=dsm.getInteger(2);
						id_dominio = dsm.getInteger(3);
						this.id_user = id;
						center_x = dsm.getDouble(4);
						center_y = dsm.getDouble(5);
						zoomfactor = dsm.getDouble(6);


						login_where = "login_urban";
						System.out.println("LoginBean - main - utente trovato, livello: "+dsm.getInteger(1)+ " id: "+dsm.getString(2));
					}else{
						loggedIn=false;
						newLogin=-1;
					}
					
				
				} catch (Exception e) {
		
					e.printStackTrace();
				}finally{
					try {
						dsm.closeConnection();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
			}
		}else if(doAgroMeteo){
                    // for old purposes
			try {
			
				dsm = new TDBManager("jdbc/imetnetdb");
			
			
			
				//faccio il controllo
				String strquery="select id_login_table,livello from login_table where userid='guest' and pwd='guest'";
				
				dsm.setPreparedStatementRef(strquery);
				
				dsm.runPreparedQuery();
			
			
				if(dsm.next()){
					loggedIn=true;
					newLogin=AGROMETEOLOGIN;
					livello=dsm.getInteger(2);
					id=dsm.getInteger(1);
					id_user = id;
					login_where = "login_agro";
					System.out.println("LoginBean - main - utente trovato, livello: "+dsm.getInteger(2)+ " id: "+dsm.getString(2));
				}else{
					loggedIn=false;
					newLogin=-1;
				}
			
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally{
				try {
					dsm.closeConnection();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}else if(doEnergie ){
					
			
			{
			
				try {
                                    System.out.println("LoginBean - ci sono 22");
               
					dsm = new TDBManager("jdbc/urbandb");
					
					System.out.println("LoginBean - main - connessione aperta");
					
					String sqlString="select livello,id_utente, id_domain " +
								"from utenti "+
								"where userid='guest' and pwd='guest'";
			
					dsm.setPreparedStatementRef(sqlString);
					
					dsm.runPreparedQuery();
					
					
					if(dsm.next()){
						loggedIn=true;
						newLogin=RENEWABLELOGIN;
						livello=dsm.getInteger(1);
						id=dsm.getInteger(2);
						id_user = id;
						id_dominio = RENEWABLELOGIN; //dsm.getInteger(3);
						login_where = "login_renew";
						System.out.println("LoginBean - main - utente trovato, livello: "+dsm.getInteger(1)+ " id: "+dsm.getString(2));
					}else{
						loggedIn=false;
						newLogin=-1;
					}
					
				
				} catch (Exception e) {
		
					e.printStackTrace();
				}finally{
					try {
						dsm.closeConnection();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
			}
		}else{
			loggedIn=false;
			newLogin=-1;
		}
		
		if(loggedIn){
			 msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Benvenuto", "guest"); 
	
			 fcontext.getExternalContext().getSessionMap().put("id", id);
			 fcontext.getExternalContext().getSessionMap().put("username", "guest");
			 fcontext.getExternalContext().getSessionMap().put("livello", livello);

			ConfigurableNavigationHandler nav = (ConfigurableNavigationHandler)
					fcontext.getApplication().getNavigationHandler();
			nav.performNavigation(login_where);
		}else{
			msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Login Error", "Credenziali errate!!!");  
		}
		
		FacesContext.getCurrentInstance().addMessage(null, msg);  
		
		
        context.addCallbackParam("loggedIn", loggedIn);



        if(loggedIn){
        	this.logged=true;
        	this.loggedout=false;
			this.livello = livello;
        	if(livello>=5){
        		this.level5=false;
        		this.noLevel5=true;
				this.adminstatus="block;";
				this.disabledEditBtn = false;
        	}else{
        		this.level5=true;
        		this.noLevel5=false;
				this.adminstatus="none;";
				this.disabledEditBtn = true;
        	}
        	System.out.println("Ecco in uscita: "+this.newLogin);	
        	return ""+this.newLogin;
        }
        System.out.println("Ecco qui dovrei non esserci");
        this.logged=false;
        this.loggedout=false;
        this.newLogin=-1;
        return ""+this.newLogin;
            
            
        }

    /**
	 * login method for guest
	 * @return
     */
        public String logguest(){
            RequestContext context= RequestContext.getCurrentInstance();
		FacesMessage msg = null;
		boolean loggedIn=false;
		int id=-1;
		String login_where = "";
                
                System.out.println("LoginBean - ci sono 11");
               
		TDBManager dsm=null;
		
		
		
		FacesContext fcontext = FacesContext.getCurrentInstance();
		if(!(doIndor || doAgroMeteo || doEnergie 
				|| doMeteo || doUrban)){
			msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Errore", "Selezionare un Dominio prima!");  
			FacesContext.getCurrentInstance().addMessage(null, msg);  
		      this.logged=false;
		        this.loggedout=false;
		        return "-1";
		}else if(doUrban ){
					
			
			{
			
				try {

					System.out.println("LoginBean - ci sono 22");
               
					dsm = new TDBManager("jdbc/urbandb");
					
					System.out.println("LoginBean - main - connessione aperta");

					String sqlString="select livello, id_utente, "+
							"id_domain, ST_X(center), ST_Y(center), zoomlevel " +
							"from utenti "+
							"where userid='guest' and pwd='guest'";


					dsm.setPreparedStatementRef(sqlString);
					
					dsm.runPreparedQuery();
					
					
					if(dsm.next()){
						loggedIn=true;
						newLogin=URBANLOGIN;
						livello=dsm.getInteger(1);
						this.enableAtivateBtn = NONE_STR;
						this.enableAtivateLabel = BLOCK_STR;
						id=dsm.getInteger(2);
						login_where = "login_urban";
						id_dominio = dsm.getInteger(3);


						center_x = dsm.getDouble(4);
						center_y = dsm.getDouble(5);
						zoomfactor = dsm.getDouble(6);

						System.out.println("LoginBean - main - utente trovato, livello: "+dsm.getInteger(1));
					}else{
						loggedIn=false;
						newLogin=-1;
					}
					
				
				} catch (Exception e) {
		
					e.printStackTrace();
				}finally{
					try {
						dsm.closeConnection();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
			}
		}else if(doAgroMeteo && username!=null && password != null){
                    // for old purposes
			try {
			
				dsm = new TDBManager("jdbc/imetnetdb");
			
			
			
				//faccio il controllo
				String strquery="select id_login_table,livello from login_table where userid='guest' and pwd='guest'";
				
				dsm.setPreparedStatementRef(strquery);
				
				dsm.runPreparedQuery();
			
			
				if(dsm.next()){
					loggedIn=true;
					newLogin=AGROMETEOLOGIN;
					livello=dsm.getInteger(2);
					id=dsm.getInteger(1);
					login_where = "login_agro";
					System.out.println("LoginBean - main - utente trovato, livello: "+dsm.getInteger(2));
				}else{
					loggedIn=false;
					newLogin=-1;
				}
			
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally{
				try {
					dsm.closeConnection();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}else if(doEnergie  && username!=null && password != null ){
					
			
			{
			
				try {
                                    System.out.println("LoginBean - ci sono 22");
               
					dsm = new TDBManager("jdbc/urbandb");
					
					System.out.println("LoginBean - main - connessione aperta");
					
					String sqlString="select livello,id_utente, id_domain " +
								"from utenti "+
								"where userid='guest' and pwd='guest'";
			
					dsm.setPreparedStatementRef(sqlString);
					
					dsm.runPreparedQuery();
					
					
					if(dsm.next()){
						loggedIn=true;
						newLogin=RENEWABLELOGIN;
						livello=dsm.getInteger(1);
						id=dsm.getInteger(2);
						id_dominio = RENEWABLELOGIN;
						login_where = "login_renew";
						System.out.println("LoginBean - main - utente trovato, livello: "+dsm.getInteger(1));
					}else{
						loggedIn=false;
						newLogin=-1;
					}
					
				
				} catch (Exception e) {
		
					e.printStackTrace();
				}finally{
					try {
						dsm.closeConnection();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
			}
		}else{
			loggedIn=false;
			newLogin=-1;
		}
		
		if(loggedIn){
			 msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Benvenuto", "guest"); 
	
			 fcontext.getExternalContext().getSessionMap().put("id", id);
			 fcontext.getExternalContext().getSessionMap().put("username", "guest");
			 fcontext.getExternalContext().getSessionMap().put("livello", livello);

			ConfigurableNavigationHandler nav = (ConfigurableNavigationHandler)
					fcontext.getApplication().getNavigationHandler();
			nav.performNavigation(login_where);
		}else{
			msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Login Error", "Credenziali errate!!!");  
		}
		
		FacesContext.getCurrentInstance().addMessage(null, msg);  
		
		
        context.addCallbackParam("loggedIn", loggedIn);  
        
        if(loggedIn){
        	this.logged=true;
        	this.loggedout=false;
        	if(livello>=5){
        		this.level5=false;
        		this.noLevel5=true;
				this.adminstatus="block;";
				this.disabledEditBtn=false;
        	}else{
        		this.level5=true;
        		this.noLevel5=false;
				this.adminstatus="none;";
				this.disabledEditBtn=true;
        	}
        	System.out.println("Ecco in uscita: "+this.newLogin);	
        	return ""+this.newLogin;
        }
        System.out.println("Ecco qui dovrei non esserci");
        this.logged=false;
        this.loggedout=false;
        this.newLogin=-1;
        return ""+this.newLogin;
            
            
        }

    /**
	 * login method
	 * @return
	 */
	public String login(){
		RequestContext context= RequestContext.getCurrentInstance();
		FacesMessage msg = null;
		boolean loggedIn=false;
		int livello=-1,id=-1;
		String login_where = "";
                
                System.out.println("LoginBean - ci sono 11");
               
		TDBManager dsm=null;
		
		
		
		FacesContext fcontext = FacesContext.getCurrentInstance();
		if(!(doIndor || doAgroMeteo || doEnergie 
				|| doMeteo || doUrban)){
			msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Errore", "Selezionare un Dominio prima!");  
			FacesContext.getCurrentInstance().addMessage(null, msg);  
		      this.logged=false;
		        this.loggedout=false;
		        return "-1";
		}else if(doUrban && username!=null && password != null){
					
			
			{
			
				try {
                                    System.out.println("LoginBean - ci sono 22");
               
					dsm = new TDBManager("jdbc/urbandb");
					
					System.out.println("LoginBean - main - connessione aperta");

					String sqlString="select livello, id_utente, "+
							"id_domain, ST_X(center), ST_Y(center), zoomlevel " +
							"from utenti "+
							"where userid=? and pwd=?";

					dsm.setPreparedStatementRef(sqlString);
					dsm.setParameter(ParameterType.STRING, username, 1);
					dsm.setParameter(ParameterType.STRING, password, 2);
					dsm.runPreparedQuery();
					
					
					if(dsm.next()){
						loggedIn=true;
						newLogin=URBANLOGIN;
						livello=dsm.getInteger(1);
						login_where = "login_urban";
						id=dsm.getInteger(2);
						id_dominio = dsm.getInteger(3);

						id_user = id;

						center_x = dsm.getDouble(4);
						center_y = dsm.getDouble(5);
						zoomfactor = dsm.getDouble(6);


						System.out.println("LoginBean - main - utente trovato, livello: "+dsm.getInteger(1));
						System.out.println("LoginBean - center: "+center_x+", "+center_y);
						System.out.println("LoginBean - zoom: "+zoomfactor);

					}else{
						loggedIn=false;
						newLogin=-1;
					}
					
				
				} catch (Exception e) {
		
					e.printStackTrace();
				}finally{
					try {
						dsm.closeConnection();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
			}
		}else if(doAgroMeteo && username!=null && password != null){
			try {
			//for old purposes
				dsm = new TDBManager("jdbc/imetnetdb");
			
			
			
				//faccio il controllo
				String strquery="select id_login_table,livello from login_table where userid=? and pwd=?";
				
				dsm.setPreparedStatementRef(strquery);
				dsm.setParameter(ParameterType.STRING, username, 1);
				dsm.setParameter(ParameterType.STRING, password, 2);
				dsm.runPreparedQuery();
			
			
				if(dsm.next()){
					loggedIn=true;
					newLogin=AGROMETEOLOGIN;
					livello=dsm.getInteger(2);
					id=dsm.getInteger(1);
					id_user = id;
					login_where = "login_agro";
					System.out.println("LoginBean - main - utente trovato, livello: "+dsm.getInteger(2));
				}else{
					loggedIn=false;
					newLogin=-1;
				}
			
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally{
				try {
					dsm.closeConnection();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}else if(doEnergie && username!=null && password != null){
                    try {
                        dsm = new TDBManager("jdbc/urbandb");

                        System.out.println("LoginBean - main - connessione aperta");

                        String sqlString="select livello,id_utente,id_domain " +
                                                "from utenti "+
                                                "where userid=? and pwd=?";

                        dsm.setPreparedStatementRef(sqlString);
                        dsm.setParameter(ParameterType.STRING, username, 1);
                        dsm.setParameter(ParameterType.STRING, password, 2);
                        dsm.runPreparedQuery();


                        if(dsm.next()){
							loggedIn=true;
							newLogin=RENEWABLELOGIN;
							livello=dsm.getInteger(1);
							id=dsm.getInteger(2);
							login_where = "login_renwe";
							id_user = id;
							id_dominio = RENEWABLELOGIN; //dsm.getInteger(3);
							System.out.println("LoginBean - main - utente trovato, livello: "+dsm.getInteger(1));
                        }else{
                                loggedIn=false;
                                newLogin=-1;
                        }


                    } catch (Exception e) {

                            e.printStackTrace();
                    }finally{
                            try {
                                    dsm.closeConnection();
                            } catch (SQLException e) {
                                    e.printStackTrace();
                            }
                    }
				
			
		}else{
			loggedIn=false;
			newLogin=-1;
		}
		
		if(loggedIn){
			 msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Benvenuto", username); 
	
			 fcontext.getExternalContext().getSessionMap().put("id", id);
			 fcontext.getExternalContext().getSessionMap().put("username", username);
			 fcontext.getExternalContext().getSessionMap().put("livello", livello);
			ConfigurableNavigationHandler nav = (ConfigurableNavigationHandler)
					fcontext.getApplication().getNavigationHandler();
			nav.performNavigation(login_where);
			 
		}else{
			msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Login Error", "Credenziali errate!!!");  
		}
		
		FacesContext.getCurrentInstance().addMessage(null, msg);  
		
		
        context.addCallbackParam("loggedIn", loggedIn);

        if(loggedIn){
        	this.logged=true;
        	this.loggedout=false;
                this.livello = livello;
        	if(livello>=5){
        		this.level5=false;
        		this.noLevel5=true;
                this.adminstatus=BLOCK_STR;
				this.enableAtivateBtn = BLOCK_STR;
				this.enableAtivateLabel = NONE_STR;
				this.disabledEditBtn=false;

			}else{
        		this.level5=true;
        		this.noLevel5=false;
				this.enableAtivateBtn = NONE_STR;
				this.enableAtivateLabel = BLOCK_STR;
				this.adminstatus = NONE_STR;
				this.disabledEditBtn=true;
        	}
        		
        	return ""+this.newLogin;
        }
        this.logged=false;
        this.loggedout=false;
        this.newLogin=-1;
        return ""+this.newLogin;
	}
	
	public void doAgroMeteo(){
		
		FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_WARN, "Dominio Selezionato", "AgroMeteo");  
		this.initialized = 1;
		this.doAgroMeteo=true;
		this.doIndor=false;
		this.doMeteo=false;
		this.doUrban=false;
		this.doEnergie=false;
		this.doEnergieURL=ENERGIEURL+GREY;
		this.doAgroMeteoURL=AGROMETEOURL+ORANGE;
		this.doMeteoURL=METEOURL+GREY;
		this.doClimaUrbanoURL=CLIMAURBANOURL+GREY;
		this.doIndoorURL=INDOORURL+GREY;
                
                
		FacesContext.getCurrentInstance().addMessage(null, msg);  
	}
	
	public void doClimaUrbano(){
		FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_WARN, "Dominio Selezionato", "ClimaUrbano");  
		this.initialized = 1;
		this.doAgroMeteo=false;
		this.doIndor=false;
		this.doMeteo=false;
		this.doUrban=true;
		this.doEnergie=false;
		this.doEnergieURL=ENERGIEURL+GREY;
		this.doAgroMeteoURL=AGROMETEOURL+GREY;
		this.doMeteoURL=METEOURL+GREY;
		this.doClimaUrbanoURL=CLIMAURBANOURL+ORANGE;
		this.doIndoorURL=INDOORURL+GREY;
		FacesContext.getCurrentInstance().addMessage(null, msg);  
	}
	
	public void doMeteo(){
		FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_WARN, "Attenzione", "Il Dominio Meteo non  al momento disponibile");
		this.initialized = 1;
		this.doAgroMeteo=false;
		this.doIndor=false;
		this.doMeteo=false;
		this.doUrban=false;
		this.doEnergie=false;
		this.doEnergieURL=ENERGIEURL+GREY;
		this.doAgroMeteoURL=AGROMETEOURL+GREY;
		this.doMeteoURL=METEOURL+GREY;
		this.doClimaUrbanoURL=CLIMAURBANOURL+GREY;
		this.doIndoorURL=INDOORURL+GREY;
		FacesContext.getCurrentInstance().addMessage(null, msg);  
	}
	
	public void doIndoor(){
		FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_WARN, "Attenzione", "Il Dominio Indoor non  al momento disponibile");
		this.initialized = 1;
		this.doAgroMeteo=false;
		this.doIndor=false;
		this.doMeteo=false;
		this.doUrban=false;
		this.doEnergie=false;
		this.doEnergieURL=ENERGIEURL+GREY;
		this.doAgroMeteoURL=AGROMETEOURL+GREY;
		this.doMeteoURL=METEOURL+GREY;
		this.doClimaUrbanoURL=CLIMAURBANOURL+GREY;
		this.doIndoorURL=INDOORURL+GREY;
		FacesContext.getCurrentInstance().addMessage(null, msg);  
	}

	public void doEnergie(){
		FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_WARN, "Dominio Selezionato", "Fonti Rinnovabili");

		this.initialized = 1;
		this.doAgroMeteo=false;
		this.doIndor=false;
		this.doMeteo=false;
		this.doUrban=false;
		this.doEnergie=true;
		this.doEnergieURL=ENERGIEURL+ORANGE;
		this.doAgroMeteoURL=AGROMETEOURL+GREY;
		this.doMeteoURL=METEOURL+GREY;
		this.doClimaUrbanoURL=CLIMAURBANOURL+GREY;
		this.doIndoorURL=INDOORURL+GREY;

		FacesContext.getCurrentInstance().addMessage(null, msg);  
	}
	
	public void logout(){
		
	    this.logged=false;
	    this.loggedout=true;
		this.initialized = -1;
		this.usernamehide= "";
		this.passwordhide = "";
		this.dominiohide = "";
		this.doAgroMeteo = false;
		this.doEnergie = false;
		this.doIndor = false;
		this.doMeteo = false;
		this.doUrban = false;


		FacesMessage msg = null;
		FacesContext fcontext = FacesContext.getCurrentInstance();
		msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Arrivederci","");
		ConfigurableNavigationHandler nav = (ConfigurableNavigationHandler)
				fcontext.getApplication().getNavigationHandler();
		nav.performNavigation("do_output");


	}

}
