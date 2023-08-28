
import defaultSDKConfiguration from "./components/DefaultSDKConfiguration"

export default ({ model, sdkConfiguration, fieldConfiguration }) => {

    if ((new URLSearchParams(document.location.search)).get("debug") == 'passwordField') {
        debugger;
    }
    const _sdkConfiguration = sdkConfiguration.Translation ? sdkConfiguration : defaultSDKConfiguration
    if (!model || typeof model !== 'string') {
        return {
            isValid: false

        }
    }
    if (model.length < _sdkConfiguration.FieldConfig.PasswordMinCharacters) {
        return {
            isValid: false,
            errorMessage: _sdkConfiguration.Translation.List.MinCharacterErrorMessage.replace("%1", _sdkConfiguration.FieldConfig.PasswordMinCharacters)
        }
    }
    return {
        isValid: true,
    };


};
