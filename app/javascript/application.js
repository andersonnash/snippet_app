// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'flowbite';
import "flowbite/dist/flowbite.turbo.js";
import 'flowbite-datepicker';
import 'flowbite/dist/datepicker.turbo.js';

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('DOMContentLoaded', function() {
  if (typeof Rails !== 'undefined') {
    console.log('Rails UJS is loaded and started');
  } else {
    console.log('Rails UJS is not loaded');
  }
});
