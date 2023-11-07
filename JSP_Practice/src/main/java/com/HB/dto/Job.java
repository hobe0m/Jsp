package com.HB.dto;

public class Job {
	private String jobcode;
	private String jobname;
	
	@Override
	public String toString() {
		return jobcode + "/" + jobname;
	}
	
	public String getJobcode() {
		return jobcode;
	}
	public void setJobcode(String jobcode) {
		this.jobcode = jobcode;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
}
