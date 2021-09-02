using System;
using System.Collections.Generic;

namespace Mailixir.Domain.Models
{

    [Serializable]
    public class ValidationResult
    {
        public bool IsValid { get; set; }
        public string Message { get; set; }
        public IDictionary<string, string> Results { get; }

        public ValidationResult()
        {

            Results = new Dictionary<string, string>();
        }
    }
}