var words = [
    "dead",         // 1st -> d
    "bygone",       // 2nd -> y
    "landing",      // 3rd -> n
    "cheaply",      // 4th -> a
    "assumed",      // 5th -> m
    "incorrectly",  // 1st -> i
    "attention",    // 2nd -> t
    "agent"         // 3rd -> e
];


function decod(array){
var word = ""
  array.forEach(function(string,index){
    word = word + string[index%5]
  })
  return word
}

console.log (decod(words))



function reverse (sentence){
  var array = sentence.split(" ")
  array = array.reverse()
}

function even(array){
  array = array.filter(function(word,index){
    return (index+1)%2 === 0
  })
  return array
}


function odd(array){
  array = array.filter(function(word,index){
    return (index+1)%2 != 0
  })
  return array
}
