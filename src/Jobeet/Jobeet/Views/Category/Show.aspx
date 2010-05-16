<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Category>" %>
<%@ Import Namespace="Jobeet.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%= Html.Encode(String.Format("Jobs in the {0} category", Model.Name)) %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Category category = Model; %>

    <div class="category">
      <div class="feed">
        <a href="">Feed</a>
      </div>
      <h1><%= Html.Encode(category.Name) %></h1>
    </div>

    <div id="jobs">
        <% Html.RenderPartial("JobListUserControl", category.GetActiveJobs()); %>
    </div>

</asp:Content>
