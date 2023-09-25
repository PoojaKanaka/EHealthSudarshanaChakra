
using System.ComponentModel.DataAnnotations;


namespace Data.Entities.Logins
{
    public  class Login
    {
        [Key]
        public string UserId { get; set; }

        public string Password { get; set; }    
    }
}
