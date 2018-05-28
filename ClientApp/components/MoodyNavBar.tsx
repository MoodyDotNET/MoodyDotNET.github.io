import * as React from 'react';
//import { RouteComponentProps } from 'react-router';
import { Link } from 'react-router-dom';
import { Toolbar, ToolbarGroup, FlatButton, TextField,RaisedButton } from 'material-ui';
import {blueGrey50,white, transparent} from 'material-ui/styles/colors'; 
const transparentBackground = {
    backgroundColor: transparent 
}

export class MoodyNavBar extends React.Component<{}, {}> {
    public render(){
        return (
            <Toolbar className = 'navBar'>
                <ToolbarGroup firstChild={true}>
                    <RaisedButton label='Home'
                        containerElement={<Link to="/"></Link>}
                    />
                    <RaisedButton label='Albums'>
                    
                    </RaisedButton>
                </ToolbarGroup>
            </Toolbar>
        );
    }
}
