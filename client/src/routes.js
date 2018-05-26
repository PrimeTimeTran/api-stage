import React, { Component } from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import createBrowserHistory from 'history/createBrowserHistory';

import Home from './pages/Home';
import Messages from './pages/Messages';
import About from './pages/About';
import NotFound from './pages/NotFound';

const history = createBrowserHistory();
const Routes = () =>
    <Router history={history}>
      <Switch>
        <Route path='/' exact component={Home} />
        <Route path='/messages' exact component={Messages} />
        <Route path='/about' exact component={About} />
        <Route component={NotFound} />
      </Switch>
    </Router>

export default Routes;
