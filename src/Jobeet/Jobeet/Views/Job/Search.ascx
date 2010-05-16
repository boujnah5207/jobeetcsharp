<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Category>>" %>
<%@ Import Namespace="Jobeet.Models" %>
<div class="content">
<div id="jobs">
<% List<Category> categories = Model;   %>
<% if (categories.Count == 0)
   { %>
   <div class="help">
    Aucun résultat n'a été trouvé...
   </div>
   <% }%>

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
     </div>
     <% 
   } %>
</div>
</div>