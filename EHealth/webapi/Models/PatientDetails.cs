namespace webapi.Models
{
    public class PatientDetails : UserDeatils
    {
        public int Age { get; set; }
        public string Address { get; set; } = "NA";
        public string MobileNo { get; set; } = "NA";
        public string EmailId { get; set; } = "NA";
    }
}
