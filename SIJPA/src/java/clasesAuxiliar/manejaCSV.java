/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

/**
 *
 * @author JONATHAN.AGUIRRE
 */
public class manejaCSV {
    
    public String[] regresaEncabezado(String archivo){
        String[] encabezado = null;
        if(archivo.toUpperCase().indexOf("AUDIENCIAS") > -1 && archivo.toUpperCase().indexOf("ADJC") > -1 ){
            encabezado = new String[]{"ANIO", "AUDIENCIA_INTERMEDIA", "AUDIENCIA_INVESTIGACION",
                                      "CAUSA_CLAVE", "FECHA_CELEBRACION", "HORAS",
                                      "JUEZ_CLAVE1", "JUEZ_CLAVE2", "JUEZ_CLAVE3",
                                      "JUZGADO_CLAVE", "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID",
                                      "JUZGADO_NUMERO", "MINUTOS"
            };
        }
        if(archivo.toUpperCase().indexOf("AUDIENCIAS") > -1 && archivo.toUpperCase().indexOf("ADJO") > -1 ){
            encabezado = new String[]{"ANIO", "AUDIENCIA_JUICIOORAL", "CAUSA_CLAVEJO",
                                      "FECHA_CELEBRACION", "HORAS", "JUEZ_CLAVE1",
                                      "JUEZ_CLAVE2", "JUEZ_CLAVE3", "JUZGADO_CLAVE",
                                      "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO",
                                      "MINUTOS"
            };
        }
        if(archivo.toUpperCase().indexOf("CAUSAS") > -1 && archivo.toUpperCase().indexOf("ADJC") > -1 ){
            encabezado = new String[]{"ANIO", "CARPETA_INVESTIGA", "CAUSA_CLAVE",
                                      "COMENTARIOS", "COMPETENCIA", "DERIVA_ACCION_PENAL",
                                      "EXPEDIENTE_ACUMULADO", "EXPEDIENTE_REFERENCIA", "FECHA_INGRESO",
                                      "INTEGRACION_CAUSA", "JUEZ_CLAVE", "JUZGADO_CLAVE",
                                      "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
                                      "TIPO_INCOMPETENCIA", "TOTAL_DELITOS", "TOTAL_PROCESADOS",
                                      "TOTAL_VICTIMAS"
            };
        }
        if(archivo.toUpperCase().indexOf("CAUSAS") > -1 && archivo.toUpperCase().indexOf("ADJO") > -1 ){
            encabezado = new String[]{"ANIO", "CANTIDAD_JUECES", "CAUSA_CLAVEJC",
                                      "CAUSA_CLAVEJO", "COMENTARIOS", "FECHA_INGRESOJC",
                                      "FECHA_INGRESOJO", "JUEZ_CLAVE_1", "JUEZ_CLAVE_2",
                                      "JUEZ_CLAVE_3", "JUZGADO_CLAVEJC", "JUZGADO_CLAVEJO",
                                      "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
                                      "TOTAL_DELITOS", "TOTAL_PROCESADOS", "TOTAL_VICTIMAS"
            };
        }
        if(archivo.toUpperCase().indexOf("CONCLUSIONES") > -1 && archivo.toUpperCase().indexOf("ADJC") > -1 ){
            encabezado = new String[]{"ANIO", "CAUSA_CLAVE", "COMENTARIOS",
                                      "EXCLUSION_ACCIONP", "FECHA_ACUERDO", "FECHA_CONCLUSION",
                                      "FECHA_IMPUGNACION", "FECHA_SUSPENCION", "IMPUGNACION",
                                      "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
                                      "MECANISMO_ACUERDO", "MEDIDA_NOPRIVATIVA", "MEDIDA_PRIVATIVA",
                                      "MONTO_REPARA", "PERSONA_IMPUGNA", "PROCEDENCIA_SOBRESEIMIENTO",
                                      "PROCESADO_CLAVE", "REPARACION_DANIO", "TIEMPO_INTERNAMIENTO",
                                      "TIPO_CONCLUSION_PA", "TIPO_IMPUGNACION", "TIPO_REPARACION_DANIO",
                                      "TIPO_RESOLUCION", "TIPO_SOBRESEIMIENTO"
            };
        }
        if(archivo.toUpperCase().indexOf("CONCLUSIONES") > -1 && archivo.toUpperCase().indexOf("ADJO") > -1 ){
            encabezado = new String[]{"ANIO", "CAUSA_CLAVE", "COMENTARIOS",
                                      "EXCLUSION_ACCIONP", "FECHA_ACUERDO", "FECHA_CONCLUSION",
                                      "FECHA_IMPUGNACION", "FECHA_SUSPENCION", "IMPUGNACION",
                                      "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
                                      "MECANISMO_ACUERDO", "MEDIDA_NOPRIVATIVA", "MEDIDA_PRIVATIVA",
                                      "MONTO_REPARA", "PERSONA_IMPUGNA", "PROCEDENCIA_SOBRESEIMIENTO",
                                      "PROCESADO_CLAVE", "REPARACION_DANIO", "TIEMPO_INTERNAMIENTO",
                                      "TIPO_CONCLUSION_PA", "TIPO_IMPUGNACION", "TIPO_REPARACION_DANIO",
                                      "TIPO_RESOLUCION", "TIPO_SOBRESEIMIENTO"
            };
        }
        
        return encabezado;
    }
    
    
    public Boolean encabezadosCorrectos(String archivo){
        Boolean resultado = false;
        
        
        
        return resultado;
    }
    
}
