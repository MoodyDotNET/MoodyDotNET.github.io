import * as React from 'react';
import { Link, NavLink, Redirect, RouteComponentProps } from 'react-router-dom';
import { TextField,Card, CardHeader, CardText, RaisedButton, Paper, Dialog, FlatButton } from 'material-ui';
import { FormEvent } from 'react';

interface LoginState {
    message: string,
    username: string,
    password: string,
}

export class AdminLogin extends React.Component<RouteComponentProps<{}>, LoginState> {
    constructor(props: RouteComponentProps<{}>) {
        super(props);
        this.state = {
            message: "Enter your username and password to login",
            username: "",
            password: ""
        };
    }

    closeForm() {
        
    }    

    private login(event: FormEvent<HTMLFormElement>) {
        this.setState({
            message: 'Logging in...'
        })
        fetch(`api/admin/login?username=${this.state.username}&password=${this.state.password}`, {
            credentials: "same-origin"
        })
        .then(response => response.json() as Promise<boolean>)
        .then(data => {
            if (data == true) {
                this.setState({
                    message: `Welcome ${this.state.username}`,
                })
            } else {
                this.setState({
                    message: 'Incorrect username or password!',
                    password: ''
                })
            }
        });
        event.preventDefault();
        return false;
    }

    public render() {
        return (
            <Dialog open={true}>
                { this.state.message.indexOf('Welcome') >= 0 && <Redirect to="/admin" push/> }                
                <h2>Administrator</h2>
                <p>{ this.state.message }</p>
                <form onSubmit= { (e) => this.login(e) }>
                    <TextField
                        hintText="Username"
                        floatingLabelText="Username"
                        value={this.state.username}
                        onChange={ (e, v) => this.setState({ username: v }) }
                        fullWidth
                    />
                    <br/>
                    <TextField
                        hintText="Password"
                        floatingLabelText="Password"
                        type = "password"
                        value={this.state.password}
                        onChange={ (e, v) => this.setState({ password: v }) }
                        fullWidth
                    />
                    <br/>
                    <div>
                        <RaisedButton label="Login" primary={true} type="submit" /> 
                        <RaisedButton label="Cancel" containerElement={<Link to="/" />} />
                    </div>
                </form>
            </Dialog>
        );
    }
}
