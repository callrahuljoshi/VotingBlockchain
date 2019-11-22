pragma solidity ^0.4.6;
// We have to specify what version of compiler this code will compile with

contract Voting {
  /* mapping field below is equivalent to an associative array or hash.
  The key of the mapping is candidate name stored as type bytes32 and value is
  an unsigned integer to store the vote count
  */
  
  mapping (bytes32 => uint8) public votesReceived;
  
  /* Solidity doesn't let you pass in an array of strings in the constructor (yet).
  We will use an array of bytes32 instead to store the list of candidates
 */
  
  bytes32[] public candidateList;
  string[] public candidateListString;
  uint256 public candidateListLen;
  string public userlist;
  /* This is the constructor which will be called once when you
  deploy the contract to the blockchain. When we deploy the contract,
  we will pass an array of candidates who will be contesting in the election
  */
  function Voting(bytes32[] candidateNames) {
    candidateList = candidateNames;
  }

  // This function returns the total votes a candidate has received so far
  function totalVotesFor(bytes32 candidate) returns (uint8) {
    if (validCandidate(candidate) == false) throw;
    return votesReceived[candidate];
  }

  // This function increments the vote count for the specified candidate. This
  // is equivalent to casting a vote
  function voteForCandidate(bytes32 candidate) {
    if (validCandidate(candidate) == false) throw;
    votesReceived[candidate] += 1;
  }

//This function adds a new candidate to the candidate list
function addNewCandidate(bytes32 candidatename) returns (bool) {
  candidateList.length++;
  candidateList[candidateList.length-1] = candidatename;
  return true;
}

function fncandidateListLen() public constant  returns(uint) {
 return candidateList.length;
}

function getUser(uint index) public constant returns(bytes32) {
        return (candidateList[index]);
}

function validCandidate(bytes32 candidate) returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
}

struct User {
        string name;
    }
    User[] public users;

    function addUser( string _name) public returns(uint) {
        users.length++;
        users[users.length-1].name = _name;
        return users.length;
    }

    function getUsersCount() public constant returns(uint) {
        return users.length;
    }

    function getUserinfo() public constant returns(string) {
      for (uint i = 0;i < users.length;i++) {
      userlist = strConcat(userlist, users[i].name, " ", "", ",");
      //userlist = userlist + users[i].name + ",";
      }
       return userlist;//"Tst";//userlist;
    }
   function strConcat(string _a, string _b, string _c, string _d, string _e) internal returns (string) {
    bytes memory _ba = bytes(_a);
    bytes memory _bb = bytes(_b);
    bytes memory _bc = bytes(_c);
    bytes memory _bd = bytes(_d); 
    bytes memory _be = bytes(_e);
    string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
    bytes memory babcde = bytes(abcde);
    uint k = 0;

    for (uint i = 0; i < _ba.length; i++) { 
      babcde[k++] = _ba[i]; 
    }

    for (i = 0; i < _bb.length; i++) {
       babcde[k++] = _bb[i]; 
    }

    for (i = 0; i < _bc.length; i++) {
      babcde[k++] = _bc[i];
    }

    for (i = 0; i < _bd.length; i++) {
      babcde[k++] = _bd[i];
    }

    for (i = 0; i < _be.length; i++) {
      babcde[k++] = _be[i];
    } 
    return string(babcde);
   }

function strConcat(string _a, string _b, string _c, string _d) internal returns (string) {
    return strConcat(_a, _b, _c, _d, "");
}

function strConcat(string _a, string _b, string _c) internal returns (string) {
    return strConcat(_a, _b, _c, "", "");
}

function strConcat(string _a, string _b) internal returns (string) {
    return strConcat(_a, _b, "", "", "");
}


}
