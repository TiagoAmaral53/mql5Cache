# mql5Cache
This is a Class that allows user to save data in a non-sql data base.

## Installation
* Clone or download this repository to MQL5/Include folder
* [Download or Clone my node js server](https://github.com/TiagoAmaral53/Mql5ToMongoApi) - Follow Mql5ToMongoApi instruction
* Allow web request on your Meta trader 5 by allow WebRequests on Metatrader5 < Tools < Options < Expert Advisers < Tick Allow WebRequests and insert your url. 

## Usage

```mql5
#include <mql5Cache\KeepCache.mqh>;

//all paths need to have the routing "/api/admin" to work together with Mql5ToMongoApi repository
string url = "http://anypath.com/api/admin";
string url1 = "http://localhost:3000/api/admin"
KeepCache *k = new KeepCache("http://localhost:3000/api/admin");

// save a value on your server
k.SetItem("volume", "20000");
k.SetItem("moeda", "eurusd");
k.SetItem("price", "1.07");

//get a value from a server
string volume = k.GetItem("volume");
float price =  StringToDouble(k.GetItem("moeda"));
string symbol = k.SetItem("price", "1.07");

//delete a key
k.DeleteItem("price");
```

## Starting day:
	[31 Aug 2019]
