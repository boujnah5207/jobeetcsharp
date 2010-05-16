using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jobeet.Models
{
    public class CategoryModels : JobeetCSharpEntities
    {

        public List<Category> GetAll()
        {
            return (from category in this.Category orderby category.Name select category).ToList();
        }

        public Category GetBySlug(string slug)
        {
                return (from category in this.Category.Include("Job")
                       where category.Slug == slug
                       select category).FirstOrDefault();
        }

        public List<Category> GetWithJobs()
        {
                return
                    (
                    from job
                    in JobModels.AddActiveJobsCriteria(this.Job.Include("Category"))
                    select job.Category
                    ).Distinct().ToList();
        }

        public List<Category> Search(String searchKeywords)
        {
            return (
                    from job
                    in JobModels.AddActiveJobsCriteria(this.Job.Include("Category"))
                    where job.Position.Contains(searchKeywords) || job.Company.Contains(searchKeywords) || job.Description.Contains(searchKeywords)
                    select job.Category
                    ).Distinct().ToList();
        }
    }
}