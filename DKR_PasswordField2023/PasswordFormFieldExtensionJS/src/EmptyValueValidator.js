export default ({ model, sdkConfiguration, fieldConfiguration }) => {
    if (!model || typeof model !== 'string') {
        return false;
    }

    return true;
};
