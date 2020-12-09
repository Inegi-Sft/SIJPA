/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function() {
    
    //para recuperacion de bd
    if($('#opera').val() === 'actualizar'){
        //muestra todos los botons habilitados
        $('#btn2, #btn3, #btn4').prop('disabled', false);
        $('#guardar').val("Guardar");
        //muestra el apartado de informe segun corresponda
        if($('#funcionJuz').val() === '1'){
            $('#btn5').prop('disabled', false);
        }else if($('#funcionJuz').val() === '2'){
            $('#btn6').prop('disabled', false);
        }else if($('#funcionJuz').val() === '3'){
            $('#btn5, #btn6').prop('disabled', false);
        }
        
        //deshabilita los campos que forman la clave para no ser editado
        $('#numOrgano').prop('readonly', true);
//        $("#entidadJ option:not(:selected)").attr("disabled", true);
        $("#entidadJ, #municipioJ, #funcionJuz").addClass("inactivo");
    }
    
    //para recuperacion de bd
    if($('#fDivision').val() === '1'){
        $('#dRegJudicial').show();
    }else if($('#fDivision').val() === '2'){
        $('#dDistJudicial').show();
    }else if($('#fDivision').val() === '3'){
        $('#dPartJudicial').show();
    }
    
    //obligamos a que el sistema siempre muestre el año aunque sea recuperacion de datos
    var anio = new Date().getFullYear();
    $('#ejercicio').append(new Option(anio, anio));
    $('#ejercicio').val(anio);
    
    //para recuperacion de datos condicionales para mostrar las opciones Informacion General JC o JO, segun sea el caso
    if($('#funcionJuz').val() === '1'){
        $('#btn5').show();
        $('#ejercicioJC').prop('required',true);
    }else if($('#funcionJuz').val() === '2'){
        $('#btn6').show();
        $('#ejercicioJO').prop('required',true);
    }else if($('#funcionJuz').val() === '3'){
        $('#btn5').show();
        $('#btn6').show();
        $('#ejercicioJC').prop('required',true);
        $('#ejercicioJO').prop('required',true);
    }else{
        $('#btn5').hide();
        $('#btn6').hide();
        $('#ejercicioJC').prop('required',false);
        $('#ejercicioJO').prop('required',false);
    }
    
    //muestra descripcion de las causasJC en Informe
    $('#causasPinfoJC').hover(function(){
        $('#divInfoJC').fadeIn();
    }, function(){
        $('#divInfoJC').fadeOut();
    });
    //muestra descripcion de las causasJO en Informe
    $('#causasPinfoJO').hover(function(){
        $('#divInfoJO').fadeIn();
    }, function(){
        $('#divInfoJO').fadeOut();
    });
    
    //valida que no se repita la clave del juzgado
    $('#municipioJ').change(function () {
        var entidad = $('#entidadJ').val();
        var muni = $('#municipioJ').val();
        var num = $('#numOrgano').val();
        var juzgado = entidad + '-' + muni + '-' + num;
        $.ajax({
            url: 'obtenJuzgado',
            type: 'post',
            data: {juzgado: juzgado},
            succes: function (data) {
                console.log('Juzgado ' + data);
            }
        }).done(function (d) {
            console.log('Juzgado Resul ' + d);
            if (d === 1) {
                alert('Juzgado ya registrado, verificar');
                $('#numOrgano').val('');
                $('#entidadJ, #municipioJ').val('');
                openPestana('btn1', 'p1');
            }
        });
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
    
    $("#fDivision").change(function () {
        switch ($("#fDivision").val()) {
            case '1':
                $("#dRegJudicial").fadeIn("slow");
                $("#regJudicial").val("").prop("required", true);
                $("#dDistJudicial,#dPartJudicial").hide();
                $("#distJudicial,#partJudicial").val("-2").prop("required", false);
                break;
            case '2':
                $("#dDistJudicial").fadeIn("slow");
                $("#distJudicial").val("").prop("required", true);
                $("#dRegJudicial,#dPartJudicial").hide();
                $("#regJudicial,#partJudicial").val("-2").prop("required", false);
                break;
            case '3':
                $("#dPartJudicial").fadeIn("slow");
                $("#partJudicial").val("").prop("required", true);
                $("#dRegJudicial,#dDistJudicial").hide();
                $("#regJudicial,#distJudicial").val("-2").prop("required", false);
                break;
            default:
                $("#dRegJudicial,#dDistJudicial,#dPartJudicial").fadeOut("slow");
                $("#regJudicial,#distJudicial,#partJudicial").val("-2").prop("required", false);
                break;
        }
    });
});


function valida(){
    if ($('#nomOrgano').val() === '') {
        openPestana('btn1', 'p1');
    }else if ($('#numOrgano').val() ==='') {
        openPestana('btn1', 'p1');
    }else if ($('#jurisdiccion').val() ==='') {
        openPestana('btn1', 'p1');
    }else if ($('#funcionJuz').val() ==='') {
        openPestana('btn1', 'p1');
    }else if ($('#entidadJ').val() ==='') {
        openPestana('btn2', 'p2');
    }else if ($('#municipioJ').val() ==='') {
        openPestana('btn2', 'p2');
    }else if ($('#fDivision').val() ==='') {
        openPestana('btn2', 'p2');
    }else if($('#regJudicial').val() ===''){
        openPestana('btn2', 'p2');
    }else if($('#distJudicial').val() ===''){
        openPestana('btn2', 'p2');
    }else if($('#partJudicial').val() ===''){
        openPestana('btn2', 'p2');
    }else if ($('#vialidad').val() ==='') {
        openPestana('btn3', 'p3');
    }else if ($('#nomVialidad').val() ==='') {
        openPestana('btn3', 'p3');
    }else if ($('#asentamiento').val() ==='') {
        openPestana('btn3', 'p3');
    }else if ($('#nomAsentamiento').val() ==='') {
        openPestana('btn3', 'p3');
    }else if ($('#nombreCap').val() ==='') {
        openPestana('btn4', 'p4');
    }else if ($('#apaternoCap').val() ==='') {
        openPestana('btn4', 'p4');
    }else if ($('#amaternoCap').val() ==='') {
        openPestana('btn4', 'p4');
    }else if ($('#cargo').val() ==='') {
        openPestana('btn4', 'p4');
    }else if($('#funcionJuz').val() === '1'){
        if($("#btn5").is(":disabled")){
            $('#guardar').val("Guardar");
            openPestana('btn5', 'p5');
            return false;// no envia formulario
        }else{
            var resp = confirm('Una vez guardado el Juzgado no podra ser editado el Numero del organo, Municipio, Entidad y Funcion del organo\n'
                            + 'Seguro que desea continuar?');
            if(!resp){
                return false; //si envia formulario
            }
        }
    }else if($('#funcionJuz').val() === '2'){
        if($("#btn6").is(":disabled")){
            $('#guardar').val("Guardar");
            openPestana('btn6', 'p6');
            return false;// no envia formulario
        }else{
            var resp = confirm('Una vez guardado el Juzgado no podra ser editado el Numero del organo, Municipio, Entidad y Funcion del organo\n'
                            + 'Seguro que desea continuar?');
            if(!resp){
                return false; //si envia formulario
            }
        }
    }else if($('#funcionJuz').val() === '3'){
        if($("#btn5").is(":disabled")){
            openPestana('btn5', 'p5');
            $("#btn5").focus();
            return false;// no envia formulario
        }else if($("#btn6").is(":disabled")){
            $('#guardar').val("Guardar");
            openPestana('btn6', 'p6');
            $("#btn6").focus();
            return false;// no envia formulario
        }else{
            var resp = confirm('Una vez guardado el Juzgado no podra ser editado el Numero del organo, Municipio, Entidad y Funcion del organo\n'
                            + 'Seguro que desea continuar?');
            if(!resp){
                return false; //si envia formulario
            }
        }
    }
}
    
function quitaCeros(elemento){
    var valor = elemento.value.replace(/^0*/, '');
    elemento.value = valor;
} 