<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
 function changes1Step(fr) {
  if(fr=="현대") {
   num = new Array("브랜드명", "아반떼","그랜저","제네시스","스타렉스","포터");
   vnum = new Array("브랜드명", "아반떼","그랜저","제네시스","스타렉스","포터");
  }
  else if(fr=="기아") {
   num = new Array("브랜드명", "K3","K5","K7","K9","모닝");
   vnum = new Array("브랜드명", "K3","K5","K7","K9","모닝");
  }
  else if(fr=="한국GM") {
	num = new Array("브랜드명", "쉐보레 스파크","쉐보레 크루즈","쉐보레 올란도","쉐보레 말리부");
	vnum = new Array("브랜드명", "쉐보레 스파크","쉐보레 크루즈","쉐보레 올란도","쉐보레 말리부");
  }
  else if(fr=="한국GM") {
	num = new Array("브랜드명", "쉐보레 스파크","쉐보레 크루즈","쉐보레 올란도","쉐보레 말리부");
	vnum = new Array("브랜드명", "쉐보레 스파크","쉐보레 크루즈","쉐보레 올란도","쉐보레 말리부");
  }
  else if(fr=="르노코리아") {
	num = new Array("브랜드명", "SM3","SM5","SM7","QM6");
	vnum = new Array("브랜드명", "SM3","SM5","SM7","QM6");
  }
  else if(fr=="기타") {
	num = new Array("브랜드명", "굴삭기","버스","전기차","트럭","트레일러");
	vnum = new Array("브랜드명", "굴삭기","버스","전기차","트럭","트레일러");
  }
  
  for(i=0; i<form.Step2.length; i++) {
   form.Step2.options[i] = null;
  }
  
//   for(i=0; i<form.Step3.length; i++) {
//    form.Step3.options[i] = null;
//   }
//    form.Step3.options[0] = new Option("차량명", "차량명");
  for(i=0; i<num.length; i++) {
   form.Step2.options[i] = new Option(num[i],vnum[i]);
  }
 }
 
 
//  function changes2Step(fr) {
//   //용병 선택
//    if(fr=="소드맨") {
//    num = new Array("--3단계--", "버서커", "팔라딘");
//    vnum = new Array("--3단계--", "버서커", "팔라딘");
//   }
//   else if(fr=="아처") {
//    num = new Array("--3단계--", "헌터", "레인저");
//    vnum = new Array("--3단계--", "헌터", "레인저");
//   }
//   else if(fr=="매지션") {
//    num = new Array("--3단계--", "소서러","위자드");
//    vnum = new Array("--3단계--", "소서러","위자드");
//   }
//   //아이템 선택
//   else if(fr=="무기") {
//    num = new Array("--3단계--", "검","활","지팡이");
//    vnum = new Array("--3단계--", "검","활", "지팡이");
//   }
//   else if(fr=="방어구") {
//    num = new Array("--3단계--", "갑옷","투구","장갑", "신발");
//    vnum = new Array("--3단계--", "갑옷","투구","장갑", "신발");
//   }
//   else if(fr=="장신구") {
//    num = new Array("--3단계--", "반지","목걸이");
//    vnum = new Array("--3단계--", "반지","목걸이");
//   }
//   else if(fr=="잡화") {
//    num = new Array("--3단계--", "");
//    vnum = new Array("--3단계--", "");
//   }
//   else if(fr=="합정석") {
//    num = new Array("--3단계--", "");
//    vnum = new Array("--3단계--", "");
//   }
//   else
//   {
//    num = new Array("--3단계--");
//    vnum = new Array("--3단계--");
//   } 
  
//   for(i=0; i<form.Step3.length; i++) {
//    form.Step3.options[i] = null;
//   }
//   for(i=0; i<num.length; i++) {
//    form.Step3.options[i] = new Option(num[i],vnum[i]);
//   }
//  }
</script>

</head>
<body>
<div>
<form name='form'>
<select name='Step1' onchange='changes1Step(value)'>
<!-- <option>회사명</option> -->
<option value="">회사명</option>
												<option value="현대">현대</option>
												<option value="기아">기아</option>
												<option value="한국GM">한국GM</option>
												<option value="KG모빌리티">KG모빌리티</option>
												<option value="르노코리아">르노코리아</option>
												<option value="기타">기타</option>	
</select>
<select name='Step2'>
<option>브랜드명</option>
<!-- </select> -->
<!-- <select name='Step3'> -->
<!-- <option>차량명</option> -->
<!-- </select> -->
</form>
</div>
</body>
</html> 
