#include <iostream>
#include <vector>
#include <algorithm>
#include <cstring>
#include <cmath>
#include <bitset>

using namespace std;

typedef pair<int,int> pii;
int dp[1<<6][100];
pii tos[1<<6][100];
int kind[10001];

const double EPS=1e-8;
bool EQ(double a,double b){
  return abs(a-b)<(1e-8);
}
bool isInteger(double d){
  return (EQ((int)(d+EPS),d));
}
int check(int num){
  return kind[num];
}

int dfs(int mask,int prv,int fst){
  if(dp[mask][prv]>=0)
    return dp[mask][prv];
  int res=0;
  int cnt=__builtin_popcount(mask);
  // prv:fstという数字がどうかチェック
  if(cnt==5){
    int cur=prv*100+fst;
    int id=check(cur);
    if(id!=-1&&!((mask>>id)&1))return 1;
    return 0;
  }
  else{
    for(int i=10;i<100;i++){
      int cur=prv*100+i;
      int id=check(cur);
      if(id==-1)continue;
      if(!((mask>>id)&1)){
	res|=dfs(mask|(1<<id),i,fst);
	if(res){
	  tos[mask][prv]=pii(mask|(1<<id),i);
	  break;
	}
      }
    }
    return dp[mask][prv]=res;
  }
}

int main(){
  memset(kind,-1,sizeof(kind));
  for(int i=2;i*(i+1)/2<10000;i++)kind[i*(i+1)/2]=0;
  for(int i=2;i*i<10000;i++)kind[i*i]=1;
  for(int i=2;i*(3*i-1)/2<10000;i++)kind[i*(3*i-1)/2]=2;
  for(int i=2;i*(2*i-1)<10000;i++)kind[i*(2*i-1)]=3;
  for(int i=2;i*(5*i-3)/2<10000;i++)kind[i*(5*i-3)/2]=4;
  for(int i=2;i*(3*i-2)<10000;i++)kind[i*(3*i-2)]=5;
  for(int i=10;i<100;i++){
    memset(dp,-1,sizeof(dp));
    if(dfs(0,i,i)){
      pii cur=pii(0,i);
      int sum=0;
      // cout<<i<<endl;
      while(1){
	int cnt=__builtin_popcount(cur.first);
	if(cnt==5){
	  sum+=cur.second*100+i;
	  break;
	}
	sum+=cur.second*100+tos[cur.first][cur.second].second;
	cur=tos[cur.first][cur.second];
	//cout<<cur.second<<endl;
      }
      cout<<sum<<endl;
      break;
    }
  }
  
  return 0;
}
