var emptyValueValidator_9e084d0e_f6cc_40f1_9c69_1519024dafc1 = (function () {
    'use strict';

    var EmptyValueValidator = (function (_ref) {
      var model = _ref.model,
        sdkConfiguration = _ref.sdkConfiguration,
        fieldConfiguration = _ref.fieldConfiguration;
      if (!model || typeof model !== 'string') {
        return false;
      }
      return true;
    });

    return EmptyValueValidator;

}());
window.webcon = window.webcon || {};
window.webcon.customControls = window.webcon.customControls || {};
window.webcon.customControls.emptyValueValidators = window.webcon.customControls.emptyValueValidators || {};
window.webcon.customControls.emptyValueValidators['9e084d0e-f6cc-40f1-9c69-1519024dafc1'] = emptyValueValidator_9e084d0e_f6cc_40f1_9c69_1519024dafc1;
