// madLib

const madLib = (verb, adj, noun) => {
  "We shall $(verb) the $(adj) $(noun)."
}

// isSubstring
const isSubstring = (searchString, subString) => {
  ( searchString.indexOf(subString) !== 1 ) ? return true : return false;
}


// fizzBuzz

const fizzBuzz = (array) => {
  for(let i = 0; i < array.length; i++){
    if (array[i] % 15 == 0) {
      console.log("fizzbuzz");
    } else if (array[i] % 3 == 0) {
      console.log("fizz");
    } else if (array[i] % 5 == 0) {
      console.log("buzz");
    } else {
      console.log(array[i])
    }
  }
}

// isPrime

const isPrime = (number) => {
  for (let i = 2; i < number; i++){
    if (number % i == 0){
      return false
    }
  }
  return true
}


// Phase I: Callbacks

const titleize = (names, printCallback) => {
  let new_arr = names.map{name =>
    "Mx. $(name) Jingleheimer Schmidt"
  }

  const printCallback = new_arr.forEach(new_name){
    console.log(new_name)
  }
}
