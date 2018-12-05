function generate_seed()
{
	var new_seed = lightwallet.keystore.generateRandomSeed();

	document.getElementById("seed").value = new_seed;

	generate_addresses(new_seed);
}

var totalAddresses = 1;

function generate_addresses(seed)
{
   if(seed == undefined)
   {
      seed = document.getElementById("seed").value;
   }

   if(!lightwallet.keystore.isSeedValid(seed))
   {
      document.getElementById("info").innerHTML = "Please enter a valid seed";
      return;
   }

   

   if(!Number.isInteger(parseInt(totalAddresses)))
   {
      document.getElementById("info").innerHTML = "Please enter valid number of addresses";
      return;
   }

   var password = Math.random().toString();

   lightwallet.keystore.createVault({
      password: password,
        seedPhrase: seed
   }, function (err, ks) {
        ks.keyFromPassword(password, function (err, pwDerivedKey) {
          if(err)
          {
             document.getElementById("info").innerHTML = err;
          }
          else
          {
             ks.generateNewAddress(pwDerivedKey, totalAddresses);
             var addresses = ks.getAddresses();   
             
             var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

             var html = "";
             var data1="";
             var data2="";

             for(var count = 0; count < addresses.length; count++)
             {
               var address = addresses[count];
               var private_key = ks.exportPrivateKey(address, pwDerivedKey);
               var balance = web3.eth.getBalance("0x" + address);

               //html = html + "<blockquote>";
               html = html + "<b>Address: </b>0x" + address + "</br>";
               html = html + "<b>Private Key: </b>0x" + private_key + "</br>";
                //html = html + "</blockquote>"; 
               
               data1= data1 + "0x"+address;
               data2 = data2 + "0x"+private_key;
               
             }

             //document.getElementById("list").innerHTML = html;
             document.getElementById("address").innerHTML = data1;
             document.getElementById("private_key").innerHTML = data2;
          }
        
      });
   });
}

function send_ether()
{
	var	seed = document.getElementById("seed").value;

	if(!lightwallet.keystore.isSeedValid(seed))
	{
		document.getElementById("txnhash").innerHTML = "Please enter a valid seed";
		return;
	}

	var password = Math.random().toString();

	lightwallet.keystore.createVault({
		password: password,
	  	seedPhrase: seed
	}, function (err, ks) {
	  	ks.keyFromPassword(password, function (err, pwDerivedKey) {
	    	if(err)
	    	{
	    		document.getElementById("txnhash").innerHTML = err;
	    	}
	    	else
	    	{
	    		ks.generateNewAddress(pwDerivedKey, totalAddresses);

	    		ks.passwordProvider = function (callback) {
			      	callback(null, password);
			    };

			    var provider = new HookedWeb3Provider({
  					host: "http://localhost:8545",
  					transaction_signer: ks
				});

			    var web3 = new Web3(provider);

			    var from = document.getElementById("address1").value;
				var to = document.getElementById("address2").value;
			    var value = web3.toWei(document.getElementById("ether").value, "ether");

			    web3.eth.sendTransaction({
			    	from: from,
			    	to: to,
			    	value: value,
			    	gas: 21000
			    }, function(error, result){
			    	if(error)
			    	{	
			    		document.getElementById("txnhash").innerHTML = error;
			    	}
			    	else
			    	{
			    		document.getElementById("txnhash").innerHTML = "Txn hash: " + result;
			    	}
			    })
	    	}
	  	});
	});
}