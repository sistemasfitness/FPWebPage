<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="EncontrarFuentePago.aspx.cs" Inherits="WebPage.EncontrarFuentePago" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Prueba Payment Sources</title>
    <style>
        .console {
            width: 100%;
            height: 400px;
            font-family: monospace;
            background: #000;
            color: #0f0;
            padding: 10px;
            overflow-y: scroll;
            white-space: pre-wrap;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar Payment Sources" OnClick="btnBuscar_Click" />
            <br /><br />
            <asp:TextBox ID="txtConsola" runat="server" CssClass="console" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
        </div>
    </form>
</body>
</html>
