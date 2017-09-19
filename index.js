require('./src/Stylesheets.elm');
require('./src/Assets/BlakeZimmermanResume.pdf');

const Elm = require('./src/Main.elm');
const app = Elm.Main.embed(document.getElementById('main'));
