/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function victimaDelito(obj){
    var norma=parseInt($(obj).attr("normaT"));
    var tipoVic= parseInt($("#tipoVictima").val());
    var sexo= $("#sexoV").val();
    
    if(tipoVic===9){//Se valida cuando sea victima 9 para que extraiga correctamente la posicion de la columna de la matriz y no marque error 
        tipoVic=6;// posicion 6 de la matriz (No Identificado)
    }
    
    if(tipoVic==="" || isNaN(tipoVic)){//valida primero seleccionar el tipo de victima
        alert("Seleccione el tipo de victima para poder asignar el delito");
        $("#tipoVictima").focus();
        $(obj).prop("checked", false);
    }else{
        var aplica=arrVicDel[norma][tipoVic];//verifica si se aplica el delito para la victima
        
        if($(obj).is(':checked')){//entra cuando se chequee mas no cuando se deschequee
            
            if(aplica!=='X'){//verifica si se aplica el delito o no
                var msj="Este delito no puede aplicarse al tipo de v\u00EDctima seleccionada. Es unicamente para:<br/> ";
                for(var i=1; i<=6; i++){// verifica a que tipos de victima le aplica el delito
                    if(arrVicDel[norma][i]==='X'){
                        msj+="<br/>* "+arrVicDel[0][i];
                    }
                }
                if((norma>=1 && norma<=28) || (norma>=60 && norma<=62)){//bien juridico 1,2,3,5 forzosamente personas fisicas
                    $(obj).prop("checked", false);
                    alertify.alert('Mensaje Importante', msj);
                    
                }else{// para los demas bienes se les da la opcion de chequear y justificar el delito de acuerdo al tipo de vicitma
                    msj+='<br/><br/>En caso querer seleccionar este delito para este tipo de v\u00EDctima, se debera justificar su inclusi\u00F3n en el siguiente cuadro de texto para su valoraci\u00F3n conducente';
                    msj+='<br/><br/>Justificacion:';
                    //alertify.dialog.buttonFocus = "ok"; // "none", "ok", "cancel"
                    
                    alertify.prompt('Mensaje Importante', msj,'', 
                        function(ev, respuesta){
                            if( respuesta === '' ) { 
                                ev.cancel = true;
                            }else{
                                var justifi = $('#justificaDeli').val();
                                $('#justificaDeli').val(justifi + norma + '.- ' + respuesta + '-@' + '\n');
                                $('#divJustificacion').fadeIn('slow');
                                alertify.success('Justificacion agregada');
                            }
                        },
                        function(){
                            $(obj).prop("checked", false);
                            alertify.error('Cancelado');
                    });
                    $('.ajs-input').attr('placeholder', 'Delito: Justificacion.'); 
                }
            }else if(norma===2 && sexo!=='2'){//validacion para feminicidio
                
                var msj='El delito de Feminicidio unicamente puede aplicarse a Personas F\u00EDsica <b>Mujeres</b>.'
                + '<br/><br/>Da click en OK para asignar automaticamente el sexo del la victima como "Mujer" o presiona Cancelar';
                alertify.confirm('Mensaje Importante', msj, 
                    function(){
                        $('#sexoV').val('2');//asignamos el sexo de mujer y mostramos las medidas de proteccion a mujeres
                        $("#sexoV option:not(:selected)").attr("disabled", true);
                        $('#mujProtect').val('').prop('required', true);
                        $('#mediProtecMuj').fadeIn('slow');
                        $('#MujPro').fadeOut('slow');
                        $('#aplicaMedidaMuj').prop("checked", false);
                        alertify.success('Se asigno el sexo de la victima como "Mujer"');
                },
                    function(){
                        $(obj).prop("checked", false);
                        alertify.error('Cancelado');
                });
            }
        }
        
        // validacion para cuando se deseleccione feminicidio se habiliten los option de sexo
        if(norma===2 && sexo==='2'){
            if(!$(obj).is(':checked')){
                $("#sexoV option:not(:selected)").attr("disabled", false);
            }else {
                $("#sexoV option:not(:selected)").attr("disabled", true);
            }
        }
        
        // Al deseleccionar algun delito, verifica si aun hay mas  con justificacion para que muestre el textarea, si no hay ninguno desaparece 
        if(!$(obj).is(':checked')){
            
            var justifi = $('#justificaDeli').val();
            if(justifi.includes(norma + '.-')){//verifica que el delito deseleccionado tenga alguna justificacion
                
                var iniTxt = justifi.indexOf(norma + '.-');//obtiene el indice de inicio de ese delto dentro del texto 
                var finTxt = justifi.indexOf('-@', iniTxt);//obtiene el indice de fin de ese delito dentro del texto
                finTxt=finTxt+2;
                var linea = justifi.slice(iniTxt, finTxt);//hace un substring para
                var newTexto = justifi.replace(linea+'\n','');
                $('#justificaDeli').val(newTexto);
            }
            
            // si la justificacion esta vacia, ocultamos el campo
            if($('#justificaDeli').val()===''){
                $('#divJustificacion').fadeOut('slow');
            }
        }
    }
}

var arrVicDel=[
    
    ["D","Persona F\u00EDsica","Persona Moral","Sociedad", "Estado", "Otro", "No Identificado"],
    //Bien Juridico 1
    [1,  'X', '-', '-', '-', '-', '-'],
    [2,  'X', '-', '-', '-', '-', '-'],
    [3,  'X', '-', '-', '-', '-', '-'],
    [4,  'X', '-', '-', '-', '-', '-'],
    [5,  'X', '-', '-', '-', '-', '-'],
    //Bien Juridico 2
    [6,  'X', '-', '-', '-', '-', '-'],
    [7,  'X', '-', '-', '-', '-', '-'],
    [8,  'X', '-', '-', '-', '-', '-'],
    [9,  'X', '-', '-', '-', '-', '-'],
    [10, 'X', '-', '-', '-', '-', '-'],
    [11, 'X', '-', '-', '-', '-', '-'],
    [12, 'X', '-', '-', '-', '-', '-'],
    [13, 'X', '-', '-', '-', '-', '-'],
    [14, 'X', '-', '-', '-', '-', '-'],
    [15, 'X', '-', '-', '-', '-', '-'],
    [16, 'X', '-', '-', '-', '-', '-'],
    [17, 'X', '-', '-', '-', '-', '-'],
    //Bien Juridico 3
    [18, 'X', '-', '-', '-', '-', '-'],
    [19, 'X', '-', '-', '-', '-', '-'],
    [20, 'X', '-', '-', '-', '-', '-'],
    [21, 'X', '-', '-', '-', '-', '-'],
    [22, 'X', '-', '-', '-', '-', '-'],
    [23, 'X', '-', '-', '-', '-', '-'],
    [24, 'X', '-', '-', '-', '-', '-'],
    [25, 'X', '-', '-', '-', '-', '-'],
    [26, 'X', '-', '-', '-', '-', '-'],
    [27, 'X', '-', '-', '-', '-', '-'],
    [28, 'X', '-', '-', '-', '-', '-'],
    //Bien Juridico 4
    [29, 'X', 'X', '-', 'X', '-', 'X'],
    [30, 'X', 'X', '-', 'X', '-', 'X'],
    [31, 'X', 'X', '-', '-', '-', '-'],
    [32, 'X', 'X', '-', 'X', '-', 'X'],
    [33, 'X', 'X', '-', 'X', '-', 'X'],
    [34, 'X', '-', '-', '-', '-', '-'],
    [35, 'X', '-', '-', '-', '-', '-'],
    [36, 'X', '-', '-', '-', '-', '-'],
    [37, 'X', 'X', '-', 'X', '-', 'X'],
    [38, 'X', 'X', '-', '-', '-', '-'],
    [39, 'X', 'X', '-', '-', '-', '-'],
    [40, 'X', 'X', '-', '-', '-', '-'],
    [41, 'X', 'X', '-', 'X', '-', 'X'],
    [42, 'X', 'X', '-', 'X', '-', 'X'],
    [43, 'X', 'X', '-', 'X', '-', 'X'],
    [44, 'X', 'X', '-', 'X', '-', 'X'],
    [45, 'X', 'X', '-', 'X', '-', 'X'],
    [46, 'X', 'X', '-', 'X', '-', 'X'],
    [47, '-', 'X', '-', 'X', '-', 'X'],
    [48, '-', 'X', '-', 'X', '-', 'X'],
    [49, '-', 'X', '-', 'X', '-', 'X'],
    [50, '-', 'X', '-', 'X', '-', 'X'],
    [51, '-', 'X', '-', 'X', '-', 'X'],
    [52, 'X', 'X', '-', 'X', '-', 'X'],
    [53, 'X', 'X', '-', 'X', '-', 'X'],
    [54, 'X', 'X', '-', '-', '-', '-'],
    [55, 'X', 'X', '-', '-', '-', '-'],
    [56, 'X', 'X', '-', '-', '-', '-'],
    [57, 'X', 'X', '-', 'X', '-', 'X'],
    [58, 'X', 'X', '-', 'X', '-', 'X'],
    [59, 'X', 'X', '-', 'X', '-', 'X'],
    //Bien Juridico 5
    [60, 'X', '-', '-', '-', '-', '-'],
    [61, 'X', '-', '-', '-', '-', '-'],
    [62, 'X', '-', '-', '-', '-', '-'],
    //Bien Juridico 6
    [63, 'X', '-', '-', '-', '-', '-'],
    [64, 'X', '-', '-', '-', '-', '-'],
    [65, 'X', '-', '-', '-', '-', '-'],
    [66, 'X', '-', '-', '-', '-', '-'],
    [67, 'X', '-', '-', '-', '-', '-'],
    [68, 'X', '-', '-', '-', '-', '-'],
    [69, 'X', '-', '-', '-', '-', '-'],
    [70, 'X', '-', '-', '-', '-', '-'],
    [71, 'X', '-', '-', '-', '-', '-'],
    [72, 'X', '-', '-', '-', '-', '-'],
    [73, 'X', '-', '-', '-', '-', '-'],
    [74, 'X', '-', '-', '-', '-', '-'],
    [75, 'X', '-', '-', '-', '-', '-'],
    [76, 'X', '-', '-', '-', '-', '-'],
    [77, 'X', '-', '-', '-', '-', '-'],
    [78, 'X', '-', '-', '-', '-', '-'],
    //Bien Juridico 7
    [79, '-', '-', 'X', '-', 'X', 'X'],
    [80, '-', '-', 'X', '-', 'X', 'X'],
    [81, '-', '-', 'X', '-', 'X', 'X'],
    [82, '-', '-', 'X', '-', 'X', 'X'],
    [83, '-', '-', 'X', '-', 'X', 'X'],
    [84, '-', '-', 'X', '-', 'X', 'X'],
    [85, '-', '-', 'X', '-', 'X', 'X'],
    [86, '-', '-', 'X', '-', 'X', 'X'],
    [87, '-', '-', 'X', '-', 'X', 'X'],
    [88, '-', '-', 'X', '-', 'X', 'X'],
    [89, '-', '-', 'X', '-', 'X', 'X'],
    [90, '-', '-', 'X', '-', 'X', 'X'],
    [91, '-', '-', 'X', '-', 'X', 'X'],
    [92, '-', '-', 'X', '-', 'X', 'X'],
    [93, '-', '-', 'X', 'X', 'X', 'X'],
    [94, '-', '-', 'X', '-', 'X', 'X'],
    [95, '-', '-', 'X', 'X', 'X', 'X'],
    [96, '-', '-', 'X', 'X', 'X', 'X'],
    [97, '-', '-', 'X', 'X', 'X', 'X'],
    [98, '-', '-', 'X', 'X', 'X', 'X'],
    [99, '-', '-', 'X', 'X', 'X', 'X'],
    [100, '-', '-', 'X', 'X', 'X', 'X'],
    [101, '-', '-', 'X', 'X', 'X', 'X'],
    [102, '-', '-', 'X', 'X', 'X', 'X'],
    [103, '-', '-', 'X', 'X', 'X', 'X'],
    [104, 'X', '-', 'X', 'X', 'X', 'X'],
    //Bien Juridico 8
    [105, 'X', 'X', 'X', 'X', 'X', 'X'],
    [106, 'X', 'X', 'X', 'X', 'X', 'X'],
    [107, 'X', 'X', 'X', 'X', 'X', 'X'],
    [108, '-', '-', 'X', 'X', 'X', 'X'],
    [109, '-', '-', 'X', 'X', 'X', 'X'],
    [110, '-', '-', 'X', 'X', 'X', 'X'],
    [111, '-', '-', 'X', 'X', 'X', 'X'],
    [112, '-', '-', 'X', 'X', 'X', 'X'],
    [113, 'X', 'X', 'X', 'X', 'X', 'X'],
    [114, '-', '-', 'X', 'X', 'X', 'X'],
    [115, '-', '-', 'X', 'X', 'X', 'X'],
    [116, '-', '-', 'X', 'X', 'X', 'X'],
    [117, '-', '-', 'X', 'X', 'X', 'X'],
    [118, 'X', '-', 'X', 'X', 'X', 'X'],
    [119, 'X', 'X', 'X', 'X', 'X', 'X'],
    //Bien Juridico 9
    [120, 'X', '-', '-', '-', '-', '-'],
    [121, 'X', 'X', '-', '-', '-', '-'],
    [122, 'X', 'X', 'X', 'X', '-', 'X'],
    [123, 'X', 'X', 'X', 'X', 'X', 'X'],
    [124, 'X', 'X', 'X', 'X', 'X', 'X'],
    [125, 'X', 'X', 'X', 'X', 'X', 'X'],
    [126, 'X', 'X', 'X', 'X', 'X', 'X'],
    [127, 'X', 'X', 'X', 'X', 'X', 'X'],
    [128, 'X', 'X', 'X', 'X', 'X', 'X'],
    [129, 'X', 'X', 'X', 'X', 'X', 'X'],
    [130, 'X', 'X', 'X', 'X', 'X', 'X'],
    [131, 'X', 'X', 'X', 'X', 'X', 'X'],
    [132, 'X', '-', '-', 'X', '-', 'X'],
    [133, 'X', '-', '-', 'X', '-', 'X'],
    [134, 'X', '-', '-', 'X', '-', 'X'],
    [135, 'X', 'X', '-', 'X', 'X', 'X'],
    [136, 'X', 'X', '-', 'X', '-', 'X'],
    [137, 'X', 'X', '-', 'X', '-', 'X'],
    [138, 'X', '-', 'X', 'X', 'X', 'X'],
    [139, '-', '-', 'X', 'X', 'X', 'X'],
    [140, '-', '-', '-', 'X', 'X', 'X'],
    [141, 'X', '-', '-', '-', '-', '-'],
    [142, 'X', 'X', '-', 'X', 'X', '-'],
    [143, 'X', 'X', '-', 'X', '-', 'X'],
    [144, 'X', 'X', '-', 'X', '-', 'X'],
    [145, 'X', 'X', '-', 'X', '-', 'X'],
    [146, 'X', 'X', '-', 'X', '-', 'X'],
    [147, 'X', 'X', '-', 'X', '-', 'X'],
    [148, 'X', '-', '-', '-', '-', '-'],
    [149, 'X', 'X', 'X', 'X', 'X', 'X']
];

