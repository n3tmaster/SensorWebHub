package it.cnr.ibimet.bikeclimate.entities;

import org.primefaces.model.SelectableDataModel;

import javax.faces.model.ListDataModel;
import java.util.List;

public class AgroDataModel extends ListDataModel<AgroData> implements SelectableDataModel<AgroData>{

	public AgroDataModel(){
		
	}
	
	public AgroDataModel(List<AgroData> data){
		super(data);
	}
	@Override
	public AgroData getRowData(String rowKey) {
		List<AgroData> zone = (List<AgroData>) getWrappedData();
		
		for(AgroData zona : zone){
			String aaa = ""+zona.getId_dato();
			if(aaa.equals(rowKey))
				return zona;
		}
		
		return null;
	}

	@Override
	public Object getRowKey(AgroData zona) {
		
		return zona.getId_dato();
	}

}