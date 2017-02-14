package it.cnr.ibimet.bikeclimate.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpURLManager {
	private final String USER_AGENT="Mozilla/5.0";

	private String url;
	
	
	public HttpURLManager() {
		super();
		
	}
	
	public HttpURLManager(String url){
		this();
		this.url=url;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void sendGet() throws Exception{
		URL obj = new URL(url);
		HttpURLConnection con =(HttpURLConnection)obj.openConnection();
		
		
		con.setRequestMethod("GET");
		con.setRequestProperty("User-Agent", USER_AGENT);
		
		int responseCode=con.getResponseCode();
		System.out.println("Invio della roba alla URL: "+url);
		System.out.println("Il ritorno: "+responseCode);
		
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		
		String inputLine;
		StringBuffer response = new StringBuffer();
		
		while((inputLine=in.readLine())!=null){
			response.append(inputLine);
		}
		in.close();
		
		System.out.println(response.toString());
		
	}
	
}
