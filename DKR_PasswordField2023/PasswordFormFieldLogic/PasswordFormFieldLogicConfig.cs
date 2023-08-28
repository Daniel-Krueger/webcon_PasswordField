using System.Transactions;
using WebCon.WorkFlow.SDK.Common;
using WebCon.WorkFlow.SDK.ConfigAttributes;

namespace DKR_PasswordField2023
{
    public class PasswordFormFieldLogicConfig : PluginConfiguration
    {
        [ConfigGroupBox(DisplayName = "Encryption configuration", Order = 1)]
        public PasswordEncryptionConfig PasswordEncryptionConfig { get; set; }


        [ConfigGroupBox(DisplayName = "Form field configuration", Order = 2)]
        public FormFieldConfig FieldConfig { get; set; }

        public class FormFieldConfig
        {
            [ConfigEditableInteger(DisplayName = "Minimum characters", Description = "The minimum characters the password should have. Will be used in the form field too", IsRequired = true, Order = 2, DefaultValue = 12, MinValue = 6)]
            public int PasswordMinCharacters { get; set; }
        }

        [ConfigGroupBox(DisplayName = "Translations", Order = 3)]
        public Translations Translation { get; set; }
        public class Translations
        {
            [ConfigEditableTranslationsList(DisplayName = "Translations", Order = 3)]
            public TranslationList List { get; set; }

            public class TranslationList : EncryptionKeyTranslations
            {
                [ConfigEditableTranslation(DefaultTranslation = "The password must have a minimum of '%1' characters.", DisplayName = "Minimum characters error", Description = "This message will be used in the form field. You can use %1 in your text. This will replaced by the configured value.")]
                public string MinCharacterErrorMessage
                {
                    get; set;
                }

                [ConfigEditableTranslation(DefaultTranslation = "No password provided!", DisplayName = "Error: Password empty", Description = "Will be displayed if for some reason an empty password would be stored.")]
                public string NoPasswordProvidedErrorMessage
                {
                    get; set;
                }

                [ConfigEditableTranslation(DefaultTranslation = "The hint displays the first two and last two characters of the password. So the password should be at least 6 characters long.", DisplayName = "Error: Password enforced length not met.", Description = "Will be displayed if the password is shorter than 6 characters, regardless of the password configuration field.")]
                public string HintErrorMessage
                {
                    get; set;
                }
            }
        }
    }





}