using System;

namespace Mailixir.Application.Models
{
    [Serializable]
    public class ActionConfirmation
    {
        private ActionConfirmation() { }

        public bool WasSuccess { get; set; }
        public string Message { get; set; }
        public string Code { get; set; }
        public IConfirmationValue Value { get; set; }


        #region SUCCESS 

        public static ActionConfirmation CreateSuccess(string message)
        {
            return CreateSuccess(message, "000", null);
        }

        public static ActionConfirmation CreateSuccess(string message, string code)
        {
            return CreateSuccess(message, code, null);
        }

        public static ActionConfirmation CreateSuccess(string message, string code, IConfirmationValue value)
        {
            return CreateActionConfirmation(true, message, code, value);
        }

        #endregion


        #region FAILURE

        public static ActionConfirmation CreateFailure(string message)
        {
            return CreateFailure(message, "999", null);
        }

        public static ActionConfirmation CreateFailure(string message, string code)
        {

            return CreateFailure(message, code, null);
        }

        public static ActionConfirmation CreateFailure(string message, string code, IConfirmationValue value)
        {
            return CreateActionConfirmation(false, message, code, value);
        }

        #endregion

        private static ActionConfirmation CreateActionConfirmation(bool wasSuccess, string message, string code, IConfirmationValue value)
        {
            return new ActionConfirmation
            {
                WasSuccess = wasSuccess,
                Message = message,

                Code = code,
                Value = value
            };
        }

    }
}