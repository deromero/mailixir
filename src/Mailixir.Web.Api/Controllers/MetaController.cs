using System.Diagnostics;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Mailixir.Web.Api.Controllers
{
    public class MetaController : BaseApiController
    {
        [HttpGet("/info")]
        public async Task<ActionResult<string>> Info() {
            
            var assembly = typeof(Startup).Assembly;

            var lastUpdate = System.IO.File.GetLastWriteTime(assembly.Location);
            var version = FileVersionInfo.GetVersionInfo(assembly.Location).ProductVersion;

            return Ok($"Version: {version}, Last Updated: {lastUpdate}");
        } 
    }
}