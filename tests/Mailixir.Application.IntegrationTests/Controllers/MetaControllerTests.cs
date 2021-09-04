using System.Threading.Tasks;
using Xunit;
using FluentAssertions;
using Mailixir.Web.Api.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace Mailixir.Application.IntegrationTests.Controllers
{
    public class MetaControllerTests
    {

        [Fact]
        public async Task GetInfoAsync_ReturnsOkResponse()
        {
            var expectedResult = "Version:";

            var controller = new MetaController();
            var result = await controller.Info();

            result.Result.Should().BeOfType<OkObjectResult>();
        }

    }
}