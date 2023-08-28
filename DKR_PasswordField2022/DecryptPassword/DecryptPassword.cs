using Newtonsoft.Json.Linq;
using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using WebCon.WorkFlow.SDK.BusinessRulePlugins;
using WebCon.WorkFlow.SDK.BusinessRulePlugins.Model;

namespace DKR_PasswordField2022
{
    public class DecryptPassword : CustomBusinessRule<DecryptPasswordConfig>
    {
        public override EvaluationResult Evaluate(CustomBusinessRuleParams args)
        {

            if (Configuration.PasswordEncryptionConfig.Key.Length != 24)
            {
                args.Context.PluginLogger.AppendDebug("Passed key is less than 24 characters");
                throw new ApplicationException("The key has to be 24 characters long. Not less and not more.");
            }

            JObject jsonObject = JObject.Parse(Configuration.DecryptConfig.FieldValue);
            byte[] iv = GetProperty(args, jsonObject, "iv");
            byte[] encryptedData = GetProperty(args, jsonObject, "encrypted");


            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(Configuration.PasswordEncryptionConfig.Key);
                aes.IV = iv;

                ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);

                using (MemoryStream msDecrypt = new MemoryStream(encryptedData))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                        {
                            return EvaluationResult.CreateStringResult(srDecrypt.ReadToEnd());
                        }
                    }
                }
            }
        }

        private static byte[] GetProperty(CustomBusinessRuleParams args, JObject jsonObject, string porperty)
        {
            if (jsonObject[porperty] == null)
            {
                throw new ApplicationException($"Property '{porperty}' does not exist in the JSON value.");
            }
            args.Context.PluginLogger.AppendDebug($"Property '{porperty}' exists on JSON");
            return Convert.FromBase64String(jsonObject[porperty].ToString());
        }
    }
}