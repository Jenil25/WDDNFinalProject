<%@ Page Title="Series" Language="C#" AutoEventWireup="true" CodeBehind="webseriesPage.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Try2.WebSeriesPage.webseriesPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .col-md-3 {
            display: inline-block;
            margin-left: -4px;
        }

            .col-md-3 img {
                width: 280px;
                height: 195px;
            }

        body .carousel-control-indicator li {
            background-color: blue;
        }

        body .carousel-control-prev-icon body .carousel-control-next-icon {
            background-color: blue;
        }

        body .no-padding {
            padding-left: 0;
            padding-right: 0;
        }

        .carousel-control-prev-icon {
            background: black no-repeat center center;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' viewBox='0 0 8 8'%3e%3cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3e%3c/svg%3e");
        }

        .carousel-control-next-icon {
            background: black no-repeat center center;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' viewBox='0 0 8 8'%3e%3cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3e%3c/svg%3e");
        }

        body .carousel-indicators {
            bottom: 0;
        }

        .carousel-indicators .active {
            background-color: blue;
        }

        .carousel-indicators .sld {
            background-color: grey;
        }

        /* card grid styles */

        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        /* Float four columns side by side */
        .column {
            float: left;
            width: 25%;
            padding: 0 10px;
        }

        /* Remove extra left and right margins, due to padding in columns */
        .row {
            margin: 0 -5px;
        }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }

        /* Style the counter cards */
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* this adds the "card" effect */
            padding: 16px;
            text-align: center;
            background-color: #f1f1f1;
        }

        /* Responsive columns - one column layout (vertical) on small screens */
        @media screen and (max-width: 600px) {
            .column {
                width: 100%;
                display: block;
                margin-bottom: 20px;
            }
        }
    </style>
    <div>
        <div class="container-fluid">
            <div class="row" style="margin-right: 40rem">

                <div class="col" style="padding: 3rem; margin-left: 11rem;">
                    <h3>Trailer</h3>
                    <!-- player-->
                    <div>
                        <iframe id="player" width="980" height="510" src="<%=trailer %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
                    </div>
                </div>
            </div>

            <div id="carouselIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselIndicators" data-slide-to="2"></li>
                </ol>
                <div class="upload-h4">
                    <h4>Some Glimpses</h4>
                </div>
                <div class="carousel-inner">
                    <asp:Repeater ID="ImagesRepeater" runat="server">
                        <ItemTemplate>
                            <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %>" style="background-color: rgb(40,40,40)">
                                <center>
                                    <img class="d-block" src="<%#DataBinder.Eval(Container,"DataItem.path")%>" style="height:600px" alt="Slide"></center>
                                <br />
                                <br />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <a class="carousel-control-prev" href="#carouselIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- Description part -->
            <center><div class="card" style="margin-bottom: 2rem; padding: 5px">
                <h2 style="font-family: 'Agency FB'">Cast </h2>
                <br />

                <center><asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3">
                    <LayoutTemplate>
                        <table>
                            <tr>
                                <td style="padding: 2rem;">
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
                        <td style="padding: 2rem;">
                            <div class="col mx-auto shadow-none p-3 mb-5 bg-light rounded" style="border: solid 1px black">
                                <div class="card" style="width: 29rem;">
                                    <div class="card-body">
                                        <h5 class="card-title"><b><%# Eval("actor_name") %> As <%# Eval("character_name") %></b> </h5>
                                        <br>
                                    </div>

                                    <div class="card-footer p-0 border-0">
                                    </div>
                                </div>
                            </div>
                        </td>
                    </ItemTemplate>
                </asp:ListView></center>

                <center><div class="card" style="height: 300px; width: 500px; border: none; align-self: center">

                    <h2 style="font-family: 'Agency FB'; align-self: center"><%=desc %> </h2>

                </div></center>

               <center><div class="card" style="margin-top: 1rem; margin-left: 3rem; height: 75px; width: 500px; align-self: center">

                    <div class="row">
                        <div class="column">
                            <asp:Button class="btn btn-primary" type="submit" Style="margin-left: 5rem; width: 7rem; height: 36px;" ID="BuyBtn" runat="server" Text="Buy" OnClick="BuyBtn_Click1" />
                        </div>

                        <div class="column">
                            <asp:Button ID="Button1" runat="server" class="btn btn-primary" type="submit" Style="width: 10rem; margin-left: 8rem" Text="Rent Series" OnClick="Button1_Click" />
                        </div>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [WebSeriesCast] WHERE ([series_id] = @series_id)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="series_id" QueryStringField="Id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />


                    </div>


                </div></center> 

            </div></center>
        </div>
    </div>
</asp:Content>
