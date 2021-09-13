import React from "react";
import ReactDOM from "react-dom";

import Game from "./components/game"

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById("root");
  // const test = <h1>T</h1>;
  ReactDOM.render(<Game /> ,root)
})