//+------------------------------------------------------------------+
//|                                                    KeepCache.mqh |
//|                                                      TiagoAmaral |
//|                       https://github.com/TiagoAmaral53/mql5Cache |
//+------------------------------------------------------------------+
#property copyright "TiagoAmaral";
#property link      "https://github.com/TiagoAmaral53/mql5Cache";
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+
class KeepCache
  {
private:
   string key;
   string value;
public:
                     KeepCache(void);
                    ~KeepCache(void);
                    bool SetItem(string key, string value);
                    string GetItem(string key);
                    
                 
                 
  };
  KeepCache::KeepCache(void){};
  KeepCache::~KeepCache(void){};
  
  bool KeepCache::SetItem(string key,string value){
   this.key = key;
   this.value = value;
   return true;
  }
  string KeepCache::GetItem(string key){
   if(key == this.key)
     {
      return this.value;
     }else{
     return "null";
     }
  }
