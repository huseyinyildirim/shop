//$.holdReady(true);

/*
   * EDIT MY 26.08.2012 13:43 corner scriptinin sadece ie7 ve ie8 taracılarında çalışmasının sağlanması.
   * 
*/
//$.getScript(!$.browser.msie ? "/js/corner.js" : "/js/DD_roundies.js", function () { $.holdReady(false) })
if ($.browser.msie) {
    var ieVersion = parseInt($.browser.version, 10);
    //alert(ieVersion);
    if (ieVersion == 7 || ieVersion == 8) {
       
    }
}

//dropdown vs. yönlendirmek için
function Git(loc) {
    window.location.href = loc;
}

/*
* EDIT MY 26.08.2012 14:26 
*.
..
/* form elemanları ovalleştirme*/
/*if (!$.browser.msie) {
$("#ddl_marka, #btn_geri, #btn_devamet, #recaptcha_response_field, #btn_sepet, #btn_sil, #btn_alisveristamamla, #btn_havale_bildirimi_yap").corner("5px keep");
$(".ovalbuton li a").corner("7px keep");
$("#signin_menu").corner("5px keep");
$("#anamenuler li a").corner("2px top keep");
} else {
DD_roundies.addRule("#ddl_marka, #btn_geri, #btn_devamet, #recaptcha_response_field, #btn_sepet, #btn_sil, #btn_alisveristamamla, #btn_havale_bildirimi_yap", '5px');
DD_roundies.addRule(".ovalbuton li a", '7px');
DD_roundies.addRule("#signin_menu", '5px');
DD_roundies.addRule('#anamenuler li a:hover', '2px 2px 0 0');
}*/
/*if ($.browser.msie) {
    var ieVersion = parseInt($.browser.version, 10);

    if (ieVersion == 7 || ieVersion == 8) {
       // $.getScript("/js/DD_roundies.js");
        $.getScript("/js/DD_roundies.js", function (data, textStatus, jqxhr) {
            console.log(data); //data returned
            console.log(textStatus); //success
            console.log(jqxhr.status); //200
            console.log('Load was performed.');
        });
        DD_roundies.addRule("#ddl_marka, #btn_geri, #btn_devamet, #recaptcha_response_field, #btn_sepet, #btn_sil, #btn_alisveristamamla, #btn_havale_bildirimi_yap", '5px');
        DD_roundies.addRule(".ovalbuton li a", '7px');
        DD_roundies.addRule("#signin_menu", '5px');
        DD_roundies.addRule('#anamenuler li a:hover', '2px 2px 0 0');
    }
}*/

	Cufon.replace('#kategorimenuler li a', { hover: true });
	Cufon.replace('#slogancerceve', { fontWeight: 'normal', color: '#A5A5A5' });
	Cufon.replace('.bloklar .ust .baslik', { fontWeight: 'bold' });
	Cufon.replace('.bloklar .orta #kategorimenusol li a', { fontWeight: 'normal' });
	Cufon.replace('.ortablokbaslik, #ortablokbaslik2', { fontWeight: 'normal' });
	Cufon.replace('.ovalbuton li a', { hover: true });
	Cufon.replace('.slidebaslik, .slidebaslik a, .slideozet, .slideozet a', { fontWeight: 'normal', color: '#FFFFFF', textShadow: '#000000 1px 1px' });

	function YakSondur(a) { a.seekAttention({ paddingTop: 5, paddingBottom: 5, paddingLeft: 5, paddingRight: 5 }); a.focus() }
	MailKontrol = function () { for (var a = arguments[0], c = "1234567890abcdefghijklmnoprstuvyzqwx[].+@-_ABCDEFGHIJKLMNOPRSTUVYZQWX", d = /(@.*@)|(\.\.)|(^\.)|(^@)|(@$)|(\.$)|(@\.)/, e = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,8}|[0-9]{1,3})(\]?)$/, b = 0; b < a.length; b++) if (c.indexOf(a.charAt(b)) < 0) return false; if (!a.match(d) && a.match(e)) return -1 }
	function KucukHarf(a) { !a.val() == "" && a.val(a.val().toLowerCase()) }
	function BuyukHarf(a) { !a.val() == "" && a.val(a.val().toUpperCase()) }
	function SayisalKarakter(a) { if (!a.val() == "") if (!a.val().match(/^[\-0-9\s]+$/g)) { a.val(a.val().replace(/[^\-0-9\s]*/g, "")); } }

	/* twitter giriş*/
	function signInProc(state) {
	    if (state == 'openField') {
	        //alert("open");
	        if (!$.browser.msie) {
	            $(".ovalbuton li a.signin").css({ 'border-top-left-radius': '7px', 'border-top-right-radius': '7px', 'border-bottom-right-radius': '0px', 'border-bottom-left-radius': '0' });
	        }
	        $(".ovalbuton li a.signin").css({ 'padding': '6px 10px 15px 28px', 'background-position': '7px 7px' });
	        $("#signin_menu").css({ 'top': '-12px' });

	    } else  {
	        
	        if (!$.browser.msie) {
	            $(".ovalbuton li a.signin").css({ 'border-top-left-radius': '7px', 'border-top-right-radius': '7px', 'border-bottom-right-radius': '7px', 'border-bottom-left-radius': '7px' });
	        }
	        $(".ovalbuton li a.signin").css({ 'padding': '6px 10px 7px 28px', 'background-position': '7px 7px' });
	        //$("#signin_menu").css({ 'top': '-12px' });

	    }
	} // end signInProc Function

	/* JQuery Dialog Penceresi */
	function GetDialog(div) {
	    $(div).dialog({
	        autoOpen: false,
	        modal: true,
	        width: 900,
	        height: 500,
	        overlay: { opacity: 0.5, background: "black" },
	        dialogClass: "flora"
	    });
	}

	function GetTextJS(a, b) {
	    $.ajax({ type: "POST",
	        url: "/asmx/GetTexts.asmx/GetText",
	        data: "{ID:" + b + "}",
	        contentType: "application/json; charset=utf-8",
	        dataType: "json",
	        beforeSend: function () { },
	        complete: function () { },
	        error: function (b, c, a) { alert(b.status + "\r\n" + c + "\r\n" + a) },
	        success: function (b, c) { c == "success" && $.each(b, function (c, b) { a(JSON.stringify(b).replace(new RegExp('\"', "gm"), '')) }) }
	    })
	}

	$(document).ready(function () {
	    $(".top-login").click(function (e) {

	        $("#user_menu").toggle();
	        $("#signin_menu").toggle();
	        e.preventDefault
	        $(this).addClass("btn-acrive");
	    });
	    $("#signin_menu").mouseup(function () {
	        return false
	    });
	    $(document).mouseup(function (e) {
	        //alert();
	        if ($(e.target).parent("a.signin").length == 0)
	        // signInProc("closeField");
	            $("#signin_menu,#user_menu").hide();
	        $(".top-login").removeClass("btn-acrive");
	    })

	    /* mycarousel */
	    jQuery('#indirimliurunler').jcarousel({
	        scroll: 1,
	        auto: 2,
	        wrap: 'last',
	        initCallback: mycarousel_initCallback
	    });
	    jQuery('#yeniurunler').jcarousel({
	        scroll: 1
	    });
	    jQuery('#encoksatilanurunler').jcarousel({
	        scroll: 1
	    });

	    /* colorbox */
	    $(".urunresim").colorbox({ rel: 'urunresim', iframe: true, innerWidth: 500, innerHeight: 500 });
	    $(".urunvideo").colorbox({ iframe: true, innerWidth: 425, innerHeight: 344 });
	    $(".inline").colorbox({ inline: true, width: "70%", height: "90%", iframe: true });
	    $(".inline2").colorbox({ inline: true, width: "40%", height: "90%", iframe: true });
	    $(".iframe").colorbox({ iframe: true, width: "70%", height: "90%" });

	    $("#click").click(function () {
	        $('#click').css({ "background-color": "#f00", "color": "#fff", "cursor": "inherit" }).text("Open this window again and this message will still be here.");
	        return false;
	    });

	    /* $('#yourSliderId').DDSlider({
	    nextSlide: '.slider_arrow_right',
	    prevSlide: '.slider_arrow_left',
	    selector: '.slider_selector'
	    });*/

        /* Alt kısım sözleşmeleri */
	    GetDialog("#div_satis");
	    GetDialog("#div_garanti");
	    GetDialog("#div_gizlilik");

	    $("#cont_satis").click(function () {
	        $("#div_satis").dialog("open");
	        //Satış sözleşmesini dive basıyoruz
	        GetTextJS(function (a) { $("#div_satis").html(a); }, 236);
	        return false;
	    });

	    $("#cont_garanti").click(function () {
	        $("#div_garanti").dialog("open");
	        return false;
	    });

	    $("#cont_gizlilik").click(function () {
	        $("#div_gizlilik").dialog("open");
	        GetTextJS(function (a) { $("#div_gizlilik").html(a); }, 240);
	        return false;
	    });
	    /* Alt kısım sözleşmeleri */
	});

	/* jcarousel */
	function mycarousel_initCallback(carousel) {
	    // Disable autoscrolling if the user clicks the prev or next button.
	    carousel.buttonNext.bind('click', function () {
	        carousel.startAuto(0);
	    });
	    carousel.buttonPrev.bind('click', function () {
	        carousel.startAuto(0);
	    });
	    // Pause autoscrolling if the user moves with the cursor over the clip.
	    carousel.clip.hover(function () {
	        carousel.stopAuto();
	    }, function () {
	        carousel.startAuto();
	    });
	};

	function coklusec(Val) {
	    var ValChecked = Val.checked;
	    var ValId = Val.id;
	    var frm = document.forms[0];
	    for (i = 0; i < frm.length; i++) {
	        if (this != null) {
	            if (ValId.indexOf('hepsinisec') != -1) {
	                if (ValChecked)
	                    frm.elements[i].checked = true;
	                else
	                    frm.elements[i].checked = false;
	            }
	            else if (ValId.indexOf('secim') != -1) {
	                if (frm.elements[i].checked == false)
	                    frm.elements[1].checked = false;
	            }
	        }
	    }
	}

	$(function () {
	    $('[rel=tipsy]').tipsy({ gravity: 'sw', fade: true });
	    $('[alt=tipsy]').tipsy({ gravity: 'sw', fade: true });
	    $('[alt=tipsyimg]').tipsy({ gravity: 'sw', fade: true, html: true });
	});

	function SadeceRakam(e, allowedchars) {
	    var key = e.charCode == undefined ? e.keyCode : e.charCode; if ((/^[0-9]+$/.test(String.fromCharCode(key))) || key == 0 || key == 13 || isPassKey(key, allowedchars)) { return true; } else { return false; }
	}
	function isPassKey(key, allowedchars) {
	    if (allowedchars != null) { for (var i = 0; i < allowedchars.length; i++) { if (allowedchars[i] == String.fromCharCode(key)) return true; } } return false;
	}
	function SadeceRakamBlur(e, clear) {
	    var nesne = e.target ? e.target : e.srcElement; var val = nesne.value; val = val.replace(/^\s+|\s+$/g, ""); if (clear) val = val.replace(/\s{2,}/g, " "); nesne.value = val;
	}

	/* TC kimlik no kontrol */
	function TCKimlikNoKontrol(a) {
	    if (a.substr(0, 1) == 0 && a.length != 11) {
	        return false;
	    }
	    var i = 9, md = '', mc = '', digit, mr = '';
	    while (digit = a.charAt(--i)) {
	        i % 2 == 0 ? md += digit : mc += digit;
	    }
	    if (((eval(md.split('').join('+')) * 7) - eval(mc.split('').join('+'))) % 10 != parseInt(a.substr(9, 1), 10)) {
	        return false;
	    }
	    for (c = 0; c <= 9; c++) {
	        mr += a.charAt(c);
	    }
	    if (eval(mr.split('').join('+')) % 10 != parseInt(a.substr(10, 1), 10)) {
	        return false;
	    }
	    return true;
	}