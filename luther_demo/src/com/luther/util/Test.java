package com.luther.util;

import java.text.NumberFormat;
import java.util.Arrays;
import java.util.Locale;

public class Test {
	public static void main(String[] args) {
		/*NumberFormat nf=NumberFormat.getCurrencyInstance(Locale.CHINA);
		String s=nf.format(73084.803984);// result：￥73,084.80
		System.out.println("s:"+s);*/
		boolean [] primes = new boolean[100];
		for(int i =0;i<100;i++){
			primes[i] = true;
		}
		
		for(int i =2;i<100;i++){
			if(!primes[i]){
				continue;
			}
			
			for(int j = i+i;j<100;j+=i){
				primes[j] =false;
			}
		}
		
		System.out.println(Arrays.toString(primes));
	}

}
