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
//import net.lingala.zip4j.core.ZipFile;
//import net.lingala.zip4j.exception.ZipException;
//import net.lingala.zip4j.model.ZipParameters;
//import net.lingala.zip4j.util.Zip4jConstants;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author JONATHAN.AGUIRRE
 */
public class ArchivoSIJPA {

    public void generaArchivoCifrado(String archivo_entrada, String archivo_salida) throws IOException, Exception {
        List<String> archivo_sql = Files.readAllLines(Paths.get(archivo_entrada));
        String sql = String.join("\n", archivo_sql);
        byte[] cifrado = cifra(sql);
        File mi_Archivo = new File(archivo_salida);
        FileUtils.writeByteArrayToFile(mi_Archivo, cifrado);
        /*try {

			ZipFile mi_archivoSalida = new ZipFile(archivo_salida);
			
			//ArrayList mis_archivosAgregar = new ArrayList();
			//mis_archivosAgregar.add(new File(archivo_entrada));
			
			ZipParameters mis_parametros = new ZipParameters();
			mis_parametros.setCompressionMethod(Zip4jConstants.COMP_DEFLATE); // set compression method to deflate compression
			
			// Set the compression level. This value has to be in between 0 to 9
			// Several predefined compression levels are available
			// DEFLATE_LEVEL_FASTEST - Lowest compression level but higher speed of compression
			// DEFLATE_LEVEL_FAST - Low compression level but higher speed of compression
			// DEFLATE_LEVEL_NORMAL - Optimal balance between compression level/speed
			// DEFLATE_LEVEL_MAXIMUM - High compression level with a compromise of speed
			// DEFLATE_LEVEL_ULTRA - Highest compression level but low speed
			mis_parametros.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL); 
			
			// Set the encryption flag to true
			// If this is set to false, then the rest of encryption properties are ignored
			mis_parametros.setEncryptFiles(true);
			
			// Set the encryption method to AES Zip Encryption
			mis_parametros.setEncryptionMethod(Zip4jConstants.ENC_METHOD_AES);
			
			// Set AES Key strength. Key strengths available for AES encryption are:
			// AES_STRENGTH_128 - For both encryption and decryption
			// AES_STRENGTH_192 - For decryption only
			// AES_STRENGTH_256 - For both encryption and decryption
			// Key strength 192 cannot be used for encryption. But if a zip file already has a
			// file encrypted with key strength of 192, then Zip4j can decrypt this file
			mis_parametros.setAesKeyStrength(Zip4jConstants.AES_STRENGTH_256);
			
			// Set password
			mis_parametros.setPassword("SIJPA2020..");
			
			// Now add files to the zip file
			// Note: To add a single file, the method addFile can be used
			// Note: If the zip file already exists and if this zip file is a split file
			// then this method throws an exception as Zip Format Specification does not 
			// allow updating split zip files
			//mi_archivoSalida.addFiles(filesToAdd, parameters);
                        mi_archivoSalida.addFile(new File(archivo_entrada), mis_parametros);
                        
        } catch (ZipException e) {
			e.printStackTrace();
	}*/
    }

    public byte[] cifra(String sinCifrar) throws Exception {
        final byte[] bytes = sinCifrar.getBytes("UTF-8");
        final Cipher aes = obtieneCipher(true);
        final byte[] cifrado = aes.doFinal(bytes);
        return cifrado;
    }

    private Cipher obtieneCipher(boolean paraCifrar) throws Exception {
        final String frase = "DepartamentoDeProcesosDeHomologacionSIJPA2020";
        /*final MessageDigest digest = MessageDigest.getInstance("SHA");
	digest.update(frase.getBytes("UTF-8"));
	final SecretKeySpec key = new SecretKeySpec(digest.digest(), 0, 16, "AES");*/

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

    public String descifra(byte[] cifrado) throws Exception {
        final Cipher des = obtieneCipher(false);
        final byte[] bytes = des.doFinal(cifrado);
        final String sinCifrar = new String(bytes, "UTF-8");
        return sinCifrar;
    }

    public void extraeArchivo(String archivo_entrada, String archivo_salida) throws IOException, Exception {

        File mi_archivo = new File(archivo_entrada);
        byte[] archivo_byte = FileUtils.readFileToByteArray(mi_archivo);
        BufferedWriter writer = new BufferedWriter(new FileWriter(archivo_salida));
        writer.write(descifra(archivo_byte));
        writer.close();
        /*try {
                    ZipFile zipFile = new ZipFile(archivo_entrada);
                    if (zipFile.isEncrypted()) {
                        zipFile.setPassword("SIJPA2020..");
                    }
                    zipFile.extractAll(ruta_salida);
                } catch (ZipException e) {
                    e.printStackTrace();
                }*/

    }
}