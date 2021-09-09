// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  typeWriter();
});

var i = 0;
var txt = 'Enjoy life on a budget!'; /* The text */
var speed = 70; /* The speed/duration of the effect in milliseconds */

function typeWriter() {
  if (i < txt.length) {
    document.getElementById("javascript").innerHTML += txt.charAt(i);
    i++;
    setTimeout(typeWriter, speed);
  }
}

import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';

import { initAutocomplete } from "../plugins/init_autocomplete";

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initAutocomplete();
})
