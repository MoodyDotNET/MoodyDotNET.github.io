import * as React from 'react';
import { RouteComponentProps, Redirect } from 'react-router';
import { Paper, Card, List, ListItem, CardActions, RaisedButton, Avatar, Divider, CircularProgress } from 'material-ui';
import Member from 'ClientApp/model/Member';
import { UserManageAccount } from './UserManageAccount';
import { UserChangePassword } from './UserChangePassword';

interface UserDashboardState {
    user: Member[],
    activeTab: string,
    logged: boolean,
    loading: boolean,
    avatarSrc: string
}

export class UserDashboard extends React.Component<RouteComponentProps<{}>, UserDashboardState> {
    constructor(props: RouteComponentProps<{}>) {
        super(props);
        this.state = {
            user: [],
            activeTab: 'manage',
            logged: true,
            loading: true,
            avatarSrc: ``
        }
        this.fetchCurrentUser();
    }

    private fetchCurrentUser() {
        fetch('api/member/current', {
            credentials: "same-origin"
        })
        .then(response => response.json() as Promise<Member>)
        .then(data => {
            this.setState({
                user: [data],
                loading: false
            });
            this.setState({avatarSrc: `img/user/${this.state.user[0].userId}.jpg`})
        })
        .catch(error => {
            this.setState({
                logged: false
            })
        });
    }

    private logout() {
        fetch('api/member/logout', {
            credentials: "same-origin"
        }).then(res => {
            this.setState({
                logged: false
            })       
        });
    }

    public render() {
        return (
            <Paper>
                <div className="container-fluid" style={{ backgroundColor: 'white', paddingTop: 80, minHeight: '100vh' }}>
                    { !this.state.logged && <Redirect to="/login" push/> }
                    { this.state.loading ? <CircularProgress /> : this.renderDashboard(this.state.user[0]) }
                </div>
            </Paper>
        );
    }

    private renderPanel() {
        switch (this.state.activeTab) {
            case 'manage':
                return <UserManageAccount user={this.state.user[0]} changeAvatar={(v: string) => this.setState({avatarSrc: v})}/>
        
            case 'password':
                return <UserChangePassword user={this.state.user[0]} logout={() => this.logout()}/>
        }
    }

    private renderDashboard(user: Member) {
        return (
            <div className="row  no-padding-left-right">
                <div className="col-12 col-md-3">
                    <List>
                        <ListItem 
                            leftAvatar={  <Avatar src={this.state.avatarSrc}/> }
                            nestedItems={[
                                <Divider/>,
                                <ListItem onClick={ () => this.setState({activeTab: 'manage'}) }>Manage account</ListItem>,
                                <ListItem onClick={ () => this.setState({activeTab: 'password'}) }>Change password</ListItem>,
                                <ListItem onClick={ () => this.logout() }>Log Out</ListItem>
                            ]}
                            initiallyOpen
                        >
                            { user.username }
                        </ListItem>
                    </List>
                </div>
                <div className="col-12 col-md-9">
                    { this.renderPanel() }
                </div>
            </div>
        );
    }
}
