package org.nc.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data

public class InsaVO {

	private String empcd;
	private String EMPNAME;
	private String EMPPHONENUMBER;
	private String EMPEMERGENCYPHONENUMBER;
	private String EMPPOSTCODE;
	private String EMPADRESS;
	private String EMPDETAILADRESS;
	private String EMPEMAIL;
	private Date EMPBIRTHDAY;
	private Date EMPEMPLOYDAY;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date shDateEnd;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date shDateStart;

	
	
}
