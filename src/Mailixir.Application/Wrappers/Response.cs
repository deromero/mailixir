using System.Collections.Generic;

namespace Mailixir.Application.Wrappers
{
    public class Response<T>
    {
        public bool Succeeded { get; set; }
        public string Message { get; set; }
        public List<string> Errors { get; set; }
        public T Data { get; set; }

        public Response() { }
        public Response(string message)
        {
            Succeeded = false;
            Message = message;
        }
        public Response(T data, string message)
        {
            Succeeded = true;
            Message = message;
            Data = data;
        }
    }
}