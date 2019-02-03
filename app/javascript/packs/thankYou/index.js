import React from 'react'
import ReactDOM from 'react-dom'
import Routes from './routes'
import './customJavascripts/closeButton'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Routes />, document.getElementById('root'),
  );
});
