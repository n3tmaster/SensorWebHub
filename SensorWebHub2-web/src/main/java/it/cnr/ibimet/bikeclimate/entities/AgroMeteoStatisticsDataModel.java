package it.cnr.ibimet.bikeclimate.entities;

import org.primefaces.model.SelectableDataModel;

import javax.faces.model.ListDataModel;
import java.util.List;

public class AgroMeteoStatisticsDataModel extends ListDataModel<AgroMeteoStatistics> implements SelectableDataModel<AgroMeteoStatistics>{

	public AgroMeteoStatisticsDataModel(){
		
	}
	
	public AgroMeteoStatisticsDataModel(List<AgroMeteoStatistics> data){
		super(data);
	}
	@Override
	public AgroMeteoStatistics getRowData(String rowKey) {
		List<AgroMeteoStatistics> zone = (List<AgroMeteoStatistics>) getWrappedData();
		
		for(AgroMeteoStatistics zona : zone){
			String aaa = ""+zona.getIddata();
			if(aaa.equals(rowKey))
				return zona;
		}
		
		return null;
	}

	@Override
	public Object getRowKey(AgroMeteoStatistics zona) {
		
		return zona.getIddata();
	}

}