//document.getElementById('myCanvas').dataset.processingSources
var index = 1;
var numSketches = 7; //upper limit, set to the highest number sketch that you have in the file.
function next(){
    console.log('poop');
  index++;
  updateSketch();
}

function prev(){
  console.log('piss');
  index--;
  updateSketch();
}

function updateButtons(){
}

/*
var sketches = ["sketchname1", "example", "test"];
function nextSketch(){
              var currentLoc = $.inArray($('#canvas').attr('name'), sketches);
              currentLoc ++;
              if(currentLoc >= sketches.length){
                              currentLoc = 0;
                            }
              var htmlStr = '<canvas id="canvas" name="' + sketches[currentLoc] + '" data-processing-sources="' + sketches[currentLoc] + '.pde"></canvas>';
              console.log(htmlStr);
      $('#canvas').replaceWith(htmlStr);
      Processing.reload();
}

*/

function updateSketch(){
  var canvasDiv = document.getElementById('canvas-wrapper');
  canvasDiv.innerHTML = ''; //clear out the current canvas

  var testStr = "<canvas id='myCanvas' data-processing-sources='assets/primitive"+index+".pde'></canvas>";
  console.log(testStr);
  canvasDiv.innerHTML = testStr;
  Processing.reload();
}


