
// ejercicio 1

var example_array = [2,-5,10,5,4,-10,0];

function process (array){
  var result = [];
  array.forEach(function(number1, index1){
    array.forEach(function(number2,index2){
      if (number1+number2 == 0){
        result.push(index1.toString() + "," + index2.toString())
      }
    })
  })
return result
}

//ejerccio 2

console.log (process(example_array))

var numbers = "80:70:90:100";

function average(string){
  sum = 0;
var array = string.split(":");
var n = array.length;
array.forEach(function(a){
  sum = sum + parseInt(a)

})
return (sum/n);
}


//ejercicio 3

function checkInPassenger(name, customersArray) {
	var passengerChecked;
	for (var i = 0; i<customersArray.length; i++) {
		if (customersArray[i] == name) {
			 return function() {
        console.log ("Hi, " + name + "You’re passenger #" + (i+1));
      };
    }
  }
}

var flightToBali = ["Wayan", "Putu", "Gede", "Ni Luh", "Nyoman"];
var counterCheckIn = checkInPassenger("Gede", flightToBali);
counterCheckIn();
