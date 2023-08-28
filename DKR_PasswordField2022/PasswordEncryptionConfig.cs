using WebCon.WorkFlow.SDK.ConfigAttributes;

namespace DKR_PasswordField2022
{
    public class PasswordEncryptionConfig
    {
        [ConfigEditableText(DisplayName = "Key", Description = "Used for encrypting the data. 24 characters are required.", IsRequired = true)]
        public string Key { get; set; }
    }

    public class EncryptionKeyTranslations
    {
        [ConfigEditableTranslation(DefaultTranslation = "The key has to be 24 characters long. Not less and not more.", DisplayName = "Error: Key length not met", Description = "Will be displayed if the entered key is length than 24 characters. We can't ensure this during the configuration, because this value may come from a constant.")]
        public string KeyLengthNotMetErrorMessage
        {
            get; set;
        }
    }
}
