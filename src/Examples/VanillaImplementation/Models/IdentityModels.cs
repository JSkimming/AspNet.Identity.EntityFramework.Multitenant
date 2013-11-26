using AspNet.Identity.EntityFramework.Multitenant;

namespace VanillaImplementation.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : MultitenantIdentityUser
    {
    }

    public class ApplicationDbContext : MultitenantIdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection")
        {
        }
    }
}