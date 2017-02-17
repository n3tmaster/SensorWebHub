package it.cnr.ibimet.SWHWS;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

public class KMLObject {
	private static final String COORDINATE_NODE = "coordinates";
	private static final String DESCRIPTION_NODE = "description";
	private static final String NAME_NODE = "name";

	private String xmlString, descrTxt, nameTxt, docTxt;



	public KMLObject(String xmlString, String descrTxt, String nameTxt) throws ParserConfigurationException, SAXException, IOException{
		this.xmlString=xmlString;
		this.descrTxt =descrTxt;
		this.nameTxt  =nameTxt;
		this.docTxt = "";


	    performTransformation();
	}

	public static String toString(Document doc) {
		try {
			StringWriter sw = new StringWriter();
			TransformerFactory tf = TransformerFactory.newInstance();
			Transformer transformer = tf.newTransformer();
			transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
			transformer.setOutputProperty(OutputKeys.METHOD, "xml");
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");

			transformer.transform(new DOMSource(doc), new StreamResult(sw));
			return sw.toString();
		} catch (Exception ex) {
			throw new RuntimeException("Error converting to String", ex);
		}
	}

	public String getDocTxt() {
		return docTxt;
	}

	public void setDocTxt(String docTxt) {
		this.docTxt = docTxt;
	}

	public void setLatitudine(List<Double> latitudine) {
		latitudine = latitudine;
	}
	
	public void setLongitudine(List<Double> longitudine) {
		longitudine = longitudine;
	}

	private void performTransformation() throws ParserConfigurationException, SAXException, IOException{

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

		DocumentBuilder builder = factory.newDocumentBuilder();

		Document doc = builder.parse(new InputSource(new ByteArrayInputStream(this.xmlString.getBytes("utf-8"))));
		Node root = doc.getFirstChild();



		boolean continua=true;
		while(continua){
			//controllo se  il nodo delle coordinate

			if(root.getChildNodes().item(0).getNodeName().toString().equalsIgnoreCase(NAME_NODE)){

				root.getChildNodes().item(0).setTextContent(nameTxt);
				root = root.getChildNodes().item(0);
			}else if(root.getChildNodes().item(0).getNodeName().toString().equalsIgnoreCase(DESCRIPTION_NODE)){

				root.getChildNodes().item(0).setTextContent(descrTxt);
				root = root.getChildNodes().item(0);
			}else{
				root= root.getChildNodes().item(0);
			}

			if(!root.hasChildNodes())
				continua=false;
		}

		docTxt =  toString(doc);


	}
}
