using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VanillaImplementation.Startup))]
namespace VanillaImplementation
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
