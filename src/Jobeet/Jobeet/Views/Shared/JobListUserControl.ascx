<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<Job>>" %>
<%@ Import Namespace="Jobeet.Models" %>

<table class="jobs">
    <% 
        List<Job> jobs = Model;
       int i = 0; // sert pour la graphisme (pair ou impaire)
       foreach (Job job in jobs)
       {
    %>
          <tr class="<%= i%2 == 0 ? "even" : "odd" %>">
            <td class="location"><%= Html.Encode(job.Location) %></td>
            <td class="position">
                <%=  Html.ActionLink(job.Position, "show", "job", 
                    new{ Company = job.GetCompanySlug(),
                         Location = job.GetLocationSlug(),
                         id= job.JobId,
                         Position = job.GetPositionSlug() 
                    }, null)  %>
            </td>
            <td class="company"><%= Html.Encode(job.Company) %></td>
          </tr>
    <%
          i++;
      }
    %>
    </table>
