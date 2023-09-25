
using System.ComponentModel.DataAnnotations;


namespace Data.Entities.Logins
{
    public class Role
    {
        [Key]
        public int RoleId { get; set; }
        public string RoleName { get; set; }
    }
}
