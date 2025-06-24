 //$(window).load(function() {
 //   new $.popup({                
 //       title       : '',
 //       content: '<a href="https://app.clez.co/index.php?r=campanaactualizar%2Factualizar_tercero_view&id_landing=57&token=a3d1cd083afdbe3ab1242e14f723c3f7" target="_blank"><img src="img/popup_img.jpg" alt="Image" class="pop_img"><h3 id="pop_msg">Free Pass</h3></a><small>Solic&iacute;talo aqu&iacute;</small>', 
	//	html: true,
	//	autoclose   : true,
	//	closeOverlay:true,
	//	closeEsc: true,
	//	buttons     : false,
 //       timeout     : 5000 
 //   });
 //});

$(window).scroll(function () {
    var hT = $('#scroll-to').offset().top,
        hH = $('#scroll-to').outerHeight(),
        wH = $(window).height(),
        wS = $(this).scrollTop();
    console.log((hT - wH), wS);
    if (wS > (hT + hH - wH)) {
        new $.popup({
            title: '',
            //content: '<a href="https://app.clez.co/index.php?r=campanaactualizar%2Factualizar_tercero_view&id_landing=57&token=a3d1cd083afdbe3ab1242e14f723c3f7" target="_blank"><img src="img/freepass-01.png" alt="Image" width="300px" class="pop_img"><h3 id="pop_msg" style="font-weight: 900;">3 D&iacute;as Gratis</h3><small>Solic&iacute;talo aqu&iacute;</small></a>',
            content: '<a href="https://wa.me/573146887259?text=Vengo%20de%20la%20web%2C%20%C2%BFC%C3%B3mo%20obtengo%20mi%20Free%20Pass%20por%20un%20d%C3%ADa%3F" target="_blank"><img src="img/freepass-02.png" alt="Image" width="250px"><h3 id="pop_msg" style="font-weight: 900;">1 D&iacute;a Gratis</h3><small>Solic&iacute;talo aqu&iacute;</small></a>',
            html: true,
            autoclose: true,
            closeOverlay: true,
            closeEsc: true,
            buttons: false,
            timeout: 5000
        });
        $(window).off('scroll')
    }
});