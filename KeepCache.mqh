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
   string            url;
   string            Request(string key = "", string value = "", bool del = false);
public:
                     KeepCache(string url);
                    ~KeepCache(void);
   bool              SetItem(string key, string value);
   string            GetItem(string key);
   bool              DeleteItem(string key);

  };
KeepCache::KeepCache(string url)
  {
   this.url = url;
  };
KeepCache::~KeepCache(void) {};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool KeepCache::SetItem(string key,string value)
  {
   string res = Request(key,value);
   if(res == "true")
     {
      return true;
     }
   else
      if(res == "false")
        {
         return false;
        }
      else
        {
         return false;
        }

  }
string KeepCache::GetItem(string key)
  {
   string res = Request(key);
   if(res == "undifined")
     {
      return "undifined";
     }else if(res == -1)
             {
              return GetLastError();
             }else
                {
                 return res;
                }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool KeepCache::DeleteItem(string key)
  {
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string KeepCache::Request(string key = "", string value = "", bool del = false)
  {
     char post[], result[];
   string cookie = NULL, headers;
   int res = 0;
   
  if(del)
    {
     //action
    }else if(StringLen(key) > 0)
            {
               res=WebRequest("GET",this.url + "/get/"+key,cookie,NULL,500,post,0,result,headers);
            }else if(StringLen(key) > 0 && StringLen(value)> 0)
                    {
                     res=WebRequest("GET",this.url + "/set/"+key+value,cookie,NULL,500,post,0,result,headers);
                    }


   
   if(res == -1)
     {
      return GetLastError();
     }
   else
      if(res == 200)
        {
         return CharArrayToString(result);
        }
      else
        {
         return GetLastError();
        }
}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
