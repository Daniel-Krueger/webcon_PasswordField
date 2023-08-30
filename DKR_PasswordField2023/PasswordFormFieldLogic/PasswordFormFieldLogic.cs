using Newtonsoft.Json.Linq;
using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using WebCon.WorkFlow.SDK.Common.Model;
using WebCon.WorkFlow.SDK.FormFieldPlugins;
using WebCon.WorkFlow.SDK.FormFieldPlugins.Model;

namespace DKR_PasswordField2023
{
    public class PasswordFormFieldLogic : FormFieldExtension<PasswordFormFieldLogicConfig>
    {

        /// <summary>
        /// Originally I wanted to use OnBeforeElementSaveAsync but when saving a new instance, the original password was visible in the history.
        /// </summary>
        public override Task ValidateAsync(ControlValidationParams<FormFieldExtensionContext> args)
        {
            if (Configuration.PasswordEncryptionConfig.Key.Length != 24)
            {
                args.Context.PluginLogger.AppendDebug("Passed key is less than 24 characters");
                throw new ApplicationException(Configuration.Translation.List.KeyLengthNotMetErrorMessage);
            }
            args.Context.PluginLogger.AppendDebug("Key length ok");


            string password = args.Context.CurrentFormField.GetValue().ToString();
            if (string.IsNullOrEmpty(password))
            {
                throw new ApplicationException(Configuration.Translation.List.NoPasswordProvidedErrorMessage);
            }
            args.Context.PluginLogger.AppendDebug("Field value is not empty");


            // If we get a json, it's assumed that the password is already encrypted.
            if (password.Contains("encrypted"))
            {
                args.Context.PluginLogger.AppendDebug("Field value is of type json, no further processing");
                return base.ValidateAsync(args);
            }
            args.Context.PluginLogger.AppendDebug("Field value is simple text -> it's a new password");
            if (password.Length < 6)
            {
                throw new ApplicationException(Configuration.Translation.List.HintErrorMessage);
            }
            args.Context.PluginLogger.AppendDebug("Minimum of 6 characters are defined for setting the hint.");

            if (password.Length < Configuration.FieldConfig.PasswordMinCharacters)
            {
                throw new ApplicationException(Configuration.Translation.List.MinCharacterErrorMessage);
            }
            args.Context.PluginLogger.AppendDebug("Configuration minimum characters are defined.");


            try
            {
                using (Aes aes = Aes.Create())
                {
                    aes.Key = Encoding.UTF8.GetBytes(Configuration.PasswordEncryptionConfig.Key);
                    ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);

                    using (MemoryStream msEncrypt = new MemoryStream())
                    {
                        using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                        {
                            using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                            {
                                swEncrypt.Write(password);
                            }
                        }

                        var jsonObject = new JObject
                        {
                            { "hint", password.Substring(0, 2)+"*******************"+password.Substring(password.Length - 2, 2)},
                            { "iv", Convert.ToBase64String(aes.IV)},
                            { "encrypted", Convert.ToBase64String(msEncrypt.ToArray()) }
                        };

                        string newJson = jsonObject.ToString();
                        args.Context.PluginLogger.AppendDebug("JSON generated");
                        args.Context.CurrentFormField.SetValue(newJson);
                    }
                }

            }
            catch (Exception ex)
            {
                args.Context.PluginLogger.AppendInfo($"{ex.Message}:{ex.HResult}:{ex.StackTrace}");
            }

            return base.ValidateAsync(args);
        }
    }
}