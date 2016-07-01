// var person = {
//
// }
//
// var person2 = new Object()
//
// person["name"] = "Thor"
//
// person2.name = "Matias"
//
// person.sayHi = function(){console.log("my name is "+ this.name)}
//
// person.sayHi()
//
// var Ejemplo = function(name){
//   this.name = name;
// }
//
// Ejemplo.prototype.sayHi = function(){
//   console.log(this.name)
// }
//
// var mike = new Ejemplo("Mike")
//
// mike.sayHi();
//
// function callback1() {
//   console.log("hi")
// }
//
// function hightorder(callback){
//   callback();
// }
//
// hightorder(callback1);
//
// callback1()


// function blastOff(time){
//
//   console.log(time)
//   time = time-1
//   if (time > 0) {
//     setTimeout(function(){blastOff(time)},1000)
//   } else {
//     console.log("blastOff")
//   }
// }
//
//
//
//
// blastOff(3600)



 function a(){console.log("suuu")}

function repeat(a){
  n=0
  if (n<5){
    setTimeout(function(){a()},1000)
    repeat(a)
  }
}

repeat(a)
