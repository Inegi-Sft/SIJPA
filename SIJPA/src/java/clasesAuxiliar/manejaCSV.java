/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

import ConexionDB.Conexion_Mysql;
import java.io.FileReader;
import com.opencsv.*;
import com.opencsv.exceptions.CsvException;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JONATHAN.AGUIRRE
 */
public class manejaCSV {
    Boolean resultado;
    String archivo,tabla;
    CSVReader leerCsv;
    List filas;
    String[] encabezado;
    
    public manejaCSV(String archivo, String tabla){
        this.tabla = tabla;
        this.archivo = archivo;
        try {
            leerCsv = new CSVReader(new FileReader(archivo));
            this.filas = leerCsv.readAll();
            this.encabezado = (String[]) this.filas.get(0);
        } catch (IOException ex) {
            Logger.getLogger(manejaCSV.class.getName()).log(Level.SEVERE, null, ex);
        } catch (CsvException ex) {
            Logger.getLogger(manejaCSV.class.getName()).log(Level.SEVERE, null, ex);
        }
    }  
    
    private Boolean contieneColumna(String[] columnas,String columna){
        Boolean resultadocontiene = false;
        for (int i = 0; i < columnas.length; i++) {
            if(columnas[i].equalsIgnoreCase(columna)){
                resultadocontiene = true;
                break;
            }
        }
        return resultadocontiene;
    }
    
    public Boolean encabezadosCorrectos() throws IOException, CsvException, SQLException{
        ArrayList<String[]> columnas_tabla;
        Conexion_Mysql conn =  new Conexion_Mysql();
        columnas_tabla = conn.obtenerColumnasDeTabla(this.tabla);
        for(int i=0;i<columnas_tabla.size();i++){
            if(contieneColumna(this.encabezado,columnas_tabla.get(i)[0])){
                resultado = true;
            }else{
                resultado = false;
                break;
            }
        }
        conn.close();
        return resultado;
    }
    
    public Boolean importaCSV(){
        Conexion_Mysql conn =  new Conexion_Mysql();
        conn.Conectar();
        Boolean resultado_importacion = false;
        try {
            String encabezado_mayusculas = String.join(", ", this.encabezado).toUpperCase();
            char comillas = '"';
            Statement sentencia = conn.getConexion().createStatement();
            sentencia.execute("LOAD DATA LOCAL INFILE '"+this.archivo.replace("\\", "/")+"' REPLACE INTO TABLE "
            +this.tabla+" FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"+comillas+"'"
                    + " LINES TERMINATED BY '\n' IGNORE 1 LINES ("+encabezado_mayusculas+")");
            resultado_importacion = true;
        } catch (SQLException ex) {
            Logger.getLogger(manejaCSV.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado_importacion;
    }

    public void cerrarArchivo(){
        try {
            this.leerCsv.close();
        } catch (IOException ex) {
            Logger.getLogger(manejaCSV.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static Boolean validaArchivoVacio(String rutaArchivo){
        Boolean archivo_vacio = true;
        File archivo = new File (rutaArchivo);
        try {
            FileReader fr = new FileReader (archivo);
            BufferedReader br = new BufferedReader(fr);
            int lineas = 0;
            while (br.readLine() != null) lineas++;
            br.close();
            if(lineas > 2){
                archivo_vacio = false;
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(manejaCSV.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(manejaCSV.class.getName()).log(Level.SEVERE, null, ex);
        }
        return archivo_vacio;
    }
}
