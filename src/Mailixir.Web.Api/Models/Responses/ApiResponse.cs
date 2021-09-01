using System;

namespace Mailixir.Web.Api.Models.Responses
{
    [Serializable]
    public class ApiResponse
    {
        public string Code { get; set; }
        public string Message { get; set; }
    }
}