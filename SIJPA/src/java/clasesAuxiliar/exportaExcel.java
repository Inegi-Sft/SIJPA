/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

import java.util.ArrayList;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

/**
 *
 * @author JONATHAN.AGUIRRE
 */
public class exportaExcel {

    ArrayList<String[]> causasJC;
    ArrayList<String[]> audienciasJC;
    ArrayList<String[]> audienciasJO;
    ArrayList<String[]> causasJO;
    ArrayList<String[]> conclusionesJC;
    ArrayList<String[]> conclusionesJO;
    ArrayList<String[]> suspensionJC;
    ArrayList<String[]> dconclusionesJC;
    ArrayList<String[]> dconclusionesJO;
    ArrayList<String[]> delitosJC;
    ArrayList<String[]> delitosJO;
    ArrayList<String[]> dhomicidioJC;
    ArrayList<String[]> dhomicidioJO;
    ArrayList<String[]> droboJC;
    ArrayList<String[]> droboJO;
    ArrayList<String[]> etapaInicialJC;
    ArrayList<String[]> etapaIntermediaJC;
    ArrayList<String[]> etapaOralJO;
    ArrayList<String[]> datosInformeJC;
    ArrayList<String[]> datosInformeJO;
    ArrayList<String[]> datosJuecesJC;
    ArrayList<String[]> datosJuzgadosJC;
    ArrayList<String[]> datosPdelitosJC;
    ArrayList<String[]> datosPdelitosJO;
    ArrayList<String[]> datosPfuenteIngresosJC;
    ArrayList<String[]> datosPfuenteIngresosJO;
    ArrayList<String[]> datosPmedidasJC;
    ArrayList<String[]> datosPresentaMPJC;
    ArrayList<String[]> datosProcesadosJC;
    ArrayList<String[]> datosProcesadosJO;
    ArrayList<String[]> datosTramitesJC;
    ArrayList<String[]> datosTramitesJO;
    ArrayList<String[]> datosVdelitosJC;
    ArrayList<String[]> datosVdelitosJO;
    ArrayList<String[]> datosVfuenteIngresosJC;
    ArrayList<String[]> datosVfuenteIngresosJO;
    ArrayList<String[]> datosVictimasJC;
    ArrayList<String[]> datosVictimasJO;
    ArrayList<String[]> datosVmedidasJC;
    ArrayList<String[]> datosVmedidasDmujJC;
    ArrayList<String[]> datosVprocesadosJC;
    ArrayList<String[]> datosVprocesadosJO;

    CellStyle mi_estilo;
    SXSSFWorkbook mi_libro;
    showDatos mis_datos;

    public exportaExcel(SXSSFWorkbook libro) {
        CellStyle estilo = libro.createCellStyle();
        Font mi_fuente = libro.createFont();
        mi_fuente.setBold(true);
        estilo.setFont(mi_fuente);
        this.mi_estilo = estilo;
        this.mi_libro = libro;
        showDatos datos = new showDatos();
        this.mis_datos = datos;
    }

    public void exportaTablaAudienciasJC() {
        SXSSFSheet hoja_audienciasJC = this.mi_libro.createSheet("datos_audiencias_adojc");
        String[] metadatos_audienciasJC = new String[]{"ANIO", "AUDIENCIA_INTERMEDIA", "AUDIENCIA_INVESTIGACION",
            "CAUSA_CLAVE", "FECHA_CELEBRACION", "HORAS",
            "JUEZ_CLAVE1", "JUEZ_CLAVE2", "JUEZ_CLAVE3",
            "JUZGADO_CLAVE", "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID",
            "JUZGADO_NUMERO", "MINUTOS"
        };
        audienciasJC = this.mis_datos.findAudienciasJC();
        for (int i = 0; i <= audienciasJC.size(); i++) {
            SXSSFRow mi_registro = hoja_audienciasJC.createRow(i);
            for (int k = 0; k < metadatos_audienciasJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_audienciasJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(audienciasJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaAudienciasJO() {
        SXSSFSheet hoja_audienciasJO = this.mi_libro.createSheet("datos_audiencias_adojo");
        String[] metadatos_audienciasJO = {"ANIO", "AUDIENCIA_JUICIOORAL", "CAUSA_CLAVEJO",
            "FECHA_CELEBRACION", "HORAS", "JUEZ_CLAVE1",
            "JUEZ_CLAVE2", "JUEZ_CLAVE3", "JUZGADO_CLAVE",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO",
            "MINUTOS"
        };
        audienciasJO = this.mis_datos.findAudienciasJO();
        for (int i = 0; i <= audienciasJO.size(); i++) {
            SXSSFRow mi_registro = hoja_audienciasJO.createRow(i);
            for (int k = 0; k < metadatos_audienciasJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_audienciasJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(audienciasJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaCausasPenalesJC() {
        SXSSFSheet hoja_causasPenalesJC = this.mi_libro.createSheet("datos_causas_penales_adojc");
        String[] metadatos_causasPenalesJC = {"ANIO", "CARPETA_INVESTIGA", "CAUSA_CLAVE",
            "COMENTARIOS", "COMPETENCIA", "DERIVA_ACCION_PENAL",
            "EXPEDIENTE_ACUMULADO", "EXPEDIENTE_REFERENCIA", "FECHA_INGRESO",
            "INTEGRACION_CAUSA", "JUEZ_CLAVE", "JUZGADO_CLAVE",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "TIPO_INCOMPETENCIA", "TOTAL_DELITOS", "TOTAL_PROCESADOS",
            "TOTAL_VICTIMAS"
        };
        causasJC = this.mis_datos.findCausasPenalesJC();
        for (int i = 0; i <= causasJC.size(); i++) {
            SXSSFRow mi_registro = hoja_causasPenalesJC.createRow(i);
            for (int k = 0; k < metadatos_causasPenalesJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_causasPenalesJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(causasJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaCausasPenalesJO() {
        SXSSFSheet hoja_causasPenalesJO = this.mi_libro.createSheet("datos_causas_penales_adojo");
        String[] metadatos_causasPenalesJO = {"ANIO", "CANTIDAD_JUECES", "CAUSA_CLAVEJC",
            "CAUSA_CLAVEJO", "COMENTARIOS", "FECHA_INGRESOJC",
            "FECHA_INGRESOJO", "JUEZ_CLAVE_1", "JUEZ_CLAVE_2",
            "JUEZ_CLAVE_3", "JUZGADO_CLAVEJC", "JUZGADO_CLAVEJO",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "TOTAL_DELITOS", "TOTAL_PROCESADOS", "TOTAL_VICTIMAS"
        };
        causasJO = this.mis_datos.findCausasPenalesJO();
        for (int i = 0; i <= causasJO.size(); i++) {
            SXSSFRow mi_registro = hoja_causasPenalesJO.createRow(i);
            for (int k = 0; k < metadatos_causasPenalesJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_causasPenalesJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(causasJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaConclusionesJC() {
        SXSSFSheet hoja_conclusionesJC = this.mi_libro.createSheet("datos_conclusiones_adojc");
        String[] metadatos_conclusionesJC = {"ANIO", "CAUSA_CLAVE", "COMENTARIOS",
            "EXCLUSION_ACCIONP", "FECHA_ACUERDO", "FECHA_CONCLUSION",
            "FECHA_IMPUGNACION", "FECHA_SUSPENCION", "IMPUGNACION",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "MECANISMO_ACUERDO", "MEDIDA_NOPRIVATIVA", "MEDIDA_PRIVATIVA",
            "MONTO_REPARA", "PERSONA_IMPUGNA", "PROCEDENCIA_SOBRESEIMIENTO",
            "PROCESADO_CLAVE", "REPARACION_DANIO", "TIEMPO_INTERNAMIENTO",
            "TIPO_CONCLUSION_PA", "TIPO_IMPUGNACION", "TIPO_REPARACION_DANIO",
            "TIPO_RESOLUCION", "TIPO_SOBRESEIMIENTO"
        };
        conclusionesJC = this.mis_datos.findConclusionesJC();
        for (int i = 0; i <= conclusionesJC.size(); i++) {
            SXSSFRow mi_registro = hoja_conclusionesJC.createRow(i);
            for (int k = 0; k < metadatos_conclusionesJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_conclusionesJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(conclusionesJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaConclusionesJO() {
        SXSSFSheet hoja_conclusionesJO = this.mi_libro.createSheet("datos_conclusiones_adojo");
        String[] metadatos_conclusionesJO = {"ANIO", "CAUSA_CLAVEJO", "COMENTARIOS",
            "EXCLUSION_ACCIONP", "FECHA_CONCLUSION", "FECHA_IMPUGNACION",
            "FECHA_SENTENCIA", "IMPUGNACION", "JUZGADO_ENTIDAD_ID",
            "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID", "MEDIDA_NOPRIVATIVA",
            "MEDIDA_PRIVATIVA", "MONTO_REPARA", "PERSONA_IMPUGNA",
            "PROCEDENCIA_SOBRESEIMIENTO", "PROCESADO_CLAVE", "REPARACION_DANIO",
            "TIEMPO_INTERNAMIENTO", "TIPO_IMPUGNACION", "TIPO_REPARACION_DANIO",
            "TIPO_RESOLUCION", "TIPO_SENTENCIA", "TIPO_SOBRESEIMIENTO"
        };
        conclusionesJO = this.mis_datos.findConclusionesJO();
        for (int i = 0; i <= conclusionesJO.size(); i++) {
            SXSSFRow mi_registro = hoja_conclusionesJO.createRow(i);
            for (int k = 0; k < metadatos_conclusionesJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_conclusionesJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(conclusionesJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaSuspensionJC() {
        SXSSFSheet hoja_suspensionJC = this.mi_libro.createSheet("datos_csuspension_adojc");
        String[] metadatos_suspensionJC = {"CAUSA_CLAVE", "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID",
            "JUZGADO_NUMERO_ID", "PROCESADO_CLAVE", "SUSPENSION"
        };
        suspensionJC = this.mis_datos.findSuspensionJC();
        for (int i = 0; i <= suspensionJC.size(); i++) {
            SXSSFRow mi_registro = hoja_suspensionJC.createRow(i);
            for (int k = 0; k < metadatos_suspensionJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_suspensionJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(suspensionJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaDconclusionesJC() {
        SXSSFSheet hoja_DconclusionesJC = this.mi_libro.createSheet("datos_dconclusiones_adojc");
        String[] metadatos_DconclusionesJC = {"ANIO", "CAUSA_CLAVE", "DELITO_CLAVE",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "PROCESADO_CLAVE", "TIPO_CONCLUSION_PA", "TIPO_RESOLUCION"
        };
        dconclusionesJC = this.mis_datos.findDconclusionesJC();
        for (int i = 0; i <= dconclusionesJC.size(); i++) {
            SXSSFRow mi_registro = hoja_DconclusionesJC.createRow(i);
            for (int k = 0; k < metadatos_DconclusionesJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_DconclusionesJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(dconclusionesJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaDconclusionesJO() {
        SXSSFSheet hoja_DconclusionesJO = this.mi_libro.createSheet("datos_dconclusiones_adojo");
        String[] metadatos_DconclusionesJO = {"ANIO", "CAUSA_CLAVEJO", "DELITO_CLAVE",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "PROCESADO_CLAVE", "TIPO_CONCLUSION", "TIPO_SENTENCIA"
        };
        dconclusionesJO = this.mis_datos.findDconclusionesJO();
        for (int i = 0; i <= dconclusionesJO.size(); i++) {
            SXSSFRow mi_registro = hoja_DconclusionesJO.createRow(i);
            for (int k = 0; k < metadatos_DconclusionesJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_DconclusionesJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(dconclusionesJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaDelitosJC() {
        SXSSFSheet hoja_DelitosJC = this.mi_libro.createSheet("datos_delitos_adojc");
        String[] metadatos_DelitosJC = {"ANIO", "ART_CODIGO_PENAL", "CALIFICACION",
            "CAUSA_CLAVE", "CLASIFICACION", "COMENTARIOS",
            "CONCURSO", "DELITO_CLAVE", "DELITO_CODIGO_PENAL",
            "DELITO_NORMA_TECNICA", "DELITO_RECLASIFICADO", "ESPECIFIQUE_SITIO",
            "FECHA_OCURRENCIA", "FECHA_RECLASIFICACION", "FORMA_ACCION",
            "FORMA_COMISION", "GRADO_CONSUMACION", "INSTRUMENTO_COMISION",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "MODALIDAD", "NUMERO_PROCESADOS", "NUMERO_VICTIMAS",
            "OCURRIO_ENTIDAD", "OCURRIO_MUNICIPIO", "SITIO_OCURRENCIA",
            "TIPO_FUERO"
        };
        delitosJC = this.mis_datos.findDelitosJC();
        for (int i = 0; i <= delitosJC.size(); i++) {
            SXSSFRow mi_registro = hoja_DelitosJC.createRow(i);
            for (int k = 0; k < metadatos_DelitosJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_DelitosJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(delitosJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaDelitosJO() {
        SXSSFSheet hoja_DelitosJO = this.mi_libro.createSheet("datos_delitos_adojo");
        String[] metadatos_DelitosJO = {"ANIO", "ART_CODIGO_PENAL", "CALIFICACION",
            "CAUSA_CLAVEJC", "CAUSA_CLAVEJO", "CLASIFICACION",
            "COMENTARIOS", "CONCURSO", "DELITO_CLAVEJC",
            "DELITO_CLAVEJO", "DELITO_CODIGO_PENAL", "DELITO_NORMA_TECNICA",
            "DELITO_RECLASIFICADO", "ESPECIFIQUE_SITIO", "FECHA_OCURRENCIA",
            "FECHA_RECLASIFICACION", "FORMA_ACCION", "FORMA_COMISION",
            "GRADO_CONSUMACION", "INSTRUMENTO_COMISION", "JUZGADO_ENTIDAD_ID",
            "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID", "MODALIDAD",
            "NUMERO_PROCESADOS", "NUMERO_VICTIMAS", "OCURRIO_ENTIDAD",
            "OCURRIO_MUNICIPIO", "SITIO_OCURRENCIA", "TIPO_FUERO"
        };
        delitosJO = this.mis_datos.findDelitosJO();
        for (int i = 0; i <= delitosJO.size(); i++) {
            SXSSFRow mi_registro = hoja_DelitosJO.createRow(i);
            for (int k = 0; k < metadatos_DelitosJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_DelitosJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(delitosJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaDhomicidioJC() {
        SXSSFSheet hoja_DhomicidioJC = this.mi_libro.createSheet("datos_dhomicidio_adojc");
        String[] metadatos_DhomicidioJC = {"ANIO", "CAUSA_CLAVE", "CONTEXTO_SITUACIONAL",
            "DELITO_CLAVE", "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID",
            "JUZGADO_NUMERO_ID"
        };
        dhomicidioJC = this.mis_datos.findDhomicidioJC();
        for (int i = 0; i <= dhomicidioJC.size(); i++) {
            SXSSFRow mi_registro = hoja_DhomicidioJC.createRow(i);
            for (int k = 0; k < metadatos_DhomicidioJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_DhomicidioJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(dhomicidioJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaDhomicidioJO() {
        SXSSFSheet hoja_DhomicidioJO = this.mi_libro.createSheet("datos_dhomicidio_adojo");
        String[] metadatos_DhomicidioJO = {"ANIO", "CAUSA_CLAVEJO", "CONTEXTO_SITUACIONAL",
            "DELITO_CLAVE", "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID",
            "JUZGADO_NUMERO_ID"
        };
        dhomicidioJO = this.mis_datos.findDhomicidioJO();
        for (int i = 0; i <= dhomicidioJO.size(); i++) {
            SXSSFRow mi_registro = hoja_DhomicidioJO.createRow(i);
            for (int k = 0; k < metadatos_DhomicidioJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_DhomicidioJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(dhomicidioJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaDroboJC() {
        SXSSFSheet hoja_DroboJC = this.mi_libro.createSheet("datos_drobo_adojc");
        String[] metadatos_DroboJC = {"ANIO", "CAUSA_CLAVE", "DELITO_CLAVE",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "TIPO_COSA_ROBADA"
        };
        droboJC = this.mis_datos.findDroboJC();
        for (int i = 0; i <= droboJC.size(); i++) {
            SXSSFRow mi_registro = hoja_DroboJC.createRow(i);
            for (int k = 0; k < metadatos_DroboJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_DroboJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(droboJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaDroboJO() {
        SXSSFSheet hoja_DroboJO = this.mi_libro.createSheet("datos_drobo_adojo");
        String[] metadatos_DroboJO = {"ANIO", "CAUSA_CLAVE", "DELITO_CLAVE",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "TIPO_COSA_ROBADA"
        };
        droboJO = this.mis_datos.findDroboJO();
        for (int i = 0; i <= droboJO.size(); i++) {
            SXSSFRow mi_registro = hoja_DroboJO.createRow(i);
            for (int k = 0; k < metadatos_DroboJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_DroboJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(droboJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaEtapaInicialJC() {
        SXSSFSheet hoja_EtapaInicialJC = this.mi_libro.createSheet("datos_etapa_inicial_adojc");
        String[] metadatos_EtapaInicialJC = {"ANIO", "AUDIENCIA_INICIAL", "AUTO_VINCULACION",
            "CAUSA_CLAVE", "CAUSA_SUSPENSION_PROCESO", "COMENTARIOS",
            "CTRL_DETENCION", "DETENCION_LEGAL", "ETAPA",
            "FECHA_CIERRE_INVESTIGACION", "FECHA_DECLARACION", "FECHA_IMPUTACION",
            "FECHA_LIBERTAD", "FECHA_PLAZO_INVESTIGACION", "FECHA_REAPERTURA_PROCESO",
            "FECHA_VINCULACION", "FORMULACION_IMPUTACION", "FORMULO_ACUSACION",
            "IMPUSO_MCAUTELARES", "IMPUTADO_DECLARO", "INVESTIGACION_COMPLEMENTARIA",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "PLAZO_CIERRE_INVESTIGACION", "PLAZO_CONSTITUCIONAL", "PROCESADO_CLAVE",
            "PRORROGA_PLAZO_CIERRE", "REAPERTURA_PROCESO", "SOBRESEIMIENTO_CAUSAP",
            "SOLICITO_REAPERTURA", "SUSPENSION_PROCESO", "TIEMPO_PLAZO"
        };
        etapaInicialJC = this.mis_datos.findEtapaInicialJC();
        for (int i = 0; i <= etapaInicialJC.size(); i++) {
            SXSSFRow mi_registro = hoja_EtapaInicialJC.createRow(i);
            for (int k = 0; k < metadatos_EtapaInicialJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_EtapaInicialJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(etapaInicialJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaEtapaIntermediaJC() {
        SXSSFSheet hoja_EtapaIntermediaJC = this.mi_libro.createSheet("datos_etapa_intermedia_adojc");
        String[] metadatos_EtapaIntermediaJC = {"ACUERDOS_PROBATORIOS", "ANIO", "APERTURA_JUICIO_ORAL",
            "AUDIENCIA_INTERMEDIA", "CAUSA_CLAVE", "COMENTARIOS",
            "DESCUBRIMIENTO_PROBATORIO", "FECHA_AUDIENCIA_INTERMEDIA", "FECHA_CONTESTACION",
            "FECHA_ESCRITO_ACUSACION", "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID",
            "JUZGADO_NUMERO_ID", "PRESENTACION_MPRUEBA", "PRESENTA_MP_ASESOR",
            "PRESENTA_MP_DEFENSA", "PRESENTA_MP_MINISTERIO", "PROCESADO_CLAVE",
            "SEPARACION_ACUSACION"
        };
        etapaIntermediaJC = this.mis_datos.findEtapaIntermediaJC();
        for (int i = 0; i <= etapaIntermediaJC.size(); i++) {
            SXSSFRow mi_registro = hoja_EtapaIntermediaJC.createRow(i);
            for (int k = 0; k < metadatos_EtapaIntermediaJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_EtapaIntermediaJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(etapaIntermediaJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaEtapaOralJO() {
        SXSSFSheet hoja_EtapaOralJO = this.mi_libro.createSheet("datos_etapa_oral_adojo");
        String[] metadatos_EtapaOralJO = {"ANIO", "CAUSA_CLAVEJO", "COMENTARIOS",
            "DELIBERACION", "ETAPA", "FECHA_APERTURA_JUICIOORAL",
            "FECHA_AUDIENCIA_JUICIO", "FECHA_DELIBERACION", "FECHA_REANUDACION",
            "FECHA_RESOLUCION_INCIDENTE", "FECHA_SUSPENCION", "INCIDENTES_AUDIENCIA",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "MEDIDAS_DISCIPLINARIAS", "PD_DECLARACION_ACUSADO", "PD_DOCUMENTAL_MATERIAL",
            "PD_OTRA_PRUEBA", "PD_PERICIAL", "PD_TESTIMONIAL",
            "PROCESADO_CLAVE", "PROMUEVE_INCIDENTE", "SENTIDO_FALLO",
            "SUSPENCION_AUDIENCIA", "TIPO_DISCIPLINARIA"
        };
        etapaOralJO = this.mis_datos.findEtapaOralJO();
        for (int i = 0; i <= etapaOralJO.size(); i++) {
            SXSSFRow mi_registro = hoja_EtapaOralJO.createRow(i);
            for (int k = 0; k < metadatos_EtapaOralJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_EtapaOralJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(etapaOralJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaInformeJC() {
        SXSSFSheet hoja_InformeJC = this.mi_libro.createSheet("datos_informe_adojc");
        String[] metadatos_InformeJC = {"ACTOS_INVESTIGA", "ANIO", "CAUSAS_BAJAS",
            "CAUSAS_PENALES_INGRESADAS", "CAUSAS_TRAMITE", "IMPUGNACION_MP",
            "JUZGADO_CLAVE", "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID",
            "JUZGADO_NUMERO_ID", "MEDIDAS_PROTECCION_ASIG", "ORDENES_JUDICIALES",
            "OTROS", "PROVIDENCIAS_PRECAUTORIAS", "PRUEBA_ANTICIPADA"
        };
        datosInformeJC = this.mis_datos.findInformeJC();
        for (int i = 0; i <= datosInformeJC.size(); i++) {
            SXSSFRow mi_registro = hoja_InformeJC.createRow(i);
            for (int k = 0; k < metadatos_InformeJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_InformeJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosInformeJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaInformeJO() {
        SXSSFSheet hoja_InformeJO = this.mi_libro.createSheet("datos_informe_adojo");
        String[] metadatos_InformeJO = {"ACTOS_INVESTIGA", "ANIO", "CAUSAS_BAJAS",
            "CAUSAS_PENALES_INGRESADAS", "CAUSAS_TRAMITE", "IMPUGNACION_MP",
            "JUZGADO_CLAVE", "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID",
            "JUZGADO_NUMERO_ID", "MEDIDAS_PROTECCION_ASIG", "ORDENES_JUDICIALES",
            "OTROS", "PROVIDENCIAS_PRECAUTORIAS", "PRUEBA_ANTICIPADA"
        };
        datosInformeJO = this.mis_datos.findInformeJO();
        for (int i = 0; i <= datosInformeJO.size(); i++) {
            SXSSFRow mi_registro = hoja_InformeJO.createRow(i);
            for (int k = 0; k < metadatos_InformeJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_InformeJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosInformeJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaJuecesJC() {
        SXSSFSheet hoja_JuecesJC = this.mi_libro.createSheet("datos_jueces_adojc");
        String[] metadatos_JuecesJC = {"ANIO", "APELLIDOM_JUEZ", "APELLIDOP_JUEZ",
            "EDAD", "ESTATUS", "FECHA_GESTION",
            "FUNCION_DESEMPENA", "GRADO_ESTUDIOS", "JUEZ_CLAVE",
            "JUZGADO_CLAVE", "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID",
            "JUZGADO_NUMERO_ID", "NOMBRE_JUEZ", "SEXO"
        };
        datosJuecesJC = this.mis_datos.findJuecesJC();
        for (int i = 0; i <= datosJuecesJC.size(); i++) {
            SXSSFRow mi_registro = hoja_JuecesJC.createRow(i);
            for (int k = 0; k < metadatos_JuecesJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_JuecesJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosJuecesJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaJuzgadosJC() {
        SXSSFSheet hoja_JuzgadosJC = this.mi_libro.createSheet("datos_juzgados_adojc");
        String[] metadatos_JuzgadosJC = {"ANIO", "APELLIDOM_CAP", "APELLIDOP_CAP",
            "ASENTAMIENTO_HUMANO", "CARGO_CAP", "CODIGO_POSTAL",
            "CORREO", "DISTRITO_JUDICIAL", "ENTIDAD",
            "ESTATUS", "FORMA_DIVISION", "JUZGADO_CLAVE",
            "JUZGADO_FUNCION", "JUZGADO_JURISDICCION", "JUZGADO_NOMBRE",
            "JUZGADO_NUMERO", "LADATEL", "MUNICIPIO",
            "NOMBRE_ASENTAMIENTO", "NOMBRE_CAP", "NOMBRE_VIALIDAD",
            "NUMERO_EXT", "NUMERO_INT", "PARTIDO_JUDICIAL",
            "REGION_JUDICIAL", "TIPO_VIALIDAD"
        };
        datosJuzgadosJC = this.mis_datos.findJuzgadosJC();
        for (int i = 0; i <= datosJuzgadosJC.size(); i++) {
            SXSSFRow mi_registro = hoja_JuzgadosJC.createRow(i);
            for (int k = 0; k < metadatos_JuzgadosJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_JuzgadosJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosJuzgadosJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaPdelitosJC() {
        SXSSFSheet hoja_PdelitosJC = this.mi_libro.createSheet("datos_pdelitos_adojc");
        String[] metadatos_PdelitosJC = {"ANIO", "CAUSA_CLAVE", "DELITO_CLAVE",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "NUMERO_VICTIMAS", "PROCESADO_CLAVE"
        };
        datosPdelitosJC = this.mis_datos.findPdelitosJC();
        for (int i = 0; i <= datosPdelitosJC.size(); i++) {
            SXSSFRow mi_registro = hoja_PdelitosJC.createRow(i);
            for (int k = 0; k < metadatos_PdelitosJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_PdelitosJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosPdelitosJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaPdelitosJO() {
        SXSSFSheet hoja_PdelitosJO = this.mi_libro.createSheet("datos_pdelitos_adojo");
        String[] metadatos_PdelitosJO = {"ANIO", "CAUSA_CLAVEJO", "DELITO_CLAVE",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "NUMERO_VICTIMAS", "PROCESADO_CLAVE"
        };
        datosPdelitosJO = this.mis_datos.findPdelitosJO();
        for (int i = 0; i <= datosPdelitosJO.size(); i++) {
            SXSSFRow mi_registro = hoja_PdelitosJO.createRow(i);
            for (int k = 0; k < metadatos_PdelitosJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_PdelitosJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosPdelitosJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaPfuenteIngresosJC() {
        SXSSFSheet hoja_PfuenteIngresosJC = this.mi_libro.createSheet("datos_pfuentes__ingresos_adojc");
        String[] metadatos_PfuenteIngresosJC = {"ANIO", "CAUSA_CLAVE", "INGRESO",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "PROCESADO_CLAVE"
        };
        datosPfuenteIngresosJC = this.mis_datos.findPfuenteIngresoJC();
        for (int i = 0; i <= datosPfuenteIngresosJC.size(); i++) {
            SXSSFRow mi_registro = hoja_PfuenteIngresosJC.createRow(i);
            for (int k = 0; k < metadatos_PfuenteIngresosJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_PfuenteIngresosJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosPfuenteIngresosJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaPfuenteIngresosJO() {
        SXSSFSheet hoja_PfuenteIngresosJO = this.mi_libro.createSheet("datos_pfuentes__ingresos_adojo");
        String[] metadatos_PfuenteIngresosJO = {"ANIO", "CAUSA_CLAVEJO", "INGRESO",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "PROCESADO_CLAVE"
        };
        datosPfuenteIngresosJO = this.mis_datos.findPfuenteIngresoJO();
        for (int i = 0; i <= datosPfuenteIngresosJO.size(); i++) {
            SXSSFRow mi_registro = hoja_PfuenteIngresosJO.createRow(i);
            for (int k = 0; k < metadatos_PfuenteIngresosJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_PfuenteIngresosJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosPfuenteIngresosJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaPmedidasJC() {
        SXSSFSheet hoja_PmedidasJC = this.mi_libro.createSheet("datos_pmedidas_adojc");
        String[] metadatos_PmedidasJC = {"ANIO", "CAUSA_CLAVE", "CAUTELARES",
            "DURACION_MEDIDA", "ESPECIFIQUE", "JUZGADO_ENTIDAD_ID",
            "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID", "PROCESADO_CLAVE",
            "SOLICITA_MEDIDA"
        };
        datosPmedidasJC = this.mis_datos.findPmedidasJC();
        for (int i = 0; i <= datosPmedidasJC.size(); i++) {
            SXSSFRow mi_registro = hoja_PmedidasJC.createRow(i);
            for (int k = 0; k < metadatos_PmedidasJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_PmedidasJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosPmedidasJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaPresentaMPJC() {
        SXSSFSheet hoja_PresentaMPJC = this.mi_libro.createSheet("datos_presenta_mp_adojc");
        String[] metadatos_PresentaMPJC = {"ANIO", "CAUSA_CLAVE", "FIGURA_MPRUEBA",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "MEDIO_PRUEBA", "PROCESADO_CLAVE", "RESOLUCION_PRUEBA"
        };
        datosPresentaMPJC = this.mis_datos.findPresentaMPJC();
        for (int i = 0; i <= datosPresentaMPJC.size(); i++) {
            SXSSFRow mi_registro = hoja_PresentaMPJC.createRow(i);
            for (int k = 0; k < metadatos_PresentaMPJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_PresentaMPJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosPresentaMPJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaProcesadosJC() {
        SXSSFSheet hoja_ProcesadosJC = this.mi_libro.createSheet("datos_procesados_adojc");
        String[] metadatos_ProcesadosJC = {"ALIAS", "ANIO", "A_MATERNO",
            "A_PATERNO", "CAUSA_CLAVE", "COMENTARIOS",
            "CONDICION_ACTIVIDAD", "CONDICION_ALFABETISMO", "CONDICION_ESTUDIANTE",
            "CURP", "DELICTIVO", "DISCAPACIDAD",
            "EDAD_DELITO", "EDAD_INGRESO", "ESTADO_CIVIL",
            "ESTADO_PSICOFISICO", "FAMILIA_LINGUISTICA", "FECHA_NACIMIENTO",
            "FORMA_CONDUCCION", "GRADO_PARTICIPACION", "GRUPO_DELICTIVO",
            "HABLA_ESPANOL", "HABLA_INDIGENA", "INGRESOS",
            "INICIO_IMPUTADO", "INTERPRETE", "JUZGADO_ENTIDAD_ID",
            "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID", "LENGUA_EXTRANJERA",
            "NACIMIENTO_ENTIDAD", "NACIMIENTO_MUNICIPIO", "NACIMIENTO_PAIS",
            "NACIONALIDAD", "NOMBRE", "OCUPACION",
            "PERSONA_RESPONSABLE", "POBLACION_INDIGENA", "PROCESADO_CLAVE",
            "RANGO_INGRESOS", "REINCIDENCIA", "RESIDENCIA_ENTIDAD",
            "RESIDENCIA_MUNICIPIO", "RESIDENCIA_PAIS", "SEXO",
            "TIPO_DEFENSOR", "TIPO_DETENCION", "TIPO_PUEBLO_INDIGENA",
            "ULTIMO_GRADO_ESTUDIOS"
        };
        datosProcesadosJC = this.mis_datos.findProcesadosJC();
        for (int i = 0; i <= datosProcesadosJC.size(); i++) {
            SXSSFRow mi_registro = hoja_ProcesadosJC.createRow(i);
            for (int k = 0; k < metadatos_ProcesadosJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_ProcesadosJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosProcesadosJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaProcesadosJO() {
        SXSSFSheet hoja_ProcesadosJO = this.mi_libro.createSheet("datos_procesados_adojo");
        String[] metadatos_ProcesadosJO = {"ALIAS", "ANIO", "A_MATERNO",
            "A_PATERNO", "CAUSA_CLAVEJC", "CAUSA_CLAVEJO",
            "COMENTARIOS", "CONDICION_ACTIVIDAD", "CONDICION_ALFABETISMO",
            "CONDICION_ESTUDIANTE", "CURP", "DELICTIVO",
            "DISCAPACIDAD", "EDAD_DELITO", "EDAD_INGRESO",
            "ESTADO_CIVIL", "ESTADO_PSICOFISICO", "FAMILIA_LINGUISTICA",
            "FECHA_NACIMIENTO", "GRADO_PARTICIPACION", "GRUPO_DELICTIVO",
            "HABLA_ESPANOL", "HABLA_INDIGENA", "INGRESOS",
            "INTERPRETE", "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID",
            "JUZGADO_NUMERO_ID", "LENGUA_EXTRANJERA", "NACIMIENTO_ENTIDAD",
            "NACIMIENTO_MUNICIPIO", "NACIMIENTO_PAIS", "NACIONALIDAD",
            "NOMBRE", "OCUPACION", "PERSONA_RESPONSABLE",
            "POBLACION_INDIGENA", "PROCESADO_CLAVEJC", "PROCESADO_CLAVEJO",
            "RANGO_INGRESOS", "REINCIDENCIA", "RESIDENCIA_ENTIDAD",
            "RESIDENCIA_MUNICIPIO", "RESIDENCIA_PAIS", "SEXO",
            "TIPO_DEFENSOR", "TIPO_PUEBLO_INDIGENA", "ULTIMO_GRADO_ESTUDIOS"
        };
        datosProcesadosJO = this.mis_datos.findProcesadosJO();
        for (int i = 0; i <= datosProcesadosJO.size(); i++) {
            SXSSFRow mi_registro = hoja_ProcesadosJO.createRow(i);
            for (int k = 0; k < metadatos_ProcesadosJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_ProcesadosJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosProcesadosJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaTramitesJC() {
        SXSSFSheet hoja_TramitesJC = this.mi_libro.createSheet("datos_tramites_adojc");
        String[] metadatos_TramitesJC = {"ANIO", "CAUSA_CLAVE", "ESPECIFIQUE",
            "ESTATUS_INTERMEDIA", "ESTATUS_INVESTIGACION", "ETAPA_PROCESAL",
            "FECHA_ACTO_PROCESAL", "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID",
            "JUZGADO_NUMERO_ID", "PROCESADO_CLAVE"
        };
        datosTramitesJC = this.mis_datos.findTramitesJC();
        for (int i = 0; i <= datosTramitesJC.size(); i++) {
            SXSSFRow mi_registro = hoja_TramitesJC.createRow(i);
            for (int k = 0; k < metadatos_TramitesJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_TramitesJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosTramitesJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaTramitesJO() {
        SXSSFSheet hoja_TramitesJO = this.mi_libro.createSheet("datos_tramites_adojo");
        String[] metadatos_TramitesJO = {"ANIO", "CAUSA_CLAVEJO", "ESPECIFIQUE",
            "ESTATUS", "FECHA_ACTO_PROCESAL", "JUZGADO_ENTIDAD_ID",
            "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID", "PROCESADO_CLAVE"
        };
        datosTramitesJO = this.mis_datos.findTramitesJO();
        for (int i = 0; i <= datosTramitesJO.size(); i++) {
            SXSSFRow mi_registro = hoja_TramitesJO.createRow(i);
            for (int k = 0; k < metadatos_TramitesJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_TramitesJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosTramitesJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaVdelitosJC() {
        SXSSFSheet hoja_VdelitosJC = this.mi_libro.createSheet("datos_vdelitos_adojc");
        String[] metadatos_VdelitosJC = {"ANIO", "CAUSA_CLAVE", "DELITO_CLAVE",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "PROCESADO_CLAVE", "VICTIMA_CLAVE"
        };
        datosVdelitosJC = this.mis_datos.findVdelitosJC();
        for (int i = 0; i <= datosVdelitosJC.size(); i++) {
            SXSSFRow mi_registro = hoja_VdelitosJC.createRow(i);
            for (int k = 0; k < metadatos_VdelitosJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_VdelitosJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosVdelitosJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaVdelitosJO() {
        SXSSFSheet hoja_VdelitosJO = this.mi_libro.createSheet("datos_vdelitos_adojo");
        String[] metadatos_VdelitosJO = {"ANIO", "CAUSA_CLAVEJO", "DELITO_CLAVE",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "PROCESADO_CLAVE", "VICTIMA_CLAVE"
        };
        datosVdelitosJO = this.mis_datos.findVdelitosJO();
        for (int i = 0; i <= datosVdelitosJO.size(); i++) {
            SXSSFRow mi_registro = hoja_VdelitosJO.createRow(i);
            for (int k = 0; k < metadatos_VdelitosJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_VdelitosJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosVdelitosJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaVfuenteIngresosJC() {
        SXSSFSheet hoja_VfuenteIngresosJC = this.mi_libro.createSheet("datos_vfuente_ingresos_adojc");
        String[] metadatos_VfuenteIngresosJC = {"ANIO", "CAUSA_CLAVE", "INGRESO",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "VICTIMA_CLAVE"
        };
        datosVfuenteIngresosJC = this.mis_datos.findVfuentesIngresoJC();
        for (int i = 0; i <= datosVfuenteIngresosJC.size(); i++) {
            SXSSFRow mi_registro = hoja_VfuenteIngresosJC.createRow(i);
            for (int k = 0; k < metadatos_VfuenteIngresosJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_VfuenteIngresosJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosVfuenteIngresosJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaVfuenteIngresosJO() {
        SXSSFSheet hoja_VfuenteIngresosJO = this.mi_libro.createSheet("datos_vfuente_ingresos_adojo");
        String[] metadatos_VfuenteIngresosJO = {"ANIO", "CAUSA_CLAVEJO", "INGRESO",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "VICTIMA_CLAVE"
        };
        datosVfuenteIngresosJO = this.mis_datos.findVFuentesIngresoJO();
        for (int i = 0; i <= datosVfuenteIngresosJO.size(); i++) {
            SXSSFRow mi_registro = hoja_VfuenteIngresosJO.createRow(i);
            for (int k = 0; k < metadatos_VfuenteIngresosJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_VfuenteIngresosJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosVfuenteIngresosJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaVictimasJC() {
        SXSSFSheet hoja_VictimasJC = this.mi_libro.createSheet("datos_victimas_adojc");
        String[] metadatos_VictimasJC = {"ANIO", "ASESOR", "CAUSA_CLAVE",
            "COMENTARIOS", "CONDICION_ALFABETISMO", "CONTO_ASESOR",
            "EDAD", "ESTADO_CIVIL", "FECHA_NACIMIENTO",
            "GRADO_ESTUDIOS", "HABLA_ESPANOL", "HABLA_INDIGENA",
            "INGRESOS", "INTERPRETE", "JUSTIFICA_DELITOS",
            "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID",
            "LENGUA_EXTRANJERA", "LENGUA_INDIGENA", "MEDIDAS_MUJER",
            "MEDIDAS_PROTECCION", "NACIMIENTO_ENTIDAD", "NACIMIENTO_MUNICIPIO",
            "NACIMIENTO_PAIS", "NACIONALIDAD", "OCUPACION",
            "RANGO_INGRESOS", "RESIDENCIA_ENTIDAD", "RESIDENCIA_MUNICIPIO",
            "RESIDENCIA_PAIS", "SEXO", "TIPO_VICTIMA",
            "TIPO_VICTIMA_MORAL", "VICTIMA_CLAVE", "VULNERABILIDAD"
        };
        datosVictimasJC = this.mis_datos.findVictimasJC();
        for (int i = 0; i <= datosVictimasJC.size(); i++) {
            SXSSFRow mi_registro = hoja_VictimasJC.createRow(i);
            for (int k = 0; k < metadatos_VictimasJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_VictimasJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosVictimasJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaVictimasJO() {
        SXSSFSheet hoja_VictimasJO = this.mi_libro.createSheet("datos_victimas_adojo");
        String[] metadatos_VictimasJO = {"ANIO", "ASESOR", "CAUSA_CLAVEJC",
            "CAUSA_CLAVEJO", "COMENTARIOS", "CONDICION_ALFABETISMO",
            "CONTO_ASESOR", "EDAD", "ESTADO_CIVIL",
            "FECHA_NACIMIENTO", "GRADO_ESTUDIOS", "HABLA_ESPANOL",
            "HABLA_INDIGENA", "INGRESOS", "INTERPRETE",
            "JUSTIFICA_DELITOS", "JUZGADO_ENTIDAD_ID", "JUZGADO_MUNICIPIO_ID",
            "JUZGADO_NUMERO_ID", "LENGUA_EXTRANJERA", "LENGUA_INDIGENA",
            "NACIMIENTO_ENTIDAD", "NACIMIENTO_MUNICIPIO", "NACIMIENTO_PAIS",
            "NACIONALIDAD", "OCUPACION", "RANGO_INGRESOS",
            "RESIDENCIA_ENTIDAD", "RESIDENCIA_MUNICIPIO", "RESIDENCIA_PAIS",
            "SEXO", "TIPO_VICTIMA", "TIPO_VICTIMA_MORAL",
            "VICTIMA_CLAVEJC", "VICTIMA_CLAVEJO", "VULNERABILIDAD"
        };
        datosVictimasJO = this.mis_datos.findVictimasJO();
        for (int i = 0; i <= datosVictimasJO.size(); i++) {
            SXSSFRow mi_registro = hoja_VictimasJO.createRow(i);
            for (int k = 0; k < metadatos_VictimasJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_VictimasJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosVictimasJO.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaVmedidasJC() {
        SXSSFSheet hoja_VmedidasJC = this.mi_libro.createSheet("datos_vmedidas_adojc");
        String[] metadatos_VmedidasJC = {"ANIO", "CAUSA_CLAVE", "JUZGADO_ENTIDAD_ID",
            "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID", "TIPO_MEDIDA_PROT",
            "VICTIMA_CLAVE"
        };
        datosVmedidasJC = this.mis_datos.findVmedidasJC();
        for (int i = 0; i <= datosVmedidasJC.size(); i++) {
            SXSSFRow mi_registro = hoja_VmedidasJC.createRow(i);
            for (int k = 0; k < metadatos_VmedidasJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_VmedidasJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosVmedidasJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaVmedidasDmujJC() {
        SXSSFSheet hoja_VmedidasDmujJC = this.mi_libro.createSheet("datos_vmedidas_dmuj_adojc");
        String[] metadatos_VmedidasDmujJC = {"ANIO", "CAUSA_CLAVE", "JUZGADO_ENTIDAD_ID",
            "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID", "TIPO_MEDIDA_MUJER",
            "VICTIMA_CLAVE"
        };
        datosVmedidasDmujJC = this.mis_datos.findVmedidasDmujeresJC();
        for (int i = 0; i <= datosVmedidasDmujJC.size(); i++) {
            SXSSFRow mi_registro = hoja_VmedidasDmujJC.createRow(i);
            for (int k = 0; k < metadatos_VmedidasDmujJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_VmedidasDmujJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosVmedidasDmujJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaVprocesadosJC() {
        SXSSFSheet hoja_VprocesadosJC = this.mi_libro.createSheet("datos_vprocesados_adojc");
        String[] metadatos_VprocesadosJC = {"ANIO", "CAUSA_CLAVE", "JUZGADO_ENTIDAD_ID",
            "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID", "PROCESADO_CLAVE",
            "RELACION", "VICTIMA_CLAVE"
        };
        datosVprocesadosJC = this.mis_datos.findVprocesadosJC();
        for (int i = 0; i <= datosVprocesadosJC.size(); i++) {
            SXSSFRow mi_registro = hoja_VprocesadosJC.createRow(i);
            for (int k = 0; k < metadatos_VprocesadosJC.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_VprocesadosJC[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosVprocesadosJC.get(i - 1)[k]);
                }
            }
        }
    }

    public void exportaTablaVprocesadosJO() {
        SXSSFSheet hoja_VprocesadosJO = this.mi_libro.createSheet("datos_vprocesados_adojo");
        String[] metadatos_VprocesadosJO = {"ANIO", "CAUSA_CLAVEJO", "JUZGADO_ENTIDAD_ID",
            "JUZGADO_MUNICIPIO_ID", "JUZGADO_NUMERO_ID", "PROCESADO_CLAVE",
            "RELACION", "VICTIMA_CLAVE"
        };
        datosVprocesadosJO = this.mis_datos.findVprocesadosJO();
        for (int i = 0; i <= datosVprocesadosJO.size(); i++) {
            SXSSFRow mi_registro = hoja_VprocesadosJO.createRow(i);
            for (int k = 0; k < metadatos_VprocesadosJO.length; k++) {
                if (i == 0) {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellStyle(this.mi_estilo);
                    mi_celda.setCellValue(metadatos_VprocesadosJO[k]);
                } else {
                    SXSSFCell mi_celda = mi_registro.createCell(k);
                    mi_celda.setCellValue(datosVprocesadosJO.get(i - 1)[k]);
                }
            }
        }
    }
}
