package com.kh.nullcompany.board.model.vo;

import java.sql.Date;

public class comment {

   
   private int cNo;
   private String cContent;
   private int refBno;
   private String cWriter;
   private Date cCreateDate;
   private Date cModifyDate;
   private String cStatus;
   public comment() {
      super();
      // TODO Auto-generated constructor stub
   }
   public comment(int cNo, String cContent, int refBno, String cWriter, Date cCreateDate, Date cModifyDate,
         String cStatus) {
      super();
      this.cNo = cNo;
      this.cContent = cContent;
      this.refBno = refBno;
      this.cWriter = cWriter;
      this.cCreateDate = cCreateDate;
      this.cModifyDate = cModifyDate;
      this.cStatus = cStatus;
   }
   public int getcNo() {
      return cNo;
   }
   public void setcNo(int cNo) {
      this.cNo = cNo;
   }
   public String getcContent() {
      return cContent;
   }
   public void setcContent(String cContent) {
      this.cContent = cContent;
   }
   public int getRefBno() {
      return refBno;
   }
   public void setRefBno(int refBno) {
      this.refBno = refBno;
   }
   public String getcWriter() {
      return cWriter;
   }
   public void setcWriter(String cWriter) {
      this.cWriter = cWriter;
   }
   public Date getcCreateDate() {
      return cCreateDate;
   }
   public void setcCreateDate(Date cCreateDate) {
      this.cCreateDate = cCreateDate;
   }
   public Date getcModifyDate() {
      return cModifyDate;
   }
   public void setcModifyDate(Date cModifyDate) {
      this.cModifyDate = cModifyDate;
   }
   public String getcStatus() {
      return cStatus;
   }
   public void setcStatus(String cStatus) {
      this.cStatus = cStatus;
   }
   @Override
   public String toString() {
      return "comment [cNo=" + cNo + ", cContent=" + cContent + ", refBno=" + refBno + ", cWriter=" + cWriter
            + ", cCreateDate=" + cCreateDate + ", cModifyDate=" + cModifyDate + ", cStatus=" + cStatus + "]";
   }
   
   
}