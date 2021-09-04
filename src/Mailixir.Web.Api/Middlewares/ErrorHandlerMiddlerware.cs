using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text.Json;
using System.Threading.Tasks;
using Mailixir.Application.Exceptions;
using Mailixir.Application.Wrappers;
using Microsoft.AspNetCore.Http;

namespace Mailixir.Web.Api.Middlewares
{
    public class ErrorHandlerMiddlerware
    {
        private readonly RequestDelegate _next;

        public ErrorHandlerMiddlerware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception exception)
            {
                var response = context.Response;
                response.ContentType = "application/json";
                var responseModel = new Response<string> { Succeeded = false, Message = exception?.Message };

                switch (exception)
                {
                    case ApiException e:
                        // custom application error
                        response.StatusCode = (int)HttpStatusCode.BadRequest;
                        break;
                    case ValidationException e:
                        // custom application error
                        response.StatusCode = (int)HttpStatusCode.BadRequest;

                        var validationErrors = new List<string>();
                        foreach (var item in e.Errors)
                        {
                            var valError = $"{item.Key} -{string.Join(",",item.Value.ToList())}";
                        }

                        responseModel.Errors = validationErrors;
                        break;
                    case KeyNotFoundException e:
                        // not found error
                        response.StatusCode = (int)HttpStatusCode.NotFound;
                        break;

                    default:
                        // Unhandled error
                        response.StatusCode = (int)HttpStatusCode.InternalServerError;
                        break;
                }

                var result = JsonSerializer.Serialize(responseModel);

                await response.WriteAsync(result);

            }
        }
    }
}