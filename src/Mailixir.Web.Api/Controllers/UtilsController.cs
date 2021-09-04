using System.Threading.Tasks;
using Mailixir.Application.Wrappers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace Mailixir.Web.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UtilsController : BaseApiController
    {
        private readonly IConfiguration _configuration;
        private readonly ILogger<UtilsController> _logger;

        public UtilsController(IConfiguration configuration, ILogger<UtilsController> logger)
        {
            _configuration = configuration;
            _logger = logger;
        }

        [HttpGet]
        [Route("ping")]
        public async Task<ActionResult<Response<string>>> Ping()
        {
            _logger.LogInformation("Starts UTILS/PING");

            // TODO: Test all the architecture.
            // Connect to DB
            // ECHO or Ping to another systems.
            // Check Permissions
             
            var response = new Response<string>("MAILIXIR SERVICE WORKING OK", "PING RESULT");

            return response;
        }

    }
}