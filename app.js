//document.getElementById('myCanvas').dataset.processingSources
var index = 1;
var numSketches = 7; //upper limit, set to the highest number sketch that you have in the file.

function next() {
  console.log('poop');
  index++;
  updateSketch();
}

function prev() {
  console.log('piss');
  index--;
  updateSketch();
}


function updateButtons() {
  //if current index is great than 1, then the - button should be on
  //  add the button listener
  //  remove the off class from the button, add the on class
  //else the minus button should be off
  //  remove the on class from the button
  //  add the off class
  //  remove the button listener
  var prevButton = document.getElementById("prev")

  if (index > 1) {
    prevButton.addEventListener("click", prev);
    prevButton.classList.remove('off');
    prevButton.classList.add('on');
  } else {
    prevButton.removeEventListener("click", prev);
    prevButton.classList.remove('on');
    prevButton.classList.add('off');
  }

  var nextButton = document.getElementById("next");

  if(index < numSketches) {
    nextButton.addEventListener("click", next);
    nextButton.classList.remove("off")
    nextButton.classList.add("on");
  } else {
    nextButton.classList.remove("on");
    nextButton.classList.add("off");
    nextButton.removeEventListener("click", next);
  }

  //if the current index is less than or equal to the number of sketches,
  //  add the button listener
  //  remove the off class
  //  add the on class ot the ubtton
  //else 
  //  remove the on class
  //  add the off class
  //  remove the button listener
}

function updateSketch() {
  var canvasDiv = document.getElementById('canvas-wrapper');
  canvasDiv.innerHTML = ''; //clear out the current canvas

  var testStr =
    "<canvas id='myCanvas' data-processing-sources='assets/primitive" + index +
    ".pde'></canvas>";
  console.log(testStr);
  canvasDiv.innerHTML = testStr;
  Processing.reload();

  updateButtons(); 
}

updateButtons();
