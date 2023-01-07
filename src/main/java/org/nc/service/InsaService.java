package org.nc.service;

import java.util.Date;
import java.util.List;

import org.nc.domain.InsaVO;

public interface InsaService {

	public List<InsaVO> ListResult();
	
	public List<InsaVO> ListSearch(Date shDateEnd, Date shDateStart);

	
}
