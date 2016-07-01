function caesarCipher (message, shift) {
  messageEncrip = []
  message = message.split(" ")
  message.forEach(function(word){
    wordEncrip = ""
    word.split("").forEach(function(letter){

      if (letter >= "A" && letter <= "Z") {
        newchar = letter.charCodeAt(0)+ shift
        console.log(newchar)
        while  (newchar < 65 || newchar > 90){
          if (newchar < 65){
            newchar = newchar + 26
          } else if(newchar > 90) {
            newchar = newchar - 26
          }
        }
      wordEncrip = wordEncrip + String.fromCharCode(newchar);
      console.log("1A");
      }
      else if (letter >= "a" && letter <= "z") {
        newchar = letter.charCodeAt(0)+ shift
        console.log(newchar);
        while  (newchar < 97 || newchar > 122){
          if (newchar < 97){
            newchar = newchar + 26
          } else if(newchar > 122) {
            newchar = newchar - 26
          }
        }
      wordEncrip = wordEncrip + String.fromCharCode(newchar);
      console.log("1a");
      }
      else{
      wordEncrip = wordEncrip + letter;
      console.log("2");
      }
    })
    messageEncrip.push(wordEncrip)
  })
return messageEncrip
}



var encrypted = caesarCipher("Et tu, brute?", -10000);

console.log(encrypted)
console.log("{".charCodeAt(0))
