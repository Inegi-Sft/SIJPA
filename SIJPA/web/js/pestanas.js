/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function openPestana(btn, pestana) {
    var i, tabcontent, tablinks;

    /* NOTA: Se ante pone la palabra "parent" para que pueda hacer la llamada a ese elemento padre despues de cerrar fancybox,
    ya que este abre un iframe y pierde el elemento del DOM. Si no se le pone la palabra, arroja un null del docuement. 
    Se le puede quitar dicha palabra si solo se manda llamar a la funcion openPestana() de dentro del mismo documento y no 
    desde un iframe */
    
    // Get all elements with class="tabcontent" and hide them
    tabcontent = parent.document.getElementsByClassName("pestanaContent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = parent.document.getElementsByClassName("pestanaLinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    parent.document.getElementById(pestana).style.display = "block";
    parent.document.getElementById(btn).className += " active";
    parent.document.getElementById(btn).disabled=false;
//    evt.currentTarget.className += " active";
}
