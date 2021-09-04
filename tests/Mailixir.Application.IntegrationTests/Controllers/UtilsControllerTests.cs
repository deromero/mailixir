using Xunit;
using Moq;
using FluentAssertions;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Configuration;
using Mailixir.Application.Wrappers;
using Mailixir.Web.Api.Controllers;

namespace Mailixir.Application.IntegrationTests.Controllers
{
    public class UtilsControllerTests
    {

        [Fact]
        public async Task GetPingAsync_ReturnsApiResponse()
        {
            var expectedResult = new Response<string>("MAILIXIR SERVICE WORKING OK", "PING RESULT");
            
            var configStub = new Mock<IConfiguration>();
            var loggerStub = new Mock<ILogger<UtilsController>>();

            var controller = new UtilsController(configStub.Object, loggerStub.Object);
            var result = await controller.Ping();

            result.Value.Should().BeEquivalentTo(expectedResult);
        }


    }
}