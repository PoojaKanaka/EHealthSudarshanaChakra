
using System.ComponentModel.DataAnnotations;

namespace Data.Entities
{
    public  class PatientDetails
    {
        [Key]
        public int UserId { get; set; }
        public string UserFirstName { get; set;}
        public string UserLastName { get; set;}
        public string EmailId { get; set;}
        public string Address { get; set;}
        public int  Age { get; set;}
        public string MobileNo { get; set;}

    }
}
