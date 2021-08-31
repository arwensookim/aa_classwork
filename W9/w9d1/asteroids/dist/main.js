/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\")\n\nconst DEFAULTS = {radius:15, color:\"blue\"}\n\nfunction Asteroid(options, game) {\n    options.vel = options.vel || Util.randomVector(Math.random() * 1 + 1);\n    options.radius = options.radius || DEFAULTS.radius;\n    options.color = options.color || DEFAULTS.color;\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n    this.game = game;\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.explode = function() {\n    console.log(`${this.name} explodes!`);\n}\n\nAsteroid.prototype.collideWith = function(otherObject) {\n    if (otherObject instanceof Ship) {\n        otherObject.relocate();\n        console.log(otherObject);\n    }\n};\n\nmodule.exports = Asteroid;\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("// const Util = require(\"./utils.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\n\n\nfunction Game() {\n  this.DIM_X = 500;\n  this.DIM_Y = 500;\n  this.NUM_ASTEROIDS = 6;\n  this.asteroids = this.addAsteroids(6);\n  this.ship = new Ship({pos: this.randomPosition(), color: \"red\"}, this);\n}\n\n\nGame.prototype.allObjects = function allObjects() {\n    let all = this.asteroids.concat([this.ship]);\n    return all;\n};\n\n\nGame.prototype.addAsteroids = function addAsteroids(num) {\n  let res = [];\n  for (let i = 0; i < num; i++) {\n    res.push(new Asteroid({ pos: this.randomPosition() }, this));\n  };\n  return res;\n};\n\nGame.prototype.randomPosition = function randomPosition() {\n  return [\n    this.DIM_X * Math.random(),\n    this.DIM_Y * Math.random()\n  ];\n};\n\nGame.prototype.draw = function draw(ctx) {\n  ctx.clearRect(0,0, this.DIM_X, this.DIM_Y);\n  let all = this.allObjects();\n  for (let i=0; i < all.length; i++) {\n     all[i].draw(ctx);\n    }\n};\n\nGame.prototype.moveObjects = function moveObjects() {\n    let all = this.allObjects();\n    for (let i=0; i < all.length; i++) {\n      all[i].move();\n    }\n};\n\nGame.prototype.wrap = function wrap(pos) {\n    let pos1 = pos[0];\n    let pos2 = pos[1];\n    if (pos1 > this.DIM_X) {pos1 = pos1 - this.DIM_X} else if (pos1 < 0) {pos1 = pos1 + this.DIM_X};\n    if (pos2 > this.DIM_Y) {pos2 = pos2 - this.DIM_Y} else if (pos2 < 0) {pos2 = pos2 + this.DIM_Y};\n    return [pos1,pos2];\n};\n\nGame.prototype.checkCollisions = function checkCollisions() {\n  for (let i1 = 0; i1 < this.asteroids.length; i1++) {\n    for (let i2 = i1 + 1; i2 < this.asteroids.length; i2++) {\n      if (this.asteroids[i1].isCollidedWith(this.asteroids[i2])) {\n        this.asteroids[i1].collideWith(this.asteroids[i2]);\n      }\n    }\n  }\n};\n\nGame.prototype.step = function step() {\n  this.moveObjects();\n  this.checkCollisions();\n};\n\nGame.prototype.remove = function remove(asteroid) {\n  let astI = this.asteroids.indexOf(asteroid);\n  this.asteroids.splice(astI, 1);\n};\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module) => {

eval("function GameView(game, ctx) {\n  this.game = game;\n  this.ctx = ctx;\n};\n\nGameView.prototype.start = function start() {\n  setInterval(()=>{ \n    this.game.step(); \n    this.game.draw(this.ctx); \n  }, 20);\n};\n\n\n\nmodule.exports = GameView\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("console.log(\"webpack is working!\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\nwindow.Util = Util;\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\n\ndocument.addEventListener(\"DOMContentLoaded\", function(){\n    console.log('DOM fully loaded and parsed');\n    const canvas = document.getElementById(\"mycanvas\");\n    canvas.width = 500;\n    canvas.height = 500;\n  \n    const ctx = canvas.getContext(\"2d\");\n    const game = new Game();\n    // console.log(game.asteroids);\n    const gameView = new GameView(game, ctx);\n    gameView.start();\n\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("// base class for anything that moves\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nfunction MovingObject(options, game) {\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n    this.game = game;\n}\n\nMovingObject.prototype.move = function() {\n    this.pos = Util.addVectors(this.pos, this.vel);\n    this.pos = this.game.wrap(this.pos);\n}\n\nMovingObject.prototype.draw = function(ctx) {\n    ctx.beginPath();\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI, true);\n    // ctx.strokeStyle = \"green\";\n    // ctx.lineWidth = 5;\n    ctx.stroke();\n    ctx.fillStyle = this.color;\n    ctx.fill();\n}\n\nMovingObject.prototype.isCollidedWith = function(otherMovingObject) {\n    let dist = Util.getDistance(otherMovingObject.pos, this.pos);\n    let bool = dist <= (this.radius + otherMovingObject.radius);\n    // console.log(bool);\n    // console.log(dist);\n    return bool;\n}\n\nMovingObject.prototype.collideWith = function(otherMovingObject) {\n    // this.game.remove(otherMovingObject);\n    // this.game.remove(this);\n    \n};\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\")\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\")\n\nUtil.inherits(Ship, MovingObject);\n\nfunction Ship(options, game) {\n  this.pos = options.pos;\n  this.radius = 10;\n  this.vel = [0,0];\n  this.color = \"red\";\n  this.game = game;\n};\n\nShip.prototype.relocate = function() {\n  this.pos = this.game.randomPosition();\n  this.vel = [0,0];\n};\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("// utility functions // math functions\n\nconst Util = {\n\n    inherits: function inherit(childClass, parentClass){\n        function Surrogate() {};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate;\n        childClass.prototype.constructor = childClass;\n    },\n\n    addVectors: function addvectors(vector1, vector2) {\n        return [vector1[0] + vector2[0], vector1[1] + vector2[1]];\n    },\n\n    randomVector: function randomVector(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n\n    scale: function scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    },\n\n    getDistance: function getDistance(vector1, vector2) {\n        let res = [vector1[0] - vector2[0], vector1[1] - vector2[1]];\n        return Math.sqrt(Math.pow(res[0],2) + Math.pow(res[1],2));\n    }\n\n}\n\n\nmodule.exports = Util\n\n\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;