using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Try2.Startup))]
namespace Try2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
