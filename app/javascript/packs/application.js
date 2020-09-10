// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'bootstrap'
require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')
require('jquery')
require('./libs/adminlte.min.js')
require('./libs/demo.js')
require('./libs/contract.js')

global.toastr = require("toastr")
global.$ = require('jquery')
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
// import '../../assets/stylesheets/application.scss'

//= require bootstrap-datepicker
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr.js
//= require toastr
//= require jquery
//= require jquery_ujs
//= require_tree .

//= require i18n
//= require i18n.js
//= require i18n/translations

//= require rails-timeago
//= require rails-timeago-all
