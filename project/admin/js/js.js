//#region EXT Ana Komutlar (TimeOut vs.)

//300000
Ext.data.Connection.override({timeout:3e5}) 
Ext.Ajax.timeout=3e5
var ExportYap = function(){Ext.net.Mask.show();Ext.net.Mask.hide.defer(500)}
//id,icon,title,message,url

//#endregion

function PencereGetir(f, d, c, b, e) { var a = new Ext.Window({ id: f, iconCls: d, title: c, closable: false, width: 640, height: 480, shadow: false, resizable: true, renderTo: Ext.getBody(), maximizable: true, minimizable: false, modal: false, layout: "fit", autoLoad: { maskMsg: b, showMask: true, mode: "iframe", url: e, scripts: true }, buttonAlign: "right", buttons: [{ iconCls: "icon-cancel", text: "KAPAT", handler: function () { a.close() } }] }); a.show() }

//#region Anasayfa Renklendirme

var AnasayfaTemplate = '<span style="color:{0};font-weight:{1}">{2}</span>' 
var AnasayfaRenk = function(a){return String.format(AnasayfaTemplate,a=="HAYIR"?"red":"black",a=="HAYIR"?"bold":"normal",a)}

//#endregion

//#region Onay Renklendirme

var OnayTemplate = '<span style="color:{0};font-weight:{1}">{2}</span>'
var OnayRenk = function (a) { return String.format(OnayTemplate, a == "HAYIR" ? "red" : "black", a == "HAYIR" ? "bold" : "normal", a) }

//#endregion

//#region Standart Fonksiyonlar

function SilSTD(a) { Ext.Msg.confirm("Uyarı", "Seçilen Kaydı Sil?", function (b) { if (b == "yes") { Store1.remove(a); Store1.save() } }) } 
function DuzenleSTD(a) { Ext.net.DirectMethods.DM_GuncellemeEkraniGetir(a) } 
function OnayVerSTD(a) { Ext.Msg.confirm("Uyarı", "Seçilen Kaydı Onayla?", function (b) { b == "yes" && Ext.net.DirectMethods.DM_OnayVer(a) }) }
function OnayKaldirSTD(a) { Ext.Msg.confirm("Uyarı", "Seçilen Kaydın Onayını Kaldır?", function (b) { b == "yes" && Ext.net.DirectMethods.DM_OnayKaldir(a) }) }
function SiralaSTD(a) { Ext.net.DirectMethods.DM_SiralamaEkraniGetir(a) }

//#endregion

//#region Diğer Standart Fonksiyonlar

var DilDegistir = function () { Ext.net.DirectMethods.DM_DilDegistir() }
var DosyaGonder = function () { if (!gonderilecek_dosya.validate()) { Ext.Msg.show({ title: "Hata", msg: "Lütfen bir dosya seçiniz.", buttons: Ext.Msg.OK, icon: Ext.Msg.ERROR }); return false } } 
var DosyaBoyutuFormatla = function(a){a.sizeString=String.format(Ext.util.Format.fileSize(a.size));return a}
var IISRESET = function () { Ext.Msg.confirm("Uyarı", "Application Pool u yeniden başlatmak istiyor musunuz?<br/><b>Bu işlem sizin oturumunuzu da sonlandıracaktır.!</b>", function (a) { a == "yes" && Ext.net.DirectMethods.DM_IISRESET() }) }
var SecilenleriSil = function () { Ext.Msg.confirm("Uyarı", "Seçilen Kaydı Sil?", function (b) { if (b == "yes") { Ext.net.DirectMethods.DM_SecilenleriSil() } }) } 

//#endregion