package it.cnr.ibimet.swhservices.entities;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class KMLObject {
	private static final String COORDINATE_NODE = "coordinates";
	private String xmlString;
	private List<Double> latitudine;
	private List<Double> longitudine;

	public KMLObject(String xmlString) throws ParserConfigurationException, SAXException, IOException{
		this.xmlString=xmlString;

		this.latitudine=new ArrayList<Double>();
		this.longitudine=new ArrayList<Double>();


	    performTransformation();
	}

	public List<Double> getLatitudine() {
		return latitudine;
	}

	public void setLatitudine(List<Double> latitudine) {
		latitudine = latitudine;
	}

	public List<Double> getLongitudine() {
		return longitudine;
	}
	
	public void setLongitudine(List<Double> longitudine) {
		longitudine = longitudine;
	}
	
	private void performTransformation() throws ParserConfigurationException, SAXException, IOException{
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		
		DocumentBuilder builder = factory.newDocumentBuilder();
		System.out.println("XMLObject: questo xml"+this.xmlString);
		
		Document doc = builder.parse(new InputSource(new ByteArrayInputStream(this.xmlString.getBytes("utf-8"))));
		Node root = doc.getFirstChild();
		System.out.println("KMLObject: lunghezza xml "+root.getChildNodes().getLength());
		
		
		boolean continua=true;
		while(continua){
			//controllo se � il nodo delle coordinate
			
			if(root.getChildNodes().item(0).getNodeName().toString().equalsIgnoreCase(COORDINATE_NODE)){
				Node questeCoordinate = root.getChildNodes().item(0);
				
				StringTokenizer st = new StringTokenizer(questeCoordinate.getTextContent(), " ");
				while(st.hasMoreTokens()){
					StringTokenizer st2 = new StringTokenizer(st.nextToken(),",");
					longitudine.add(Double.parseDouble(st2.nextToken()));
					latitudine.add(Double.parseDouble(st2.nextToken()));
				}
				
				return;
			}else{
				root= root.getChildNodes().item(0);
			}
			
			if(!root.hasChildNodes())
				continua=false;
		}
		System.out.println("KMLObject parsing...errore!!!");
	}
	
}
