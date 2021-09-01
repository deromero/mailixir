using System;

namespace Mailixir.Web.Api.Models.Responses
{
    [Serializable]
    public class ExceptionResponse : ApiResponse
    {
        public Exception Exception { get; set; }

        public ExceptionResponse()
        {
            Code = "9999";
        }

        public ExceptionResponse(string message, string code)
        {
            Message = message;
            Code = code;
        }

        public ExceptionResponse(Exception exception, string code)
        {
            Exception = exception;
            Message = exception.Message;
            Code = code;
        }
    }
}