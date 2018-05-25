import React, { Component } from 'react'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import Home from './pages/Home'
import Messages from './pages/Messages'
import About from './pages/About'
import NotFound from './pages/NotFound'

class App extends Component {
  render () {

    return <div style={{ backgroundColor: '#e9ebee', height: '100vh' }}>
      <Router>
        <Switch>
          <Route path='/' exact component={Home} />
          <Route path='/about' exact component={About} />
          <Route path='/messages' exact component={Messages} />
          <Route component={NotFound} />
        </Switch>
      </Router>
    </div>
  }
}

export default App
