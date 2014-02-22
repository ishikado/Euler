#include <iostream>
#include <algorithm>
#include <set>
#include <map>
#include <vector>
#include <string>
#include <sstream>
#include <cstdio>
#include <cmath>
#include <ctime>

using namespace std;

typedef long long ll;
const int MAX_PRIME = 100;

const double EPS=1e-10;
bool EQ(double a,double b){
  return abs(a-b)<EPS;
}

struct TimeWatch{
  clock_t start_,end_;
  void start(){start_=clock();}
  double stop(){return (double)(clock()-start_)/CLOCKS_PER_SEC;}
};


template<class T>T gcd(T a,T b){if(b==0)return a;return gcd(b,a%b);}
int prime[MAX_PRIME+1];
bool isPrime[MAX_PRIME+1];
int p;

void erats(){
  // primeÉäÉXÉgÇèâä˙âª
  fill(isPrime,isPrime+MAX_PRIME,true);
  p=0;
  isPrime[0]=isPrime[1]=false;
  for(int i=2;i<=MAX_PRIME;i++){
    if(isPrime[i]){
      prime[p++]=i;
      // Ç”ÇÈÇ¢Ç…Ç©ÇØÇÈ
      for(int j=2*i;j<=MAX_PRIME;j+=i)isPrime[j] = false;
    }
  }
}

ll InExc(ll N,vector<ll> a){
  ll res=0;
  int m=a.size();
  for(int i=1;i<(1<<m);i++){
    ll num=__builtin_popcount(i);
    ll lcm=1;
    for(int j=0;j<m;j++){
      if((i>>j)&1){
        lcm=lcm/gcd(lcm,a[j])*a[j];
        if(lcm>N)break;
      }
    }
    if(num%2==0)res-=N/lcm;
    else res+=N/lcm;
  }
  return res;
}


pair<ll,vector<ll> > getStartPos(){
  ll d=2;
  ll pos=1;
  vector<ll> a;
  a.push_back(2);
  while(1){
    ll cnt=InExc(d,a);
    double val=1.0*(d-cnt)/(d-1);
    if(EQ(val,15499/94744.0)||val<15499/94744.0){
      cout<<d/prime[pos-1]<<endl;
      cout<<pos-1<<endl;
      a.pop_back();
      return make_pair(d/prime[pos-1],a);
    }
    a.push_back(prime[pos]);
    d*=prime[pos++];
  }
}


int main(){

  TimeWatch tw;
  tw.start();
  erats();
  
  pair<ll,vector<ll> > p=getStartPos();
  ll d=p.first;
  vector<ll> a=p.second;
  ll diff=d;
  d*=2;
  while(1){
    ll cnt=InExc(d,a);
    double val=1.0*(d-cnt)/(d-1);
    if(val<15499/94744.0){
      cout<<d<<" ";
      printf("%.10f\n",val);
      cout<<flush;
      cout<<tw.stop()<<endl;
      return 0;
    }
    d+=diff;
  }
  
  
  return 0;
}
