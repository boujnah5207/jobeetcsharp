using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using System.ComponentModel;

namespace Jobeet.Models
{
    [MetadataType(typeof(Job_Validation))]
    public partial class Job
    {
        
      public String GetCompanySlug()
      {
        return Utils.Slugify(this.Company);
      }
     
      public String GetPositionSlug()
      {
          return Utils.Slugify(this.Position);
      }
     
      public String GetLocationSlug()
      {
          return Utils.Slugify(this.Location);
      }
    }

    [Bind(Exclude = "JobId")]
    public class Job_Validation
    {
        
        [Required(ErrorMessage="Required")]
        [DisplayName("Category")]
        public int CateroryId { get; set; }

        [Required(ErrorMessage = "Required")]
        [StringLength(255, ErrorMessage = "Must be under 255 characters")]
        public String Type { get; set; }

        [Required(ErrorMessage="Required")]
        [StringLength(255, ErrorMessage = "Must be under 255 characters")]
        public String Company { get; set; }

        [DisplayName("Company logo")]
        public String Logo { get; set; }

        [Required(ErrorMessage = "Required")]
        [StringLength(255, ErrorMessage = "Must be under 255 characters")]
        public String Position { get; set; }

        [Required(ErrorMessage = "Required")]
        [StringLength(255, ErrorMessage = "Must be under 255 characters")]
        public String Location { get; set; }

        [Required(ErrorMessage = "Required")]
        public String Description { get; set; }

        [DisplayName("How to apply?")]
        [Required(ErrorMessage = "Required")]
        public String HowToApply { get; set; }

        [DisplayName("Public?")]
        [Required(ErrorMessage = "Required")]
        public Boolean IsPublic { get; set; }

        [Required(ErrorMessage = "Required")]
        [RegularExpression("^[a-z0-9_\\+-]+(\\.[a-z0-9_\\+-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*\\.([a-z]{2,4})$", ErrorMessage="Please enter a valid email (Example : john.smith@company.com)")]
        [StringLength(255, ErrorMessage = "Must be under 255 characters")]
        public String Email { get; set; }

    }
}