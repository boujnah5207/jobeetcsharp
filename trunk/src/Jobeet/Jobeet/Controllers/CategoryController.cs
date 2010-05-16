using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jobeet.Models;

namespace Jobeet.Controllers
{
    public class CategoryController : Controller
    {
        private CategoryModels categoryModels;

        public CategoryController()
        {
            categoryModels = new CategoryModels();
        }

        //
        // GET: /Category/

        public ActionResult Show(string slug)
        {
            Category category = categoryModels.GetBySlug(slug);
            if (category == null)
            {
                return View("NotFound");
            }
            else
            {
                return View(category);
            }
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

    }
}
