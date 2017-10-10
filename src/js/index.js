const styles = require('../elm/Stylesheets.elm');
const firaCode = require('../assets/FiraCode-Regular.woff');
const navIcons = require('../assets/navIcons.svg');
const resume = require('../assets/BlakeZimmermanResume.pdf');
const myPicture = require('../assets/blake.jpg');
const jetLogo = require('../assets/jetlogo.jpg');
const baeLogo = require('../assets/baelogo.jpg');
const stevensLogo = require('../assets/stevenslogo.jpg');
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
