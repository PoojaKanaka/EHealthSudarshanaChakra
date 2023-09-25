

namespace Data.Entities
{
    public class VisitDetails
    {
        public string AbhaId { get; set; }
        public string VisitId { get; set; }
        public int UserId { get; set; }
        public int HospitalId { get; set; }
        public DateTime AdmitDate { get; set; }
        public DateTime DischargeDate { get; set;}
        public char InpatientOrOutpatient { get; set; }
        public string DiagnosisId { get; set; }

    }
}
