package com.store;

import java.util.Arrays;
import java.util.Comparator;

public class FilenameSorting {
	public static String[] solution(String[] files) {
		String[] answer = new String[files.length];
		String[][] headNumTail = new String[files.length][3];

		for (int i = 0; i < files.length; i++) {

			headNumTail[i][0] = files[i];
			headNumTail[i][1] = files[i].split("[0-9]")[0];
			System.out.println(headNumTail[i][1]);
			files[i]=files[i].replace(headNumTail[i][1], "");
			System.out.println(files[i]);
			
			headNumTail[i][1] = headNumTail[i][1].toUpperCase();
			char[] arr = files[i].toCharArray();			
			
			headNumTail[i][2] = "";
            for(char c : arr) {
                if(Character.isDigit(c) && headNumTail[i][2].length() < 5) {
                	headNumTail[i][2] += c;
                } else {
                    break;
                }
            }
            System.out.println(headNumTail[i][2]);
		}

		Arrays.sort(headNumTail, new Comparator<String[]>() {
			@Override
			public int compare(String[] o1, String[] o2) {

				return o1[1].equals(o2[1]) ? Integer.parseInt(o1[2]) - Integer.parseInt(o2[2]) : o1[1].compareTo(o2[1]);
			}
		});

		for (int i = 0; i < files.length; i++) {
			answer[i] = headNumTail[i][0];
		}
		return answer;
	}
}