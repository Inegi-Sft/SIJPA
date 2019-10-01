/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    // Normal Clicks
    $(function () {
        $('.toggle-nav').click(function () {
            $('body').toggleClass('show-nav');
            return false;
        });
    });
    
    $('.contenedor').click(function(){
        if($('body').hasClass('show-nav')){
            $('body').removeClass('show-nav');
            $('.toggle-nav').toggleClass('open');
        }else{
            
        }
    });

    $('.toggle-nav').click(function () {
        $('.toggle-nav').toggleClass('open');
    });
});