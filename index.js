require('./src/Stylesheets.elm');

const Elm = require('./src/Main.elm');
const app = Elm.Main.embed(document.getElementById('main'));

window.addEventListener('scroll', function(e) {
  app.ports.scrollPercent.send(window.pageYOffset / window.innerHeight * 100);
});
