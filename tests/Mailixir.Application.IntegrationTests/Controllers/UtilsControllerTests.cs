using Xunit;
using Moq;
using FluentAssertions;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Mailixir.Web.Api.Controllers;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Mvc;
using Mailixir.Application.Models.Responses;

namespace Mailixir.Application.IntegrationTests.Controllers
{
    public class UtilsControllerTests
    {

        [Fact]
        public async Task GetPingAsync_ReturnsApiResponse()
        {
            var expectedResult = new ApiResponse
            {
                Message = "MAILIXIR SERVICE WORKING OK",
                Code = "000"
            };

            var configStub = new Mock<IConfiguration>();
            var loggerStub = new Mock<ILogger<UtilsController>>();

            var controller = new UtilsController(configStub.Object, loggerStub.Object);
            var result = await controller.Ping();

            result.Value.Should().BeEquivalentTo(expectedResult);
        }


    }
}