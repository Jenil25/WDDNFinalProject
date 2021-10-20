<%@ Page Title="WebSeries" Language="C#" AutoEventWireup="true" CodeBehind="WebSeries.aspx.cs" MasterPageFile="../Site.Master" Inherits="Try2.WebSeries" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Web Series</h2>
    <p>Select Genre:</p> 
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="DataSourceGenre" DataTextField="genre" DataValueField="Id" AutoPostBack="True">
        </asp:DropDownList>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="DataSourceGenre" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Genre]"></asp:SqlDataSource>
    </p>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3">
        <LayoutTemplate>
      <table>
         <tr>
            <td style="padding:2rem;">
               <table border="0" cellpadding="5">
                  <asp:PlaceHolder runat="server" ID="groupPlaceHolder"></asp:PlaceHolder>
               </table>
            </td>
         </tr>
      </table>
   </LayoutTemplate>

   <GroupTemplate>
      <tr>
         <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
      </tr>
   </GroupTemplate>

   <ItemTemplate>
      <td style="padding:2rem;">
          <center><div class="col mx-auto shadow-none p-3 mb-5 bg-light rounded" style="border:solid 1px black">
            <div class="card" style="width: 40rem;">
                <img src="<%# Eval("series_poster") %>" class="card-img-top" alt="..." width="400" height="400">
                <div class="card-body">
                    <h5 class="card-title"> <b><%# Eval("series_title") %></b> </h5>
                    <p class="card-text m-0 p-0"><%# Eval("series_desc") %></p> 
                    <br>
                    <center><a href="/WebSeriesPage/webseriesPage.aspx?Id=<%# Eval("Id") %>" class="btn btn-primary">View</a></center>
                </div>

            <div class="card-footer p-0 border-0">
                    </div> 
            </div>
    </div></center>
      </td>
   </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [WebSeries] WHERE ([series_genre] = @series_genre)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="series_genre" PropertyName="SelectedValue" Type="Int32"/>
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>