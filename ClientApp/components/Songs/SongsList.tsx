import * as React from 'react';
import { RouteComponentProps } from 'react-router';
import { Card, CardMedia, CardTitle, CardText, CardActions, RaisedButton, CardHeader } from 'material-ui';
import { blueGrey100, white } from 'material-ui/styles/colors';

interface songInterface {
    songs: Array<any>
}


const style = {
    card: {
        opacity: 0.8,
    },
    title: {
        height: '7vh',
        padding: '0px 16px',
    },
    cover: {
        textAlign: 'center',
        height: '30vh',
        backgroundColor: blueGrey100,
        color: white,
    },
    description: {
        height: '10vh'
    },
    background: {
        backgroundImage: 'URL("/img/songBackground.jpg")'
    }
};


export class SongsList extends React.Component<RouteComponentProps<{}>, songInterface>{
    constructor(props: RouteComponentProps<{}>) {
        super(props);
        this.state = { songs: [], }
        fetch('api/playMusic/listSong?searchField=a')
            .then(response => response.json() as Promise<any>)
            .then(data => {
                console.log(data);
                this.setState({ songs: data });
            })

    }

    public render() {
        return (
            <div className='songs-list sections' style={style.background}>
                <div className='col-12'>
                    <div className='container'>
                        <div className='row'>
<<<<<<< HEAD
                            <div className='col-10 col-sm-8 col-md-7 col-lg-4'>
                                <Card style={style.card}>
                                    <CardHeader title="Prototype"/>
                                    <CardMedia
                                        overlay={<CardTitle style={style.title} title='Song title'/>}
                                    >
                                        <div style={style.cover}>Cover</div>
                                    </CardMedia>
                                    <CardText style={style.description}>
                                        By: artist<br/>
                                        Date released: date<br/>
                                        Album: <a>album name</a>
                                    </CardText>
                                    <CardActions>
                                        <RaisedButton label='Hear it' primary={true}/>
                                        <RaisedButton label='Add to playlist' primary={true}/>
                                    </CardActions>
                                </Card>
                            </div>
                            {this.state.songs.map((song:any,index:number)=>
=======
                            {this.state.songs.map((song: any, index: number) =>
>>>>>>> 29ff9245297e5cd5ec444d0b214497988fb8964b
                                <div className='col-10 col-sm-8 col-md-7 col-lg-4' key={index}>
                                    <Card style={style.card}>
                                        <CardHeader title="Test with sample data json" />
                                        <CardMedia
                                            overlay={<CardTitle style={style.title} title={song.title} />}
                                        >
                                            <div style={style.cover}>{song.cover}Cover</div>
                                        </CardMedia>
                                        <CardText style={style.description}>
                                            By: artist<br />
                                            Date released: date<br />
                                            Album: <a>album name</a>
                                        </CardText>
                                        <CardActions>
                                            <RaisedButton label='Hear it' primary={true} />
                                        </CardActions>
                                    </Card>
                                </div>
                            )}
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}