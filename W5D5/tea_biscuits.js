

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaBiscuit (question){
  let responseOne
  let responseTwo
  const doDontOne
  const doDontTwo

  reader.question("Do you want some tea?", (user_response) => {
    responseOne = user_response));
  });

  if (responseOne === "yes"){
    doDontOne = "do"
  } else {
    doDontOne = "don't"
  }

  reader.question("Do you want biscuits?", (user_response => {
    responseTwo = user_response);
  });

  if (responseTwo === "yes"){
    doDontTwo = "do"
  } else {
    doDontTwo = "don't"
  }

  console.log("So you ${doDontOne} want tea and you ${doDontTwo} want coffee.")

  reader.close
}
