import * as React from 'react';
import { NavLink, Link } from 'react-router-dom';
import Song from '../../model/Song';
import { Card, CardTitle, CardMedia, CardActions, RaisedButton, FlatButton } from 'material-ui';
interface INewSong {
    newSong: Array<any>,
    loading: boolean,
}
const style = {
    noResult: {
        width: "250px",
        marginTop: "15vh",
        opacity: 0.8
    },
    cover: {
        height: '40vh',
    },
    background: {
        background: 'URL("/img/songBackground.jpg")'
    }
}

export class HomeSession2 extends React.Component<{}, INewSong>{
    constructor(props: any) {
        super(props);
        this.state = { newSong: [], loading: true };

        fetch('/api/song/suggested')
            .then(response => response.json() as Promise<Array<any>>)
            .then(data => {
                this.setState({ newSong: data, loading: false })
            })
    }
    public render() {
        let content = this.state.loading ? this.renderLoading() : this.renderSong();
        return (
            <div className='col-12 section2 sections songlist' style={style.background}>
                <div className='container'>
                    <div className='row justify-content-center'>
                        <div className="col-12" style={{ textAlign: 'center' }}>
                            <h3 className="header">
                                Popular Song
                            </h3>
                        </div>
                        {content}
                    </div>
                    <div>
                        <NavLink to={`/songs/all`}><p className='link'>More songs</p></NavLink>
                    </div>
                </div>
            </div>

        );
    }

    private renderSong() {
        return (
            this.state.newSong.map((song: Song, index: number) =>
                <div className='col-sm-9 col-md-6 col-lg-4 card' key={index}>
                    <Card>
                        <CardMedia
                            overlay={
                                <CardTitle
                                    title={`${song.title} ${song.subtitle}`}
                                />
                            }
                        >
                            <img style={style.cover} src={`/img/song/${song.songCode}.jpg`} />
                        </CardMedia>
                        <CardActions>
                            <RaisedButton
                                label="Hear it"
                                primary={true}
                                containerElement={
                                    <Link to={`/song/${song.songCode}`} />
                                }
                                className="btn"
                            />
                        </CardActions>
                    </Card>
                </div>
            )

        );
    }

    private renderLoading() {
        return (
            <Card style={style.noResult}>
                <CardTitle>
                    <img className="loader-gif" src="/img/loader1.gif" />
                    <span className="loader-text">Loading</span>
                </CardTitle>
            </Card>

        );
    }
}