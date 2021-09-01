using System.Threading.Tasks;
using Mailixir.Web.Api.Models;
using Mailixir.Web.Api.Models.Responses;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace Mailixir.Web.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UtilsController : ControllerBase
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
        public async Task<IActionResult> Ping()
        {
            _logger.LogInformation("Starts UTILS/PING");

            // TODO: Test all the architecture.
            // Connect to DB
            // ECHO or Ping to another systems.
            // Check Permissions
             
            var response = new ApiResponse {
                Message = "MAILIXIR SERVICE WORKING OK",
                Code = "000"
            };

            return Ok(response);

        }

    }
}