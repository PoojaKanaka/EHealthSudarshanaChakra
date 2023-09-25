
using System.ComponentModel.DataAnnotations;


namespace Data.Entities.Departments
{
    public  class Department
    {
        [Key]
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
    }
}
