/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

import java.util.ArrayList;

/**
 *
 * @author FERMIN.GOMEZ
 */
public class NumerosRomanos {

    public int nArabigo;
    private String nRomano;
    private int rango;
    ArrayList al = new ArrayList();

    public NumerosRomanos(int inicio, int rango) {
        String unidad;
        String decena;
        for (int i = inicio; i <= rango; i++) {
            int uni;

            int dec;
            if (i >= 10) {
                uni = i % 10;
                dec = i / 10;
            } else {
                uni = i;
                dec = i / 10;
            }
            unidad = "";
            decena = "";
            switch (uni) {
                case 1:
                    unidad = "I";
                    break;
                case 2:
                    unidad = "II";
                    break;
                case 3:
                    unidad = "III";
                    break;
                case 4:
                    unidad = "IV";
                    break;
                case 5:
                    unidad = "V";
                    break;
                case 6:
                    unidad = "VI";
                    break;
                case 7:
                    unidad = "VII";
                    break;
                case 8:
                    unidad = "VIII";
                    break;
                case 9:
                    unidad = "IX";
                    break;
            }
            if (dec > 0) {
                switch (dec) {
                    case 1:
                        decena = "X";
                        break;
                    case 2:
                        decena = "XX";
                        break;
                    case 3:
                        decena = "XXX";
                        break;
                    case 4:
                        decena = "XL";
                        break;
                    case 5:
                        decena = "L";
                        break;
                    case 6:
                        decena = "LX";
                        break;
                    case 7:
                        decena = "LXX";
                        break;
                    case 8:
                        decena = "LXXX";
                        break;
                    case 9:
                        decena = "XC";
                        break;
                }
            } else {
                decena = "";
            }
            nRomano = decena + "" + unidad;
            nArabigo = i;
            al.add(new NumerosRomanos(nArabigo, nRomano));
//                al.add(nArabigo, nRomano);
        }

    }

    public NumerosRomanos(int nArabigo, String nRomano) {
        this.nArabigo = nArabigo;
        this.nRomano = nRomano;
    }

    public ArrayList<NumerosRomanos> getNumerosRomanos() {
        ArrayList<NumerosRomanos> lista = al;
        return lista;
    }

    public int getnArabigo() {
        return nArabigo;
    }

    @Override
    public String toString() {
        if (nArabigo > 0) {
            return "(" + nArabigo + ") - " + nRomano;
        } else {
            return nRomano;
        }
    }
}
