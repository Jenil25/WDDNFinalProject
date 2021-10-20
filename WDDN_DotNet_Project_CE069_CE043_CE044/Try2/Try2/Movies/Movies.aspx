<%@ Page Title="Movies" Language="C#" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" MasterPageFile="../Site.Master" Inherits="Try2.Movies" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Movies</h2>
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
                <img src="<%# Eval("movie_poster") %>" class="card-img-top" alt="..." width="400" height="400">
                <div class="card-body">
                    <h5 class="card-title"> <b><%# Eval("movie_title") %></b> </h5>
                    <p class="card-text m-0 p-0"><%# Eval("movie_desc") %></p> 
                    <br>
                    <center><a href="/MoviePage/moviePage.aspx?Id=<%# Eval("Id") %>" class="btn btn-primary">View</a></center>
                    <br>
                </div>

            <div class="card-footer p-0 border-0">
                    </div> 
            </div>
    </div></center>
      </td>
   </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Movie] WHERE ([movie_genre] = @movie_genre)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="movie_genre" PropertyName="SelectedValue" Type="Int32" DefaultValue="*"/>
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />

</asp:Content>