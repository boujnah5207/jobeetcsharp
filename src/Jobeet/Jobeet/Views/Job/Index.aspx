<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<Category>>" %>
<%@ Import Namespace="Jobeet.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Jobeet - Your best job board
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div id="jobs">
<% List<Category> categories = Model;   %>
<% foreach (Category category in categories)
   {%>
    <div class="category_<%= category.Slug %>">
      <div class="category">
        <div class="feed">
          <a href="">Feed</a>
        </div>
         <h1>
         <%= Html.ActionLink(category.Name, "Show", "Category", new { slug = category.Slug }, null) %>
        </h1>
      </div>

      <% Html.RenderPartial("JobListUserControl", category.GetActiveJobs()); %>
 
 <% 
       int count = category.CountActiveJobs();
       if ((count - 10) > 0)
       { %>
        <div class="more_jobs">
          and <%= Html.ActionLink(count.ToString(), "Show", "Category", new { slug = category.Slug }, null) %>
          more...
        </div>
        <%
        } %>
    </div>
     <% 
   } %>
</div>

</asp:Content>
