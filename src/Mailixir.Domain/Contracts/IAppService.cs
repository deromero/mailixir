using Microsoft.Extensions.Configuration;

namespace Mailixir.Domain.Contracts
{
    public interface IAppService
    {
        IConfiguration Configuration { get; set; }
    }
}