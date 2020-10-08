/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author JONATHAN.AGUIRRE
 */
public class ArchivoSIJPA {
    public void generaArchivoCifrado(String archivo_entrada,String archivo_salida) throws IOException, Exception{
        List<String> archivo_sql = Files.readAllLines(Paths.get(archivo_entrada));
        String sql = String.join("\n", archivo_sql);
        byte[] cifrado = cifra(sql);
        File mi_Archivo = new File(archivo_salida);
        FileUtils.writeByteArrayToFile(mi_Archivo, cifrado);
       
    }
    private byte[] cifra(String sinCifrar) throws Exception {
	final byte[] bytes = sinCifrar.getBytes("UTF-8");
	final Cipher aes = obtieneCipher(true);
	final byte[] cifrado = aes.doFinal(bytes);
	return cifrado;
}
    private Cipher obtieneCipher(boolean paraCifrar) throws Exception {
	final String frase = "DepartamentoDeProcesosDeHomologacionSIJPA2020";
        
        SecretKeyFactory skf = SecretKeyFactory.getInstance("DES");
        DESKeySpec kspec = new DESKeySpec(frase.getBytes());
        SecretKey ks = skf.generateSecret(kspec);

	final Cipher cifrado = Cipher.getInstance("DES");
	if (paraCifrar) {
		cifrado.init(Cipher.ENCRYPT_MODE, ks);
	} else {
		cifrado.init(Cipher.DECRYPT_MODE, ks);
	}

	return cifrado;
    }
    private String descifra(byte[] cifrado) throws Exception {
	final Cipher des = obtieneCipher(false);
	final byte[] bytes = des.doFinal(cifrado);
	final String sinCifrar = new String(bytes, "UTF-8");
	return sinCifrar;
}
    public void extraeArchivo(String archivo_entrada,String archivo_salida) throws IOException, Exception{

                File mi_archivo = new File(archivo_entrada);
                byte[] archivo_byte = FileUtils.readFileToByteArray(mi_archivo);
                BufferedWriter writer = new BufferedWriter(new FileWriter(archivo_salida));
                writer.write(descifra(archivo_byte));
                writer.close();
                
    } 
}
