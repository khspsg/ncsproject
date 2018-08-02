package com.naver.jaebee2002;

public class PasswordTestMain {
	public static void main(String[] args) {
//	      int[][]land = {{9,5,2,6},{1,2,3,4},{5,6,7,8}};
	      int[][]land = {{1,2,3,5},{5,6,7,8},{1,2,3,4}};
	      int answer = 0;
	        int[][] max = new int[land.length][4];
	        for(int i=0; i<land.length; i++){
	            for(int j=0; j<4; j++){
	                for(int k=0; k<4; k++){
	                    if(j!=k){
	                        if(i==0){
	                            max[i][j] = land[i][j];
	                        }else{
	                            max[i][j] = Math.max(max[i][j],land[i][j]+max[i-1][k]);
	                        }
	                    }
	                }
	            }
	        }
	        for(int i=0; i<4; i++){
	            answer = Math.max(max[land.length-1][i],answer);
	        }
	        if(answer>100){
	            answer = 100;
	        }
	        String s="355346";
	        String y="1111";
	        String as = "-3 -4";
	        String[] arr = as.split(" ");
	        System.out.println(Integer.parseInt(arr[0]));
	        int a=Integer.parseInt(y,2);
	        System.out.println(Integer.toBinaryString(81));
	        int b=1;
//	        s = a+b+"";
	        String ss = s.substring(5,6);
	        System.out.println(ss);
	}
}
