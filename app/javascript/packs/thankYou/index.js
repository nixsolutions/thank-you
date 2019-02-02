import React from 'react'
import ReactDOM from 'react-dom'
import Routes from './routes'
import closeButton from './customJavascripts/closeButton'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Routes />, document.getElementById('root'),
  );

  closeButton();
});
