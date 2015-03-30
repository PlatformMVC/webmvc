package com.luther.util;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * 字节工具：数值和多字节直接的转换
 * @author bh
 *
 */
public class ByteUtil {

	/**
	 * 将小端字节序的字节数组转换成integer类型 <br/>
	 * low first and high after
	 * @param bytes
	 * @return
	 */
	public static int littleEndinessBytesToInt(byte[] bytes) {
		if(bytes==null||bytes.length==0){
			return 0;
		}
		
		int mask = 0xff;
		int temp = 0;
		int target = 0;
		int length = bytes.length<4?bytes.length:4;
		for (int i = 0; i < length; i++) {
			target <<= 8;
			//逆序计算
			int offet = length-i-1;
			temp = bytes[offet] & mask;
			target |= temp;
		}

		return target;
	}
	
	/**
	 * 将大端字节序的字节数组转换成integer类型<br/>
	 * high first and low after
	 * @param bytes
	 * @return
	 */
	public static int bigEndinessBytesToInt(byte[] bytes) {
		if(bytes==null||bytes.length==0){
			return 0;
		}
		
		int mask = 0xff;
		int temp = 0;
		int target = 0;
		int length = bytes.length<4?bytes.length:4;
		for (int i = 0; i < length; i++) {
			target <<= 8;
			temp = bytes[i] & mask;
			target |= temp;
		}

		return target;
	}
	
	/**
	 * 将字节数组转换成16进制输出
	 * @param bytes
	 * @return
	 */
	public static  String bytesToHex(byte bytes[]) {
		char[] hexValues = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
		StringBuffer buffer = new StringBuffer();
		
		int length = bytes.length;
		for(int i =0;i<length;i++){
			byte b = bytes[i];
			char[] tempArr = new char[2];
			tempArr[0] = hexValues[(b >>> 4) & 0X0F];
			tempArr[1] = hexValues[b & 0X0F];
			buffer.append("");
			buffer.append(new String(tempArr));
			buffer.append(" ");
		}
		return buffer.toString();
	}
	
	/**
	 * 将数值转换成指定长度的小端字节序的字节数组<br/>
	 * low first and high after<br/>
	 * @param value
	 * @param arrayLength
	 * @return
	 */
	public static byte[] intToLittleEndinessBytes(int value, int arrayLength) {
		byte[] arrays = new byte[arrayLength];
		for (int i = 0; (i < 4) && (i < arrayLength); i++) {
			arrays[i] = (byte) (value >> 8 * i & 0xFF);
		}

		return arrays;
	}
	
	/**
	 * 将数值转换成指定长度的大端字节序的数组<br/>
	 * @comment 按照正常顺序high first low after
	 * @param value
	 * @param arrayLength
	 * @return
	 */
	public static byte[] intToBigEndinessBytes(int value, int arrayLength) {
		int length = arrayLength>4?4:arrayLength;
        byte[] targets = new byte[length];  
        for (int i = 0; i < length; i++) {  
            int offset = (targets.length - 1 - i) * 8;  
            targets[i] = (byte) ((value >>> offset) & 0xff);  
        }  
        return targets;  
	}
	
	/**
	 * 将IP转换成字节数组高位在前低位在后
	 * @param ip
	 * @return
	 */
	public static byte[] ipToBytesByInet(String ip) {
		try {
			return InetAddress.getByName(ip).getAddress();
		} catch (UnknownHostException e) {
		}
		
		return new byte[0];
	}
	
	
	public static void main(String[] args) {
		byte[] reverseOrder = intToLittleEndinessBytes(1,2);
		byte[] orderNormal = intToBigEndinessBytes(1,2);
		System.out.println("low first:"+bytesToHex(reverseOrder));
		System.out.println("normal order:"+bytesToHex(orderNormal));
		
		byte [] c = intToLittleEndinessBytes(1080, 4);
		System.out.println(bytesToHex(c));
		
		int reverse = littleEndinessBytesToInt(reverseOrder);
		int normal = bigEndinessBytesToInt(orderNormal);
		System.out.println("reverse order:"+reverse);
		System.out.println("normal order:"+normal);
	}
}
