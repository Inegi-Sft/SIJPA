/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

import ConexionDB.Conexion_Mysql;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LUISA.CASTILLO
 */
public class catalogos {

    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String> lista;
    String sql;
    ResultSet resul;

    public ArrayList<String[]> findSexos() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_SEXO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findAlfabetismo() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_ALFABETISMO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findAsentHumano() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_ASENTAMIENTO_HUMANO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findAutoVinculacion() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_AUTO_VINCULACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findCalifDelito() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CALIFICACION_DELITO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findClasificacion() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CLASIFICACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findCodNorma() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CODIGO_NORMA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findConcurso() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CONCURSO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findCondActividad() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CONDICION_ACTIVIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList CondEstudiante() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CONDICION_ESTUDIANTE ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findConsumacion() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CONSUMACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findDelNorma() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_DELITOS_NORMA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2),resul.getString(3)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findDomEspanol() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_DOMINIO_ESPANOL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findEntidades() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_ENTIDADES ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findEdoCivil() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_ESTADO_CIVIL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findEdoPsicoFisico() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_ESTADO_PSICOFISICO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findEtapaProcesal() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_ETAPA_PROCESAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findFormAccion() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_FORMA_ACCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findFormComision() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_FORMA_COMISION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findFormConduccion() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_FORMA_CONDUCCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findForOrganiza() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_FORMA_ORGANIZA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findFuero() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_FUERO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findGEstudios() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_GRADO_ESTUDIOS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findGParticipacion() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_GRADO_PARTICIPACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findImpugResolucion() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_IMPUGNA_RESOLUCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findImputabilidad() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_IMPUTABILIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findIncompetencia() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_INCOMPETENCIA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findInstrComision() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_INSTRUMENTO_COMISION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findLinguisticas() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_linguisticas ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMedCautelares() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MEDIDAS_CAUTELARES ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMedMujer() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MEDIDAS_MUJER ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMedProteccion() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MEDIDAS_PROTECCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMediosPrueba() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MEDIOS_PRUEBA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findModalidad() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MODALIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMulta() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MULTA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMunicipios() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MUNICIPIOS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findNacionalidad() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_NACIONALIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findNoPrivacion() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_NOPRIVACION_LIBERTAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findNumero() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_NUMERO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findOcupacion() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_OCUPACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findPais() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PAIS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findPlazoCierre() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PLAZO_CIERRE ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findPConstitucional() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PLAZO_CONSTITUCIONAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findPrivLibertad() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PRIVACION_LIBERTAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findProcedimiento() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PROCEDIMIENTO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findProcAbreviado() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PROC_ABREVIADO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findPIndigena() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PUEBLO_INDIGENA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findRelImputado() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_RELACION_IMPUTADO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findRePDano() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_REPARACION_DANO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findRepLegal() {
        conn.Conectar();
        ArrayList<String[]> lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_REPRESENTANTE_LEGAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1),resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findResidencia() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_RESIDENCIA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findResSimple() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_RESPUESTA_SIMPLE ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findSexo() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_SEXO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findSobreseimiento() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_SOBRESEIMIENTO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTiempoInterna() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_TIEMPO_INTERNAMIENTO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoAudiencias() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_TIPO_AUDIENCIAS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoConsigna() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_TIPO_CONCIGNACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoDefensor() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_TIPO_DEFENSOR ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoDetencion() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_TIPO_DETENCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoImpugna() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_TIPO_IMPUGNACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoResolucion() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_TIPO_RESOLUCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoSobrese() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_TIPO_SOBRESEIMIENTO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoVictima() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_TIPO_VICTIMA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findVialidad() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_VIALIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findVicMoral() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_VICTIMA_MORAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findVulnera() {
        conn.Conectar();
        lista = new ArrayList<String>();
        sql = "SELECT * FROM CATALOGOS_VULNERABILIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(resul.getString("DESCRIPCION"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

}
