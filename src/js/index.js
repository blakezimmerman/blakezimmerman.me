require('../elm/Stylesheets.elm');
require('../assets/BlakeZimmermanResume.pdf');

const Elm = require('../elm/Main.elm');
const app = Elm.Main.embed(document.getElementById('main'));

const smoothScroll = require('./smoothScroll');

app.ports.smoothScroll.subscribe(function([target, offset]) {
  smoothScroll(target, {
    duration: 800,
    offset,
    container: '.mainBody'
  });
});
