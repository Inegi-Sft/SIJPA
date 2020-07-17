/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    
    $('#causasPinfoJC').hover(function(){
        $('#divInfoJC').fadeIn();
    }, function(){
        $('#divInfoJC').fadeOut();
    });
    
    $('#causasPinfoJO').hover(function(){
        $('#divInfoJO').fadeIn();
    }, function(){
        $('#divInfoJO').fadeOut();
    });
    
    $('#funcionJuz').change(function(){
        var numFunc = $(this).val();
        if(numFunc === '1'){
            $('#btn5').fadeIn();
            $('#ejercicioJC').prop('required',true);
            $('#btn6').fadeOut();
            $('#ejercicioJO').prop('required',false);
        }else if(numFunc === '2'){
            $('#btn6').fadeIn();
            $('#ejercicioJO').prop('required',true);
            $('#btn5').fadeOut();
            $('#ejercicioJC').prop('required',false);
        }else if(numFunc === '3'){
            $('#btn5').fadeIn();
            $('#btn6').fadeIn();
            $('#ejercicioJC').prop('required',true);
            $('#ejercicioJO').prop('required',true);
        }else{
            $('#btn5').fadeOut();
            $('#btn6').fadeOut();
             $('#ejercicioJC').prop('required',false);
            $('#ejercicioJO').prop('required',false);
        }
    });
});

function valida(){
    if ($('#nomOrgano').val() === '') {
        alert('Secci\u00F3n Datos Principales: \n\n Llena el campo Nombre Organo Jur\u00EDsdiccional');
    }else if ($('#numOrgano').val() ==='') {
        alert('Secci\u00F3n Datos Principales: \n\n Llena el campo Numero Organo Jur\u00EDsdiccional');
    }else if ($('#jurisdiccion').val() ==='') {
        alert('Secci\u00F3n Datos Principales: \n\n Llena el campo Jurisdicci\u00F3n');
    }else if ($('#correo').val() ==='') {
        alert('Secci\u00F3n Datos Principales: \n\n Llena el campo Correo Organo Jur\u00EDsdiccional o intruduce un correo de forma valida');
    }else if ($('#funcionJuz').val() ==='') {
        alert('Secci\u00F3n Datos Principales: \n\n Llena el campo Funci\u00F3n del organo Jur\u00EDsdiccional');
    }else if ($('#entidadJ').val() ==='') {
        alert('Secci\u00F3n Ubicaci\u00F3n: \n\n Llena el campo Entidad Federativa');
    }else if ($('#municipioJ').val() ==='') {
        alert('Secci\u00F3n Ubicaci\u00F3n: \n\n Llena el campo Municipio o Demarcaci\u00F3n Territorial de la CDMX');
    }else if ($('#fDivision').val() ==='') {
        alert('Secci\u00F3n Ubicaci\u00F3n: \n\n Llena el campo Forma de Divisi\u00F3n');
    }else if($('#regJudicial').val() ===''){
        alert('Secci\u00F3n Ubicaci\u00F3n: \n\n Llena el campo Nombre de la Regi\u00F3n Judicial'); 
    }else if($('#distJudicial').val() ===''){
        alert('Secci\u00F3n Ubicaci\u00F3n: \n\n Llena el campo Nombre del Distrito Judicial');
    }else if($('#partJudicial').val() ===''){
        alert('Secci\u00F3n Ubicaci\u00F3n: \n\n Llena el campo Nombre del Nombre del Partido Judicial');
    }else if ($('#vialidad').val() ==='') {
        alert('Secci\u00F3n Domicilio: \n\n Llena el campo Vialidad');
    }else if ($('#nomVialidad').val() ==='') {
        alert('Secci\u00F3n Domicilio: \n\n Llena el campo Nombre de la Vialidad');
    }else if ($('#asentamiento').val() ==='') {
        alert('Secci\u00F3n Domicilio: \n\n Asentamiento Humano');
    }else if ($('#nomAsentamiento').val() ==='') {
        alert('Secci\u00F3n Domicilio: \n\n Llena el campo Nombre del Asentamiento Humano');
    }else if ($('#nombreCap').val() ==='') {
        alert('Secci\u00F3n Datos del Capturador: \n\n Llena el campo Nombre(s)');
    }else if ($('#apaternoCap').val() ==='') {
        alert('Secci\u00F3n Datos del Capturador: \n\n Llena el campo Apellido Paterno');
    }else if ($('#amaternoCap').val() ==='') {
        alert('Secci\u00F3n Datos del Capturador: \n\n Llena el campo Apellido Materno');
    }else if ($('#cargo').val() ==='') {
        alert('Secci\u00F3n Datos del Capturador: \n\n Llena el campo Cargo');
    }else if ($('#funcionJuz').val() ==='1'){
        if($('#ejercicioJC').val() === ''){
            alert('Secci\u00F3n Informaci\u00F3n General JC: \n\n Llena el campo Ejercicio');
        }
    }else if ($('#funcionJuz').val() ==='2'){
        if($('#ejercicioJO').val() === ''){
            alert('Secci\u00F3n Informaci\u00F3n General JO: \n\n Llena el campo Ejercicio');
        }
    }
    else if ($('#funcionJuz').val() ==='3'){
        if($('#ejercicioJC').val() === ''){
            alert('Secci\u00F3n Informaci\u00F3n General JC: \n\n Llena el campo Ejercicio');
        }
        if($('#ejercicioJO').val() === ''){
            alert('Secci\u00F3n Informaci\u00F3n General JO: \n\n Llena el campo Ejercicio');
        }
    }
}
