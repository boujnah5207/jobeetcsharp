<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Job>" %>
<%@ Import Namespace="Jobeet.Models" %>
<table id="job_form">
    <tbody>
        <tr>
            <th>
                <%= Html.LabelFor(j => Model.CateroryId) %>
            </th>
            <td>
                <%= Html.ValidationMessageFor(j => Model.CateroryId) %>
                <%
                    List<Category> categories = ViewData["categories"] as List<Category>;
                    List<SelectListItem> categoryItems = new List<SelectListItem>();
                    foreach (Category category in categories)
                    {
                        categoryItems.Add(new SelectListItem() { Text=category.Name, Value = category.CategoryId.ToString() });    
                    }
                %>
                <%=Html.DropDownListFor(j => Model.CateroryId, categoryItems) %>
            </td>
        </tr>
        <tr>
            <th>
                <%= Html.LabelFor( j => Model.Type) %>
            </th>
            <td>
                <%=Html.RadioButtonFor(j => Model.Type, "full-time", new { Checked = "checked" })%><label>Full time</label>
                <%=Html.RadioButtonFor(j => Model.Type, "part-time")%><label>Part time</label>
                <%=Html.RadioButtonFor(j => Model.Type, "freelance")%><label>Freelance</label>
                <%= Html.ValidationMessageFor(j => Model.Type)%>
            </td>
        </tr>
        <tr>
            <th>
                <%= Html.LabelFor( j => Model.Company) %>
            </th>
            <td>
                <%= Html.EditorFor(j => Model.Company)%>
                <%= Html.ValidationMessageFor(j => Model.Company)%>
            </td>
        </tr>
        <tr>
            <th>
                <%= Html.LabelFor( j => Model.Logo) %>
            </th>
            <td>
                <input type="file" id="logoFile" name="logoFile" />
                <%= Html.ValidationMessageFor(j => Model.Logo)%>
            </td>
        </tr>
        <tr>
            <th>
                <%= Html.LabelFor( j => Model.Url) %>
            </th>
            <td>
                <%= Html.EditorFor(j => Model.Url)%>
                <%= Html.ValidationMessageFor(j => Model.Url)%>
            </td>
        </tr>
        <tr>
            <th>
                <%= Html.LabelFor( j => Model.Position) %>
            </th>
            <td>
                <%= Html.EditorFor(j => Model.Position)%>
                <%= Html.ValidationMessageFor(j => Model.Position)%>
            </td>
        </tr>
        <tr>
            <th>
                <%= Html.LabelFor( j => Model.Location) %>
            </th>
            <td>
                <%= Html.EditorFor(j => Model.Location)%>
                <%= Html.ValidationMessageFor(j => Model.Location)%>
            </td>
        </tr>
        <tr>
            <th>
                <%= Html.LabelFor( j => Model.Description) %>
            </th>
            <td>
                <%= Html.TextAreaFor(j => Model.Description)%>
                <%= Html.ValidationMessageFor(j => Model.Description)%>
            </td>
        </tr>
        <tr>
            <th>
                <%= Html.LabelFor( j => Model.HowToApply) %>
            </th>
            <td>
                <%= Html.TextAreaFor(j => Model.HowToApply)%>
                <%= Html.ValidationMessageFor(j => Model.HowToApply)%>
            </td>
        </tr>
        <tr>
            <th>
                <%= Html.LabelFor( j => Model.IsPublic) %>
            </th>
            <td>
                <%= Html.EditorFor(j => Model.IsPublic)%>
                <br />
                Whether the job can also be published on affiliate websites or not.
                <%= Html.ValidationMessageFor(j => Model.IsPublic)%>
            </td>
        </tr>
        <tr>
            <th>
                <%= Html.LabelFor( j => Model.Email) %>
            </th>
            <td>
                <%= Html.EditorFor(j => Model.Email)%>
                <%= Html.ValidationMessageFor(j => Model.Email)%>
            </td>
        </tr>
    </tbody>
</table>