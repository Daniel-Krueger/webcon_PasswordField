using WebCon.WorkFlow.SDK.Common;
using WebCon.WorkFlow.SDK.ConfigAttributes;

namespace DKR_PasswordField2022
{
    public class DecryptPasswordConfig : PluginConfiguration
    {
        [ConfigGroupBox(DisplayName = "Encryption configuration", Order = 1)]
        public PasswordEncryptionConfig PasswordEncryptionConfig { get; set; }

        [ConfigGroupBox(DisplayName = "Decrypt configuration", Order = 2)]
        public DecryptConfiguration DecryptConfig { get; set; }
        public class DecryptConfiguration
        {
            [ConfigEditableText(DisplayName = "Field value", Description = "The complete JSON of the field, which looks like { hint:'xyz',iv:'abc',encrypted:'def'}.", IsRequired = true)]
            public string FieldValue { get; set; }

        }

        [ConfigGroupBox(DisplayName = "Translations", Order = 3)]
        public Translations Translation { get; set; }
        public class Translations
        {
            [ConfigEditableTranslationsList(DisplayName = "Translations", Order = 3)]
            public TranslationList List { get; set; }

            public class TranslationList : EncryptionKeyTranslations
            {
            }
        }

       
    }
}