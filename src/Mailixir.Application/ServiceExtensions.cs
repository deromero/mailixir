using System.Reflection;
using FluentValidation;
using MediatR;
using Microsoft.Extensions.DependencyInjection;

namespace Mailixir.Application
{
    public static class ServiceExtensions
    {
        public static void AddApplicationLayer(this IServiceCollection services)
        {
            var currentAssemply = Assembly.GetExecutingAssembly();

            services.AddAutoMapper(currentAssemply);
            services.AddValidatorsFromAssembly(currentAssemply);
            services.AddMediatR(currentAssemply);
        }
    }
}