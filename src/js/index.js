const navIcons = require("../assets/navIcons.svg");
const resume = require("../assets/BlakeZimmermanResume.pdf");
const logo = require("../assets/logo.svg");
const signature = require("../assets/signature.svg");
const myPicture = require("../assets/blake.jpg");
const walmartLogo = require("../assets/walmartlogo.jpg");
const jetLogo = require("../assets/jetlogo.jpg");
const baeLogo = require("../assets/baelogo.jpg");
const stevensLogo = require("../assets/stevenslogo.jpg");
const linkedinLogo = require("../assets/linkedin.svg");
const githubLogo = require("../assets/github.svg");

const { Elm } = require("../elm/Main.elm");
const smoothScroll = require("./smoothScroll");

const app = Elm.Main.init({ node: document.getElementById("main") });

window.addEventListener("scroll", function() {
  app.ports.scrollDetails.send([window.pageYOffset, window.innerHeight]);
});

app.ports.smoothScroll.subscribe(function([target, offset]) {
  smoothScroll(target, {
    duration: 800,
    offset
  });
});

app.ports.resizeHeight.subscribe(function(id) {
  const elem = document.getElementById(id);

  elem.style.height = elem.clientHeight ? 0 : elem.scrollHeight + "px";
});
