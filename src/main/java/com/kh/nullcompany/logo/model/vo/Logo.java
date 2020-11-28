package com.kh.nullcompany.logo.model.vo;

public class Logo {
	private String logo;
	private String dateLogo;
	private String renameLogo;
	private int lNo;
	
	public Logo() {}
	
	public Logo(String logo, String dateLogo, String renameLogo, int lNo) {
		super();
		this.logo = logo;
		this.dateLogo = dateLogo;
		this.renameLogo = renameLogo;
		this.lNo = lNo;
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
	
	

	public String getRenameLogo() {
		return renameLogo;
	}


	public void setRenameLogo(String renameLogo) {
		this.renameLogo = renameLogo;
	}


	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	@Override
	public String toString() {
		return "Logo [logo=" + logo + ", dateLogo=" + dateLogo + ", renameLogo=" + renameLogo + ", lNo=" + lNo + "]";
	}


	
}
