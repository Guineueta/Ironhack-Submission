
var Viking = function(name, health, strength ){
  this.name = name
  this.health = health
  this.strength = strength
}

var Saxon = function(){
  this.health = Math.floor((Math.random() * 100) + 1);
  this.strength = Math.floor((Math.random() * 50) + 1);
}


  var viking1 = new Viking("Kuidt",250,70)
  var viking2 = new Viking("Ivy",300,55)
  var viking3 = new Viking("Dakmon",300,70)
  var viking4 = new Viking("Sheka",310,75)
  var viking5 = new Viking("Tank",340,75)

  var arrayViking = [
    viking1,
    viking2,
    viking3,
    viking5,
    viking5
  ]


var saxon1 = new Saxon()
var saxon2 = new Saxon()
var saxon3 = new Saxon()
var saxon4 = new Saxon()
var saxon5 = new Saxon()
var saxon6 = new Saxon()
var saxon7 = new Saxon()
var saxon8 = new Saxon()
var saxon9 = new Saxon()
var saxon10 = new Saxon()
var saxon11 = new Saxon()
var saxon12 = new Saxon()
var saxon13 = new Saxon()
var saxon14 = new Saxon()
var saxon15 = new Saxon()
var saxon16 = new Saxon()
var saxon17 = new Saxon()
var saxon18 = new Saxon()
var saxon19 = new Saxon()
var saxon20 = new Saxon()
var saxon21 = new Saxon()
var saxon22 = new Saxon()
var saxon23 = new Saxon()
var saxon24 = new Saxon()

var arraySaxons = [
  saxon1,
  saxon2,
  saxon3,
  saxon4,
  saxon5,
  saxon6,
  saxon7,
  saxon8,
  saxon9,
  saxon10,
  saxon11,
  saxon12,
  saxon13,
  saxon14,
  saxon15,
  saxon16,
  saxon17,
  saxon18,
  saxon19,
  saxon20,
  saxon21,
  saxon22,
  saxon23,
  saxon24
]

function pitFight(){
  vikingA = arrayViking[(Math.floor((Math.random() * (arrayViking.length-1)) + 0))]
  vikingB = arrayViking[(Math.floor((Math.random() * (arrayViking.length-1)) + 0))]

  while (vikingA == vikingB) {
    vikingB = arrayViking[(Math.floor((Math.random() * (arrayViking.length-1)) + 0))]
  }

  turns = Math.floor((Math.random() * 10) + 1);
  console.log(turns)

  while (turns > 0 && vikingA.health > 1 && vikingB.health > 1){
    console.log(turns)
    console.log( vikingA.name + " attack " + vikingB.name)

      if (vikingB.health - vikingA.strength > 1){
        vikingB.health = vikingB.health - vikingA.strength
      } else {
        vikingB.health = 1
      }
    console.log( vikingB.name + " attack " + vikingA.name)
      if (vikingA.health - vikingB.strength > 1){
        vikingA.health = vikingA.health - vikingB.strength
      } else {
        vikingA.health = 1
      }
      turns = turns - 1
      console.log(vikingA)
      console.log(vikingB)
  }
console.log("The vikings are ready for the fight")
}


function finalFight(){
  var initialNumberVikings = arrayViking.length
  var initialNumberSaxons = arraySaxons.length
  turns = Math.floor((Math.random() * 8) + 5);
  while (turns>0 && arrayViking.length >0 && arraySaxons.length>0){
    setTimeout(fuction(){},1000)
      console.log(turns)
      setTimeout(fuction(){},1000)
      arrayViking.forEach(function(viking){
        setTimeout(fuction(){},1000)
        if (arraySaxons.length > 0){
          poorSaxon = arraySaxons[(Math.floor((Math.random() * (arraySaxons.length-1)) + 0))]
          console.log( viking.name + " and poorSaxon attack each other with "+ viking.strength + "and "+poorSaxon.strength +"respectivaly")
setTimeout(fuction(){},1000)
          viking.health = viking.health - poorSaxon.strength
          poorSaxon.health = poorSaxon.health - viking.strength
setTimeout(fuction(){},1000)
          console.log( viking.name + " has " + viking.health + " health")
setTimeout(fuction(){},1000)
          console.log( "poorSaxon has " + poorSaxon.health + " health")
          if (viking.health < 0){
setTimeout(fuction(){},1000)
            console.log(viking.name + " is dead !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
          }
          if (poorSaxon.health < 0){
setTimeout(fuction(){},1000)
            console.log("poorSaxon is dead !!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
          }
          arraySaxons = arraySaxons.filter(function(saxon){
            return saxon.health > 0
          })
        }
      })

    arrayViking = arrayViking.filter(function(viking){
      return viking.health > 0
    })
    turns = turns-1
    setTimeout(fuction(){},1000)
    console.log("+++++++++++++++++++++")
    setTimeout(fuction(){},1000)
  }

  var vikingsDeads = -(-initialNumberVikings + arrayViking.length)
  var saxonsDeads = -(-initialNumberSaxons + arraySaxons.length)
  var vikingsDeadsPercentage = (vikingsDeads/initialNumberVikings)*100
  var saxonsDeadsPercentage = (saxonsDeads/initialNumberSaxons)*100
  console.log("------------------------------------------------")
  console.log( vikingsDeads + "Vikings died during the battle")
  console.log( saxonsDeads + "saxons died during the battle")
  console.log("------------------------------------------------")
 if (arraySaxons.length == 0){
   console.log("All the Saxons are dead, VIKINGS WON THE WAR!!!")
 } else if(arrayViking.length == 0){
   console.log("All the Vikings are dead SAXONS WON THE WAR!!!")
 } else if(vikingsDeadsPercentage > saxonsDeadsPercentage){
   console.log("SAXONS WON THE WAR!!!, the population of Viking has been reduce a " + vikingsDeadsPercentage+ "%" )
 } else if(vikingsDeads < saxonsDeads){
   console.log("VIKINGS WON THE WAR!!!, the population of Saxons has been reduce a " + saxonsDeadsPercentage+ "%")
 }

}



pitFight()

console.log("*******************************")

finalFight()

setTimeout(fuction(){},1000)













// console.log(Math.floor((Math.random() * (arrayViking.length-1)) + 0))
