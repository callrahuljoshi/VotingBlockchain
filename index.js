web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
abi = JSON.parse('[{"constant":false,"inputs":[{"name":"_fname","type":"string"},{"name":"_lname","type":"string"},{"name":"_email","type":"string"},{"name":"_password","type":"string"}],"name":"addNewUser","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"users","outputs":[{"name":"fname","type":"string"},{"name":"lname","type":"string"},{"name":"email","type":"string"},{"name":"password","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"userlist","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getUsersCount","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"getUserList","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]');
VotingContract = web3.eth.contract(abi);

// In your nodejs console, execute contractInstance.address to get the address at which the contract is deployed and change the line below to use your deployed address
contractInstance = VotingContract.at('0x22a63442bd7e5e894a2a6623e8d3ff33fc37b740');
candidates = {"Rama": "candidate-1", "Nick": "candidate-2", "Jose": "candidate-3"}

function voteForCandidate() {
  candidateName = $("#candidate").val();
  contractInstance.voteForCandidate(candidateName, {from: web3.eth.accounts[0]}, function() {
    let div_id = candidates[candidateName];
    $("#" + div_id).html(contractInstance.totalVotesFor.call(candidateName).toString());
  });
}

function addNewCandidate() {
  debugger; 
 candidateName = $("#newcandidate").val();
   debugger;
   contractInstance.addNewCandidate(candidateName, {from:web3.eth.accounts[0], gas: 500000});
   debugger;
   var numberOfCandidates = contractInstance.fncandidateListLen();
   var candidateNameAdded = contractInstance.getUser(0);

   //var success = contractInstance.addNewCandidate.call(candidateName);
   debugger;
   $("#candidatelistlen").html(numberOfCandidates.c[0].toString());
 
}

function fncandidateListLen() {
  var val = contractInstance.fncandidateListLen.call();
  $("#candidatelistlen").html(val.c[0].toString());
debugger;
}

function addUser() {
  debugger; 
  name = $("#newuser").val();
   debugger;
   contractInstance.addUser(name, {from:web3.eth.accounts[0], gas: 500000});
   debugger;
   var numberOfUsers = contractInstance.getUsersCount();
   //var UserNameAdded = contractInstance.getUserinfo({from:web3.eth.accounts[0], gas: 500000});
  var usernameadded = contractInstance.getUserinfo.call();
  
   //var success = contractInstance.addNewCandidate.call(candidateName);
   debugger;
   $("#userlistlen").html(numberOfUsers.c[0].toString());
   $("#userlist").html(UserNameAdded);

 
}




$(document).ready(function() {
  debugger;
  candidateNames = Object.keys(candidates);
  for (var i = 0; i < candidateNames.length; i++) {
    let name = candidateNames[i];
    let val = contractInstance.totalVotesFor.call(name).toString()
    $("#" + candidates[name]).html(val);
  }
});

