package com.kh.nullcompany.logo.model.vo;

public class Logo {
	private String logo;
	private String dateLogo;
	
	public Logo() {}

	public Logo(String logo, String dateLogo) {
		super();
		this.logo = logo;
		this.dateLogo = dateLogo;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getDateLogo() {
		return dateLogo;
	}

	public void setDateLogo(String dateLogo) {
		this.dateLogo = dateLogo;
	}

	@Override
	public String toString() {
		return "Logo [logo=" + logo + ", dateLogo=" + dateLogo + "]";
	}

}
