package it.cnr.ibimet.swhservices.libs;

import it.cnr.ibimet.dbutils.TDBManager;

import java.io.InputStream;
import java.sql.SQLException;

public class BCDBManager extends TDBManager{

	public BCDBManager(String questoDS) throws Exception {
		super(questoDS);
		// TODO Auto-generated constructor stub
	}

	
	public byte[] getBytes(int index) throws SQLException{
	
		
		return dbResultSet.getBytes(index);

	}
	
	
	public InputStream getBinary(int index) throws SQLException{
		return dbResultSet.getBinaryStream(index);
		
	}
   
}
