require('../elm/Stylesheets.elm');
require('../assets/BlakeZimmermanResume.pdf');

const Elm = require('../elm/Main.elm');
const app = Elm.Main.embed(document.getElementById('main'));

app.ports.smoothScroll.subscribe(function(args) {
  console.log("TODO - Smooth Scroll");
});
