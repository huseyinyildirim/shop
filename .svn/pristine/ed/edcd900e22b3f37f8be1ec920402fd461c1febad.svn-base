<%
oran = CSng("2,33")
BSMV = CSng("1,05")
fiyat = CSng("250")

oranlar = oran*BSMV
sonuc = (CSng(oranlar)/(100-oranlar))+1
son_sonuc = fiyat*CSng(sonuc)
yanlis_mantik = fiyat+(fiyat-(fiyat-oranlar))
%>

ORAN : <%=oran%>
<br/>
BSMV : <%=bsmv%>
<br/>
ORAN x BSMV : <%=oranlar%>
<br/>
FÝYAT : <%=fiyat%> YTL
<br/>
DÜZ VE YANLIÞ MANTIK : <%=yanlis_mantik%> YTL
<br/>
GEÇÝLMESÝ GEREKEN : <%=son_sonuc%> YTL
<br/>
ARADAKÝ FARK : <%=son_sonuc-yanlis_mantik%> YTL