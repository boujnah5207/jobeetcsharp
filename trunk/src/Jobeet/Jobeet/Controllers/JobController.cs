using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jobeet.Models;
using System.IO;
using System.Configuration;

namespace Jobeet.Controllers
{
    public class JobController : Controller
    {
        private CategoryModels categoryModels;

        //
        // GET: /Job/

        public JobController()
        {
            categoryModels = new CategoryModels();
        }

        public ActionResult Index()
        {
            ViewData.Model = categoryModels.GetWithJobs();
            return View();
        }

        public ActionResult Show(string company, string location, int id, string position)
        {
            Job job = JobModels.GetJobById(id);

            if (job == null)
            {
                return View("NotFound");
            }
            else
            {
                return View(job);
            }
        }

        //
        // GET : Job/New
        public ActionResult New()
        {
            Job newJob = new Job();
            ViewData["categories"] = categoryModels.GetAll();
            return View(newJob);
        }

        //
        // POST : Job/New
        [HttpPost]
        public ActionResult New(Job jobToCreate)
        {
            Object o = Request.Params;
            if (ModelState.IsValid)
            {
                // On enregistre l'image du logo si elle existe
                HttpPostedFileBase file = Request.Files["logoFile"];
                if (file != null)
                {
                    // Création du nom du fichier en fonction de l'extension et du nom de l'entreprise nettoyé
                    String fileName = jobToCreate.GetCompanySlug() + Path.GetExtension(file.FileName);

                    // Sauvegarde du fichier sur le serveur
                    file.SaveAs(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, ConfigurationManager.AppSettings["companyLogoRelativePath"], fileName));

                    // On attribue le nom du fichier au logo du job
                    jobToCreate.Logo = fileName;
                }

                // On enregistre le job
                JobModels.CreateJob(jobToCreate);

                // Après avoir sauverager le job, on redirige l'utilisateur vers la page de visialisation du job
                return Redirect(Url.Action("show", "job",
                    new
                    {
                        Company = jobToCreate.GetCompanySlug(),
                        Location = jobToCreate.GetLocationSlug(),
                        id = jobToCreate.JobId,
                        Position = jobToCreate.GetPositionSlug()
                    }, null));
            }

            // Job invalide, on réaffiche le formulaire avec les erreurs.
            ViewData["categories"] = categoryModels.GetAll();
            return View(jobToCreate);
        }

        protected override void Dispose(bool disposing)
        {
            if (categoryModels != null)
            {
                categoryModels.Dispose();
                categoryModels = null;
            }
            base.Dispose(disposing);
        }

        public ActionResult AjaxSearch(String keywords)
        {
            ViewData.Model = categoryModels.Search(keywords);
            return PartialView("Search");
        }
    }
}
