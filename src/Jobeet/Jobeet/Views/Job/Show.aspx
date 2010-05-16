<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Job>" %>
<%@ Import Namespace="Jobeet.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<% Job job = Model;%>
    <%=Html.Encode(String.Format("{0} is looking for a {1}.",job.Company, job.Position)) %>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% Job job = Model as Job;%>

<div id="job">
  <h1><%=Html.Encode(job.Company)%></h1>
  <h2><%=Html.Encode(job.Location) %></h2>
  <h3>
  <%=Html.Encode(job.Position) %>
    <small> - <%=Html.Encode(job.Type) %></small>
  </h3>
 <%if (!String.IsNullOrEmpty(job.Logo))
   { %>
    <div class="logo">
      <a href="<%= job.Url %>">
        <img src="<%= Url.Content("~/Content/Uploads/Jobs/"+job.Logo) %>"
          alt="<%=job.Company %> logo" />
      </a>
    </div>
 <%} %>
 
  <div class="description">
    <%=Html.Encode(job.Description) %>
  </div>
 
  <h4>How to apply?</h4>
 
  <p class="how_to_apply"><%= job.HowToApply %></p>
 
  <div class="meta">
    <small>posted on <%= job.CreateAt.ToString("MM/dd/yyyy") %></small>
  </div>

</div>

</asp:Content>
