

using System.ComponentModel.DataAnnotations;

namespace Data.Entities
{
    public  class DoctorDetails
    {
        [Key]
        public int UserId { get; set; }
        public string UserFirstName { get; set; }
        public string UserLastName { get; set; }

        public int RoleId { get; set; }

        public int DepartmentId { get; set; }
       
    }
}
