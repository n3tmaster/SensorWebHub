package it.cnr.ibimet.bikeclimate.backingbeans;

import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import java.io.InputStream;


@ManagedBean(name="fileBean")
@ViewScoped
public class FileBean {
    private StreamedContent file;
    
    @ManagedProperty(value="#{bikeDataBean}")
	private BikeDataBean bikeDataBean;
	
	
    
	public FileBean() {
        InputStream stream = this.getClass().getResourceAsStream("yourfile.pdf");
        file = new DefaultStreamedContent(stream, "application/pdf",
                          "downloaded_file.pdf");
    }

    public BikeDataBean getBikeDataBean() {
		return bikeDataBean;
	}

	public void setBikeDataBean(BikeDataBean bikeDataBean) {
		this.bikeDataBean = bikeDataBean;
	}

    public StreamedContent getFile() {
         return this.file;
    }

	public void setFile(StreamedContent file) {
		this.file = file;
	}
}
