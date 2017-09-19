require('./src/Styles/Stylesheets.elm');

const Elm = require('./src/Main.elm');
const app = Elm.Main.embed(document.getElementById('main'));
