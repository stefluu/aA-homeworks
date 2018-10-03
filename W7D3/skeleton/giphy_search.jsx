import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import fetchSearchGiphys from './util/api_util';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  window.fetchSearchGiphys = fetchSearchGiphys
  const store = configureStore();
  window.store = store;
  // ReactDOM.render(root);
})
