<%@ Page Title="Purchase" Language="C#" AutoEventWireup="true" CodeBehind="webseriesPurchasePage.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Try2.webseriesPurchasePage" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Purchase</h2>
    <h2>Amount: Rs. <%=price%></h2>
    <br><br>
    
  
  <div class="form-group row">
    <label for="cardnumber" class="col-sm-2 col-form-label">Enter Card number</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="cardnumbedr" placeholder="Card Number" required>
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password" required>
    </div>
  </div>
   <div class="form-group row">
    <label for="cvv" class="col-sm-2 col-form-label">CVV</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="cvv" placeholder="CVV" required>
    </div>
  </div>
  
  <div class="form-group row">

  </div>
  <div class="form-group row">
    <div class="col-sm-10">
      
    </div>
      <asp:Button class="btn btn-primary" type="submit" Style="margin-left:5rem; width:7rem" ID="Button" runat="server" Text="Buy" OnClick="Button_Click1" />
    

  </div>
      

     
 </asp:Content>