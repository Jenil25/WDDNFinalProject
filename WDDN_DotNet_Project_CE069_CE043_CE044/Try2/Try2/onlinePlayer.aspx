<%@ Page Title="Player" Language="C#" AutoEventWireup="true" CodeBehind="onlinePlayer.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Try2.onlinePlayer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif, Tahoma, Geneva, Verdana, sans-serif">Enjoy Movie... </h2>

    <div style="margin-top: 5rem;">
        <iframe id="player" width="980" height="510" src="<%=link %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
    </div>

</asp:Content>
