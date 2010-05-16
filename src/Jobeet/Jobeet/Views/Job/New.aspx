<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Job>" %>
<%@ Import Namespace="Jobeet.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Jobeet - Your best job board
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>New Job</h1>
    <% using (Html.BeginForm(null, null, FormMethod.Post, new { Enctype = "multipart/form-data" }))
       { %>

       <%= Html.EditorFor(job => Model) %>
        <input type="submit" value="Post your job !" />
    <% } %>
</asp:Content>
