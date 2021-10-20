<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Try2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div id="Carousal" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#Carousal" data-slide-to="0" class="active"></li>
            <li data-target="#Carousal" data-slide-to="1"></li>
            <li data-target="#Carousal" data-slide-to="2"></li>
        </ol>
        <div class="upload-h4">
            <center><h2>Movies</h2></center>
        </div>
        <div class="carousel-inner">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %>" style="background-color: rgb(40,40,40)">
                        <center>
                            <img class="d-block w-100" src="<%#DataBinder.Eval(Container,"DataItem.movie_poster")%>" alt="Slide"></center>
                        <h5 class="card-title" style="text-align: center; color: ButtonShadow"><%#DataBinder.Eval(Container,"DataItem.movie_title")%></h5>
                        <p class="card-text" style="text-align: center; color: ButtonShadow"><%#DataBinder.Eval(Container,"DataItem.movie_desc")%></p>
                        <center><a href="/MoviePage/moviePage.aspx?Id=<%#DataBinder.Eval(Container,"DataItem.Id")%>" class="btn btn-primary">View</a></center>
                        <br />
                        <br />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <br />
        <a class="carousel-control-prev" href="#Carousal" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#Carousal" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>









    <br />
    <div id="MoviesCarousal" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#MoviesCarousal" data-slide-to="0" class="active"></li>
            <li data-target="#MoviesCarousal" data-slide-to="1"></li>
            <li data-target="#MoviesCarousal" data-slide-to="2"></li>
        </ol>
        <div class="upload-h4">
            <center><h2>Popular Movies</h2></center>
        </div>
        <div class="carousel-inner">
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %>" style="background-color: rgb(40,40,40)">
                        <center>
                            <img class="d-block w-100" src="<%#DataBinder.Eval(Container,"DataItem.movie_poster")%>" alt="Slide"></center>
                        <h5 class="card-title" style="text-align: center; color: ButtonShadow"><%#DataBinder.Eval(Container,"DataItem.movie_title")%></h5>
                        <p class="card-text" style="text-align: center; color: ButtonShadow"><%#DataBinder.Eval(Container,"DataItem.movie_desc")%></p>
                        <center><a href="/MoviePage/moviePage.aspx?Id=<%#DataBinder.Eval(Container,"DataItem.Id")%>" class="btn btn-primary">View</a></center>
                        <br />
                        <br />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <br />
        <a class="carousel-control-prev" href="#MoviesCarousal" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#MoviesCarousal" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>







    <br />
    <div id="SeriesCarousal" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#SeriesCarousal" data-slide-to="0" class="active"></li>
            <li data-target="#SeriesCarousal" data-slide-to="1"></li>
            <li data-target="#SeriesCarousal" data-slide-to="2"></li>
        </ol>
        <div class="upload-h4">
            <center><h2>Popular Shows</h2></center>
        </div>
        <div class="carousel-inner">
            <asp:Repeater ID="Repeater3" runat="server">
                <ItemTemplate>
                    <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %>" style="background-color: rgb(40,40,40)">
                        <center>
                            <img class="d-block w-100" src="<%#DataBinder.Eval(Container,"DataItem.series_poster")%>" alt="Slide"></center>
                        <h5 class="card-title" style="text-align: center; color: ButtonShadow"><%#DataBinder.Eval(Container,"DataItem.series_title")%></h5>
                        <p class="card-text" style="text-align: center; color: ButtonShadow"><%#DataBinder.Eval(Container,"DataItem.series_desc")%></p>
                        <center><a href="/WebSeriesPage/webseriesPage.aspx?Id=<%#DataBinder.Eval(Container,"DataItem.Id")%>" class="btn btn-primary">View</a></center>
                        <br />
                        <br />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <br />
        <a class="carousel-control-prev" href="#SeriesCarousal" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#SeriesCarousal" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

</asp:Content>
