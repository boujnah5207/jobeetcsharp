using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace Jobeet.Models
{
    public partial class Category
    {

        public List<Job> GetActiveJobs()
        {
            int defaultMaxActiveJobs = int.Parse(ConfigurationManager.AppSettings["maxActiveJobs"]);
            return GetActiveJobsCriteria().Take(defaultMaxActiveJobs).ToList();
        }

        public List<Job> GetActiveJobs(int max)
        {
            return GetActiveJobsCriteria().Take(max).ToList();
        }

         public IQueryable<Job> GetActiveJobsCriteria()
         {
             return JobModels.AddActiveJobsCriteria(this.Job.AsQueryable());
         }

         public int CountActiveJobs()
         {
             return GetActiveJobsCriteria().Count();
         }

         protected override void OnPropertyChanged(string property)
         {
             base.OnPropertyChanged(property);
             if(property == "Name")
             {
                 Slug = Utils.Slugify(Name);
             }
         }
    }
}