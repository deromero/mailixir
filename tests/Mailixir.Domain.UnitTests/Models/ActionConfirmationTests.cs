using Mailixir.Domain.Models;
using FluentAssertions;
using Xunit;


namespace Mailixir.Domain.UnitTests.Models
{
    public class ActionConfirmationTests
    {
        [Fact]
        public void GetSuccessActionConfirmationWithRightCode()
        {
            var confirmationMessage = "Object OK";
            var confirmation = ActionConfirmation.CreateSuccess(confirmationMessage);

            confirmation.WasSuccess.Should().Be(true);
            confirmation.Message.Should().Be(confirmationMessage);
            confirmation.Code.Should().Be("000");
        }

        [Fact]
        public void GetFailureActionConfirmationWithDefaultCode()
        {
            var confirmationMessage = "Object FAIL";
            var confirmation = ActionConfirmation.CreateFailure(confirmationMessage);

            confirmation.WasSuccess.Should().Be(false);
            confirmation.Message.Should().Be(confirmationMessage);
            confirmation.Code.Should().Be("999");
        }

        [Fact]
        public void GetFailureActionConfirmationWithCustomCode()
        {
            var confirmationMessage = "Object FAIL";
            var failureCode = "696";

            var confirmation = ActionConfirmation.CreateFailure(confirmationMessage, failureCode);

            confirmation.WasSuccess.Should().Be(false);
            confirmation.Message.Should().Be(confirmationMessage);
            confirmation.Code.Should().Be(failureCode);
        }

    }
}