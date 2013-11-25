using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(IntegerPkImplementation.Startup))]
namespace IntegerPkImplementation
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
