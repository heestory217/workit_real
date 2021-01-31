package com.it.workit.corpsearch.model;

import org.springframework.stereotype.Component;

@Component
public class CorpSearchkeywordConvertor {

	public String CSKConvertor(String searchKeyword) {
		String result =searchKeyword;
		if(searchKeyword.equals("자바") || searchKeyword.equals("java")) {
			result="JAVA";
		}else if(searchKeyword.equals("오라클") || searchKeyword.equals("oracle")) {
			result="Oracle";
		}else if(searchKeyword.equals("파이썬") || searchKeyword.equals("python")) {
			result="Python";
		}else if(searchKeyword.equals("루비") || searchKeyword.equals("ruby")) {
			result="Ruby";
		}else if(searchKeyword.equals("코틀린") || searchKeyword.equals("kotlin")) {
			result="Kotlin";
		}else if(searchKeyword.equals("스칼라") || searchKeyword.equals("scala")) {
			result="Scala";
		}else if(searchKeyword.equals("스위프트") || searchKeyword.equals("swift")) {
			result="Swift";
		}else if(searchKeyword.equals("오라클") || searchKeyword.equals("oracle")) {
			result="Oracle";
		}else if(searchKeyword.equals("c")) {
			result="C";
		}else if(searchKeyword.equals("c++")) {
			result="C++";
		}else if(searchKeyword.equals("c#")) {
			result="C#";
		}else if(searchKeyword.equals("비주얼 베이직") || searchKeyword.equals("비쥬얼 베이직") || searchKeyword.equals("visual basic")) {
			result="Visual Basic";
		}else if(searchKeyword.equals("자바스크립트") || searchKeyword.equals("javascript")) {
			result="JavaScript";
		}else if(searchKeyword.equals("php")) {
			result="PHP";
		}else if(searchKeyword.equals("r")) {
			result="R";
		}else if(searchKeyword.equals("groovy") || searchKeyword.equals("그루비")) {
			result="Groovy";
		}else if(searchKeyword.equals("어셈블리어") || searchKeyword.equals("어셈블리") || searchKeyword.equals("assembly")) {
			result="Assembly language";
		}else if(searchKeyword.equals("sql")) {
			result="SQL";
		}else if(searchKeyword.equals("go") || searchKeyword.equals("고")) {
			result="Go";
		}else if(searchKeyword.equals("matlab") || searchKeyword.equals("매트랩")) {
			result="MATLAB";
		}else if(searchKeyword.equals("objectivec") || searchKeyword.equals("오브젝티브씨") || searchKeyword.equals("오브젝티브c") || searchKeyword.equals("오브젝티브")) {
			result="Objective-C";
		}else if(searchKeyword.equals("펄") || searchKeyword.equals("perl")) {
			result="Perl";
		}else if(searchKeyword.equals("클래식 비쥬얼 베이직")) {
			result="Classic Visual Basic";
		}else if(searchKeyword.equals("타입스크립트")) {
			result="TypeScript";
		}else if(searchKeyword.equals("코볼")) {
			result="COBOL";
		}else if(searchKeyword.equals("사스") || searchKeyword.equals("sas")) {
			result="SAS";
		}else if(searchKeyword.equals("ps sql")) {
			result="PS/SQL";
		}else if(searchKeyword.equals("ps sql") || searchKeyword.equals("psSql")) {
			result="PS/SQL";
		}else if(searchKeyword.equals("줄리아")) {
			result="Julia";
		}else if(searchKeyword.equals("스크래치")) {
			result="Scratch";
		}else if(searchKeyword.equals("다트")) {
			result="Dart";
		}else if(searchKeyword.equals("러스트")) {
			result="Rust";
		}else if(searchKeyword.equals("abap")) {
			result="ABAP";
		}else if(searchKeyword.equals("d")) {
			result="D";
		}else if(searchKeyword.equals("프롤로그")) {
			result="Prolog";
		}else if(searchKeyword.equals("포트란")) {
			result="Fortran";
		}else if(searchKeyword.equals("에이다")) {
			result="Ada";
		}else if(searchKeyword.equals("트랜잭트SQL")) {
			result="Transact-SQL";
		}else if(searchKeyword.equals("vhdl")) {
			result="VHDL";
		}else if(searchKeyword.equals("리스프")) {
			result="Lisp";
		}else if(searchKeyword.equals("루아")) {
			result="Lua";
		}else if(searchKeyword.equals("파워셸") || searchKeyword.equals("파워쉘")) {
			result="PowerShell";
		}else if(searchKeyword.equals("비쥬얼폭스") || searchKeyword.equals("fox")) {
			result="Visual FoxPro";
		}else if(searchKeyword.equals("logo") || searchKeyword.equals("로고")) {
			result="Logo";
		}
		
		return result;
	}
}
