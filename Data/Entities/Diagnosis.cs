
using System.ComponentModel.DataAnnotations;


namespace Data.Entities
{
    public  class Diagnosis
    {
        [Key]
       public string DiagnosisId { get; set; }
        public string DiagnosisDescription { get; set; }
        public string Symptoms { get; set; }


    }
}
