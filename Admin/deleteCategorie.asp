<%
    If(Len(Session("IdUser")) = 0) Then
		Session("Msg") = "Veuillez vous identifier"
		Response.redirect "connexion.asp"
	End If 
ListId=Request.form("CBID")  

	Set cx=Server.CreateObject("ADODB.Connection")
	cx.Open Application("PC")
	Set Rs = Server.CreateObject("ADODB.RecordSet")

	req="delete from TCATEGORIES where IdCategorie IN (" & ListId & ")"

	'Response.write req
	'Response.end
	rs.Open req , cx, 3,3




if(Len(req) > 0)then
    ON ERROR RESUME NEXT

    cx.execute req

    if(Err.number <> 0)then
        Response.write "Erreur! : " & Err.description
        Response.end
    else
        Response.redirect "form1Categorie.asp" 
    end if
end if

cx.close()
Set cx=Nothing

%>
