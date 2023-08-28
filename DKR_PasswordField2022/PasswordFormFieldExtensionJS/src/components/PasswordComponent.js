import classNames from 'classnames';
import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';

//import './PostCode.css';

const createState = data => {
    // Example value of data 
    // Some text

    if ((new URLSearchParams(document.location.search)).get("debug") == 'passwordField') {
        debugger;
    }
    if (data) {
        return {
            inputValue: data,
            prevData: data,
        };
    } else {
        return {
            inputValue: '',
            prevData: data,
        };
    }
};

export default class PasswordComponent extends PureComponent {

    state = createState(this.props.data);

    static propTypes = {
        className: PropTypes.oneOfType([PropTypes.object, PropTypes.string]),
        data: PropTypes.string.isRequired,
        onChange: PropTypes.func.isRequired,
        fieldConfiguration: PropTypes.object.isRequired,
    };

    static getDerivedStateFromProps(props, state) {
        if (props.data !== state.prevData) {
            return createState(props.data);
        }

        return null;
    }

    handleBlur = () => {
        const { onChange } = this.props;
        const { inputValue, prevData } = this.state;

        const data = inputValue;

        if (data !== prevData) {
            onChange(data);
        }
    };

    handleChange = event => {
        this.setState({ inputValue: event.target.value });
    };


    render() {
        const { className } = this.props;

        const fieldConfiguration = this.props.fieldConfiguration;
        const isDisabled = fieldConfiguration.isDisabled;
        const isAdmin = fieldConfiguration.isAdmin;
        const isReadonly = isDisabled && !isAdmin;

        return (
            <div>
                <input
                    className={classNames(
                        'wfFormControl',
                        'form-control',
                        className
                    )}
                    onBlur={this.handleBlur}
                    onChange={this.handleChange}
                    type="password"
                    value={this.state.inputValue}
                    disabled={isReadonly}
                />
            </div>
        );
    }
}
