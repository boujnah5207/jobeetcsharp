using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Linq.Expressions;
using System.Configuration;

namespace Jobeet.Models
{
    public static class JobModels
    {
        public static List<Job> GetAllJobs()
        {
            using (JobeetCSharpEntities context = new JobeetCSharpEntities())
            {
                return (from jobs in context.Job select jobs).ToList();
            }
        }

        public static void ResetDataBase()
        {
            using (JobeetCSharpEntities context = new JobeetCSharpEntities())
            {
                context.ResetDefaultCategories();
            }
        }

        public static Job GetJobById(int id)
        {
            using (JobeetCSharpEntities context = new JobeetCSharpEntities())
            {
                return context.Job.FirstOrDefault(x => x.JobId == id);
            }
        }

        public static List<Job> GetActivesJobs(IQueryable<Job> queryable = null)
        {
            if (queryable == null)
            {
                using (JobeetCSharpEntities context = new JobeetCSharpEntities())
                {
                    return AddActiveJobsCriteria(context.Job).ToList();
                }
            }
            else
            {
                return AddActiveJobsCriteria(queryable).ToList();
            }
        }

        public static IQueryable<Job> AddActiveJobsCriteria(IQueryable<Job> queryable)
        {
            if (queryable == null)
            {
                return null;
            }
            else
            {
                return from job in queryable
                       where job.ExpiresAt.CompareTo(DateTime.Now) > 0
                       orderby job.CreateAt
                       select job;
            }
        }

        public static int CountActiveJobs(IQueryable<Job> queryable = null)
        {
            if(queryable == null)
            {
                using (JobeetCSharpEntities context = new JobeetCSharpEntities())
                {
                    return AddActiveJobsCriteria(context.Job).Count();
                }
            }
            else
            {
                return AddActiveJobsCriteria(queryable).Count();
            }
        }

        public static void CreateJob(Job job)
        {
            job.UpdateAt = DateTime.Now;
            job.CreateAt = DateTime.Now;
            job.ExpiresAt = DateTime.Now.AddDays(double.Parse(ConfigurationManager.AppSettings["expirationTimeInDays"]));
            job.Token = Guid.NewGuid().ToString();
            job.IsActivated = true;

            using (JobeetCSharpEntities context = new JobeetCSharpEntities())
            {
                context.Job.AddObject(job);
                context.SaveChanges();
            }
        }
    }
}