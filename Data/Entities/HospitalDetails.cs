

using System.ComponentModel.DataAnnotations;

namespace Data.Entities
{
    public  class HospitalDetails
    {
        [Key]
        public int HospitalId { get; set; }
        public string HospitalName { get; set; }
        public string Address { get; set; }

    }
}
