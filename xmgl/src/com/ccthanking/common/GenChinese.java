﻿package com.ccthanking.common;

public class GenChinese {
	
	 private String integerPart;
	  // 小数部分
	  private String floatPart;
	  
	  // 将数字转化为汉字的数组,因为各个实例都要使用所以设为静态
	  private static final char[] cnNumbers={'零','一','二','三','四','五','六','七','八','九'};
	  
	  // 供分级转化的数组,因为各个实例都要使用所以设为静态
	  private static final char[] series={' ','十','百','千','万','十','百','千','亿'};
	  
	  /**
	   * 构造函数,通过它将阿拉伯数字形式的字符串传入
	   * @param original
	   */
	  public GenChinese(String original){ 
	    // 成员变量初始化
	    integerPart="";
	    floatPart="";
	    
	    if(original.contains(".")){
	      // 如果包含小数点
	      int dotIndex=original.indexOf(".");
	      integerPart=original.substring(0,dotIndex);
	      floatPart=original.substring(dotIndex+1);
	    }
	    else{
	      // 不包含小数点
	      integerPart=original;
	    }
	  }
	  
	  /**
	   * 取得大写形式的字符串
	   * @return
	   */
	  public String getCnString(){
	    // 因为是累加所以用StringBuffer
	    StringBuffer sb=new StringBuffer();
	    
	    // 整数部分处理
	    for(int i=0;i<integerPart.length();i++){
	      int number=getNumber(integerPart.charAt(i));
	      
	      sb.append(cnNumbers[number]);
	      sb.append(series[integerPart.length()-1-i]);
	    }
	    
	    // 小数部分处理
	    if(floatPart.length()>0){
	      sb.append("点");
	      for(int i=0;i<floatPart.length();i++){
	        int number=getNumber(floatPart.charAt(i));
	        
	        sb.append(cnNumbers[number]);
	      }
	    }
	    
	    // 返回拼接好的字符串
	    return sb.toString().trim();
	  }
	  
	  /**
	   * 将字符形式的数字转化为整形数字
	   * 因为所有实例都要用到所以用静态修饰
	   * @param c
	   * @return
	   */
	  private static int getNumber(char c){
	    String str=String.valueOf(c);   
	    return Integer.parseInt(str);
	  }
	  
	  /**
	   * @param args
	   */
	  public static void main(String[] args) {
	    System.out.println(new GenChinese("123456789.12345").getCnString());
	    System.out.println(new GenChinese("123456789").getCnString());
	    System.out.println(new GenChinese(".123456789").getCnString());
	    System.out.println(new GenChinese("0.1234").getCnString());
	    System.out.println(new GenChinese("1").getCnString());
	    System.out.println(new GenChinese("12").getCnString());
	    System.out.println(new GenChinese("123").getCnString());
	    System.out.println(new GenChinese("1234").getCnString());
	    System.out.println(new GenChinese("12345").getCnString());
	    System.out.println(new GenChinese("123456").getCnString());
	    System.out.println(new GenChinese("1234567").getCnString());
	    System.out.println(new GenChinese("12345678").getCnString());
	    System.out.println(new GenChinese("123456789").getCnString());
	  }
	} 