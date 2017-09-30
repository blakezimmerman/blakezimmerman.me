const styles = require('../elm/Stylesheets.elm');
const firaCode = require('../assets/FiraCode-Regular.woff');
const navIcons = require('../assets/navIcons.svg');
const resume = require('../assets/BlakeZimmermanResume.pdf');
const smoothScroll = require('./smoothScroll');
const Elm = require('../elm/Entry.elm');

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
