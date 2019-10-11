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
    ArrayList<String[]> lista;
    String sql;
    ResultSet resul;

    /**
     *
     * @return
     */
    public ArrayList findAlfabetismo() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_ALFABETISMO WHERE ALFABETISMO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findAsentHumano() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_ASENTAMIENTO_HUMANO WHERE ASENTAMIENTO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findAutoVinculacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_AUTO_VINCULACION WHERE AUTO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findCalifDelito() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CALIFICACION_DELITO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findClasificacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CLASIFICACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findCodNorma() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CODIGO_NORMA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findConcurso() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CONCURSO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findCondActividad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CONDICION_ACTIVIDAD where CONDICION_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findCondEstudiante() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CONDICION_ESTUDIANTE where CONDICION_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findConsumacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_CONSUMACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findDelNorma() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_DELITOS_NORMA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findDomEspanol() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_DOMINIO_ESPANOL where DOMINIO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findEntidades() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_ENTIDADES where ENTIDAD_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findEdoCivil() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_ESTADO_CIVIL where ESTADO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findEdoPsicoFisico() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_ESTADO_PSICOFISICO where ESTADO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findEtapaProcesal() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_ETAPA_PROCESAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findFormAccion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_FORMA_ACCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findFormComision() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_FORMA_COMISION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findFormConduccion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_FORMA_CONDUCCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findForOrganiza() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_FORMA_ORGANIZA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findFuero() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_FUERO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findGEstudios() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_GRADO_ESTUDIOS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findGParticipacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_GRADO_PARTICIPACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findImpugResolucion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_IMPUGNA_RESOLUCION where IMPUGNA_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findImputabilidad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_IMPUTABILIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findIncompetencia() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_INCOMPETENCIA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findInstrComision() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_INSTRUMENTO_COMISION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findLinguisticas() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_LINGUISTICAS WHERE LINGUISTICA_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMedCautelares() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MEDIDAS_CAUTELARES WHERE CAUTELARES_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMedMujer() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MEDIDAS_MUJER WHERE MUJERES_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMedProteccion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MEDIDAS_PROTECCION WHERE MEDIDAS_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMediosPrueba() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MEDIOS_PRUEBA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findModalidad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MODALIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMulta() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MULTA WHERE MULTA_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMunicipios(int entidad) {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_MUNICIPIOS WHERE ENTIDAD_ID = " + entidad + " ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(2), resul.getString(3)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findNacionalidad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_NACIONALIDAD WHERE NACIONALIDAD_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findNoPrivacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_NOPRIVACION_LIBERTAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findNumero() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_NUMERO WHERE NUMERO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findOcupacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_OCUPACION WHERE OCUPACION_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findPais() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PAIS WHERE PAIS_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findPlazoCierre() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PLAZO_CIERRE ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findPConstitucional() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PLAZO_CONSTITUCIONAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findPrivLibertad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PRIVACION_LIBERTAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findProcedimiento() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PROCEDIMIENTO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findProcAbreviado() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PROC_ABREVIADO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findPIndigena() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_PUEBLO_INDIGENA WHERE PUEBLO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findReincidencia() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_REINCIDENCIA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findRelImputado() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_RELACION_IMPUTADO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findRePDano() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_REPARACION_DANO WHERE REPARACION_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findRepLegal() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_REPRESENTANTE_LEGAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findResidencia() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_RESIDENCIA WHERE RESIDENCIA_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findResSimple() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_RESPUESTA_SIMPLE ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findSexo() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_SEXO WHERE SEXO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findSobreseimiento() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_SOBRESEIMIENTO WHERE SOBRESEIMIENTO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTiempoInterna() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_TIEMPO_INTERNAMIENTO WHERE INTERNAMIENTO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoAudiencias() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_TIPO_AUDIENCIAS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoConsigna() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_TIPO_CONSIGNACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoDefensor() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_TIPO_DEFENSOR ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoDetencion() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_TIPO_DETENCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoImpugna() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_TIPO_IMPUGNACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoResolucion() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_TIPO_RESOLUCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoSobrese() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_TIPO_SOBRESEIMIENTO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findTipoVictima() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_TIPO_VICTIMA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findVialidad() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_VIALIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findVicMoral() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_VICTIMA_MORAL WHERE MORAL_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findVulnera() {
        conn.Conectar();
        lista = new ArrayList<String[]>();
        sql = "SELECT * FROM CATALOGOS_VULNERABILIDAD WHERE VULNERABILIDAD_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

}
