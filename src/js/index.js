const styles = require('../elm/Stylesheets.elm');
const resume = require('../assets/BlakeZimmermanResume.pdf');
const navIcons = require('../assets/navIcons.svg');
const smoothScroll = require('./smoothScroll');
const Elm = require('../elm/Main.elm');

const app = Elm.Main.embed(document.getElementById('main'));

window.addEventListener('scroll', function() {
  app.ports.scrollDetails.send([window.pageYOffset, window.innerHeight]);
});

app.ports.smoothScroll.subscribe(function([target, offset]) {
  smoothScroll(target, {
    duration: 800,
    offset
  });
});
