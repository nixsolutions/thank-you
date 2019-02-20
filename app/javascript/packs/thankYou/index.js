import React from 'react'
import ReactDOM from 'react-dom'
import Routes from './routes'
import './customJavascripts'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Routes />, document.getElementById('root'),
  );
});
