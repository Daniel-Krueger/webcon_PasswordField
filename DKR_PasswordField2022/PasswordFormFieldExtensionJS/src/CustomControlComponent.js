import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';
import Password from './components/PasswordComponent';
import defaultSDKConfiguration from "./components/DefaultSDKConfiguration"

const CustomControlComponent = ({
    fieldConfiguration,
    model,
    onChange,
    sdkConfiguration,
}) => {

    if (
        fieldConfiguration.editMode === 'ReadOnlyHtml' &&
        !fieldConfiguration.isAdmin
    ) {
        return <span className="form-control-readonly">{JSON.parse(model)["hint"]}</span>;
    } else {
        return (
            <Password
                data={model}
                onChange={onChange}
                fieldConfiguration={fieldConfiguration}
            />
        );
    }
};

CustomControlComponent.propTypes = {
    fieldConfiguration: PropTypes.shape({
        displayName: PropTypes.string.isRequired,
        description: PropTypes.string.isRequired,
        isRequired: PropTypes.bool.isRequired,
        editMode: PropTypes.oneOf(['Edit', 'ReadOnly', 'ReadOnlyHtml'])
            .isRequired,
        isNew: PropTypes.bool.isRequired,
        isAdmin: PropTypes.bool.isRequired,
    }).isRequired,
    model: PropTypes.any,
    onChange: PropTypes.func.isRequired,
    sdkConfiguration: PropTypes.object,
};

export default CustomControlComponent;
