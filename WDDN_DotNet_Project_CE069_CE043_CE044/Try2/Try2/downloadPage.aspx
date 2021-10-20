<%@ Page Title="Download" Language="C#" AutoEventWireup="true" CodeBehind="downloadPage.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Try2.downloadPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
        <div>
            <h2> Download </h2>
             Download movie from <a href="<%=filepath %>" download> here </a>
        </div>
    
</asp:Content>
