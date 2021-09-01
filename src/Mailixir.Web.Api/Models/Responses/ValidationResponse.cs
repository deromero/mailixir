using System;
using System.Collections.Generic;

namespace Mailixir.Web.Api.Models.Responses
{
    [Serializable]
    public class ValidationResponse : ApiResponse
    {
        public IDictionary<string, string> ValidationItems { get; }
        public bool IsValid { get; private set; }

        public ValidationResponse()
        {
            ValidationItems = new Dictionary<string, string>();
        }

        public ValidationResponse(string message, bool isValid = false, string code = "900")
        {
            Message = message;
            IsValid = isValid;
            Code = code;
            ValidationItems = new Dictionary<string, string>();
        }

        public ValidationResponse(IDictionary<string, string> validationItems, bool isValid = false)
        {
            ValidationItems = validationItems;
            IsValid = isValid;
            Code = "900";
        }

        public ValidationResponse(string message, IDictionary<string, string> validationItems, bool isValid = false)
        {
            Code = "900";
            Message = message;
            ValidationItems = validationItems;
            IsValid = isValid;
        }

        public ValidationResponse(string message, IDictionary<string, string> validationItems, bool isValid = false, string code = "900")
        {
            Code = code;
            Message = message;
            ValidationItems = validationItems;
            IsValid = isValid;
        }

    }
}