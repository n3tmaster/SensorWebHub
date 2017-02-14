package it.cnr.ibimet.bikeclimate.entities;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.sql.SQLException;

/**
 * Entitche gestisce i parametri
 * @author lerocchi
 *
 */

public class Parametro {
	
	private int id_parametro;
	private String nome_parametro;
	private String descrizione;
	private String sigla;
	private String um;
	private TDBManager tdbm;
	
	
	public Parametro(TDBManager tdbm){
		this.tdbm=tdbm;
		
	}
	/**
	 * versione che recuper tutte le info passando il nome del parametro
	 * @param tdbm
	 * @param nome_parametro
	 * @throws SQLException 
	 */
	public Parametro(TDBManager tdbm, String nome_parametro) throws SQLException{
		this(tdbm);
		this.nome_parametro=nome_parametro;
		
		String strQuery="select id_parametro, nome_parametro, descrizione, sigla, um "+
					"from lista_parametri where nome_parametro=?";
		tdbm.setPreparedStatementRef(strQuery);
		tdbm.setParameter(ParameterType.STRING,this.nome_parametro, 1);
		tdbm.runPreparedQuery();
		
		if(tdbm.next()){
			id_parametro=tdbm.getInteger(1);
			descrizione=tdbm.getString(3);
			sigla=tdbm.getString(4);
			um=tdbm.getString(5);
			
		}
	}
	
	public int getId_parametro() {
		return id_parametro;
	}
	public void setId_parametro(int id_parametro) {
		this.id_parametro = id_parametro;
	}
	public String getNome_parametro() {
		return nome_parametro;
	}
	public void setNome_parametro(String nome_parametro) {
		this.nome_parametro = nome_parametro;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public String getSigla() {
		return sigla;
	}
	public void setSigla(String sigla) {
		this.sigla = sigla;
	}
	public String getUm() {
		return um;
	}
	public void setUm(String um) {
		this.um = um;
	}
	
	
	

}
