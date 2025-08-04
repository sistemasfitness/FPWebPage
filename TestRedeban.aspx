<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestRedeban.aspx.cs" Inherits="WebPage.TestRedeban" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Test Redeban</h1>
            <asp:ScriptManager ID="ScriptManager1" runat="server" />

            <asp:UpdatePanel ID="upPago" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lblMessage" runat="server" Text="Message will appear here." />
                    <br />
                    <asp:Button ID="btnTest" runat="server" Text="Test Redeban" OnClick="btnEnviarDatos_Click" />
                    <br />
                    <asp:Label ID="lblResult" runat="server" Text="" />
                    <br />
                    <asp:Timer ID="tmrRespuesta" runat="server" Interval="3000" OnTick="tmrRespuesta_Tick" Enabled="false" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
