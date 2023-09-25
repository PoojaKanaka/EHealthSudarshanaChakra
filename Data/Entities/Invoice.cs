

using System.ComponentModel.DataAnnotations;

namespace Data.Entities
{
    public  class Invoice
    {
        [Key]
        public int InvoiceId { get; set; }
        public string AbhaId { get; set;}
        public string VisitId { get; set;}
        public string DiagnosisId { get; set; }
        public float Amount { get; set; }
        public decimal Discount { get; set; }

    }
}
