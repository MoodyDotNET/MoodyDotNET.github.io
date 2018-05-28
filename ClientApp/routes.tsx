import * as React from 'react';
import { Route } from 'react-router-dom';
import { Layout } from './components/Layout';
import { Home } from './components/Home';
import { FetchData } from './components/FetchData';
import { Counter } from './components/Counter';
import { MoodyHomeBody } from './components/home/MoodyHomeBody';

export const routes = (
    <Layout>
        <Route exact path='/' component={ MoodyHomeBody } />
        <Route path='/counter' component={ Counter } />
        <Route path='/fetchdata' component={ FetchData } />
        <Route path='/home' component={ Home }/>
    </Layout>
);
