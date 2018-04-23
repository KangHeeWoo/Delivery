package com.jhta.delivery.vo;

public class UsePointVo {
   private int use_num;
   private int use_amount;
   private int mem_num;
   private int ord_num;
   public UsePointVo() {}
   public UsePointVo(int use_num, int use_amount, int mem_num, int ord_num) {
      super();
      this.use_num = use_num;
      this.use_amount = use_amount;
      this.mem_num = mem_num;
      this.ord_num = ord_num;
   }
   public int getUse_num() {
      return use_num;
   }
   public void setUse_num(int use_num) {
      this.use_num = use_num;
   }
   public int getUse_amount() {
      return use_amount;
   }
   public void setUse_amount(int use_amount) {
      this.use_amount = use_amount;
   }
   public int getMem_num() {
      return mem_num;
   }
   public void setMem_num(int mem_num) {
      this.mem_num = mem_num;
   }
   public int getOrd_num() {
      return ord_num;
   }
   public void setOrd_num(int ord_num) {
      this.ord_num = ord_num;
   }
   @Override
   public String toString() {
      return "UsePointVo [use_num=" + use_num + ", use_amount=" + use_amount + ", mem_num=" + mem_num + ", ord_num="
            + ord_num + "]";
   }
}