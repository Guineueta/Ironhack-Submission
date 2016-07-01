var Car = function(model, noise) {
  this.model = model;
  this.noise = noise;
}

Car.prototype.wheels = 4
Car.prototype.noise = function(){
  console.log(this.noise)
}

car1 = new Car("golf","bruuuu")


console.log(car1.noise)
