/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

import java.util.Calendar;

/**
 *
 * @author ANTONIO.CORIA
 */
public class FechaMax {
    
  Calendar fecha = Calendar.getInstance();
  
  public String FechaValida(){           

    int ano = fecha.get(Calendar.YEAR);
    int mes = fecha.get(Calendar.MONTH)+1;
    int dia = fecha.get(Calendar.DAY_OF_MONTH); 
    String fechas="";
    boolean Ban=false;
    
    if ((dia <10)&&(mes<10)){
      fechas=ano+"-"+"0"+mes+"-"+"0"+dia;
   }else if (mes<10) 
   {
      fechas=ano+"-"+"0"+mes+"-"+dia;
   }else if (dia <10)
   {
       fechas=ano+"-"+mes+"-"+"0"+dia;
   }else
   {
       fechas=ano+"-"+mes+"-"+dia;
   }
      return fechas;    
    }    
  
  public boolean isNumeric(String cadena){
	try {
		Integer.parseInt(cadena);
                return true;
	} catch (NumberFormatException nfe){
		return false;
	}
}
  
}
