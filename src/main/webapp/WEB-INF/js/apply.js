
// Check Script Apply New Student 

function chechAPPLY() {
	
	var data = document.forms[0];
	var statusChecking = 0 ;
	var birthday = new Date(data[3].value.split("/")[2]-543+"-"+data[3].value.split("/")[1]+"-"+data[3].value.split("/")[0]);
	var birthday2 = new Date();
	birthday2.setFullYear(new Date().getFullYear()-15);
	// case check
	var inputTextTH = /^[A-Za-zก-์-]+$/ ;
	var inputTextEN = /^\a$/ ;
	var inputIDcard = /^[0-9]{13}$/ ;
	var inputINT = /^\d{2,3}$/ ;
	var inputDOUBLE = /^\d+(\.\d{1,3})?$/ ;
	var inputTEL = /^[0]{1}[1-9]{1}\d{8}$/ ;
	var inputEMAIL = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/ ;
 
	if(data[0].value == null){
		alert( "กรอกข้อมูลให้ครบถ้วน !!" );
		statusChecking = 1 ;
	} else if(data[1].value == "" || !data[1].value.match(inputTextTH) ){
		document.getElementById('p1').click();
		data[1].style.border = "thick solid #ed3a14";
		alert( "กรอก ชื่อจริง ให้ครบถ้วน และถูกต้อง !!" );
		data[1].focus();
		statusChecking = 1 ;
	}else if(data[2].value == "" || !data[2].value.match(inputTextTH) ){
		document.getElementById('p1').click();
		data[2].style.border = "thick solid #ed3a14";
		alert( "กรอก นามสกุล ให้ครบถ้วน และถูกต้อง !!" );
		data[2].focus();
		statusChecking = 1 ;
	}else if(data[3].value == "" ){
		document.getElementById('p1').click();
		data[3].style.border = "thick solid #ed3a14";
		alert( "กรอก วันเกิด !!" );
		statusChecking = 1 ;
	}else if(birthday.getTime() > birthday2.getTime()){
		document.getElementById('p1').click();
		data[3].style.border = "thick solid #ed3a14";
		alert( "อายุผู้สมัครคือ 15 ปีขึ้นไป !!" );
		statusChecking = 1 ;
	}else if(data[4].value == "" || !data[4].value.match(inputIDcard) ){
		document.getElementById('p1').click();
		data[4].style.border = "thick solid #ed3a14";
		alert( "กรอก รหัสประจำตัวประชาชน ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[5].value == "" || (!data[5].value.match(inputTextTH) && !data[5].value.match(/^[-]$/)) ){
		document.getElementById('p1').click();
		data[5].style.border = "thick solid #ed3a14";
		alert( "กรอก สัญชาติ ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[6].value == "" || !data[6].value.match(inputTextTH) ){
		document.getElementById('p1').click();
		data[6].style.border = "thick solid #ed3a14";
		alert( "กรอก เชื้อชาติ ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[8].value == "" || !data[8].value.match(inputINT) ){
		document.getElementById('p1').click();
		data[8].style.border = "thick solid #ed3a14";
		alert( "กรอก ส่วนสูง ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[9].value == "" || !data[9].value.match(inputDOUBLE) ){
		document.getElementById('p1').click();
		data[9].style.border = "thick solid #ed3a14";
		alert( "กรอก น้ำหนัก ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[11].value == "" ){
		document.getElementById('p1').click();
		data[11].style.border = "thick solid #ed3a14";
		alert( "กรอก โรคประจำตัว ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[12].value == "" || !data[12].value.match(inputTEL) ){
		document.getElementById('p1').click();
		data[12].style.border = "thick solid #ed3a14";
		alert( "กรอก เบอร์โทร ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[13].value == "" || !data[13].value.match(inputEMAIL) ){
		document.getElementById('p1').click();
		data[13].style.border = "thick solid #ed3a14";
		alert( "กรอก อีเมล ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[14].value == ""  ){
		document.getElementById('p1').click();
		data[14].style.border = "thick solid #ed3a14";
		alert( "กรอก ไลน์ไอดี ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[15].value == ""  ){
		document.getElementById('p1').click();
		data[15].style.border = "thick solid #ed3a14";
		alert( "กรอก เฟสบุ๊ค ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[17].value == "" || !data[17].value.match(/^[2]{1}\d{3}$/) ){
		document.getElementById('p1').click();
		data[17].style.border = "thick solid #ed3a14";
		alert( "กรอก พ.ศ. ที่จบการศึกษา ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[18].value == ""  ){
		document.getElementById('p1').click();
		data[18].style.border = "thick solid #ed3a14";
		alert( "กรอก สาขาวิชา ที่จบการศึกษา ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[19].value == "" || (!data[19].value.match(inputDOUBLE) && !data[19].value.match(/^[-]$/))){
		document.getElementById('p1').click();
		data[19].style.border = "thick solid #ed3a14";
		alert( "กรอก คะแนนเฉลี่ยสะสม ที่จบการศึกษา ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[20].value == ""  ){
		document.getElementById('p1').click();
		data[20].style.border = "thick solid #ed3a14";
		alert( "กรอก ชื่อสถาบันการศึกษา ที่จบการศึกษา ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[22].value == ""  ){
		document.getElementById('p2').click();
		data[22].style.border = "thick solid #ed3a14";
		alert( "กรอก บ้านเลขที่ ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[23].value == ""  ){
		document.getElementById('p2').click();
		data[23].style.border = "thick solid #ed3a14";
		alert( "กรอก หมู่ที่ ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[24].value == ""  ){
		document.getElementById('p2').click();
		data[24].style.border = "thick solid #ed3a14";
		alert( "กรอก อาคาร/หมู่บ้าน ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[25].value == ""  ){
		document.getElementById('p2').click();
		data[25].style.border = "thick solid #ed3a14";
		alert( "กรอก ตรอก/ซอย ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(data[26].value == ""  ){
		document.getElementById('p2').click();
		data[26].style.border = "thick solid #ed3a14";
		alert( "กรอก ถนน  ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(document.getElementById('district').value == "" || !document.getElementById('district').value.match(inputTextTH)  ){
		document.getElementById('p2').click();
		document.getElementById('district').style.border = "thick solid #ed3a14";
		alert( "กรอก แขวง/ตำบล ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(document.getElementById('amphoe').value == "" || !document.getElementById('amphoe').value.match(inputTextTH)  ){
		document.getElementById('p2').click();
		document.getElementById('amphoe').style.border = "thick solid #ed3a14";
		alert( "กรอก เขต/อำเภอ ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(document.getElementById('province').value == "" || !document.getElementById('province').value.match(inputTextTH)  ){
		document.getElementById('p2').click();
		document.getElementById('province').style.border = "thick solid #ed3a14";
		alert( "กรอก จังหวัด ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(document.getElementById('zipcode').value == "" || !document.getElementById('zipcode').value.match(/^\d{5}$/)  ){
		document.getElementById('p2').click();
		document.getElementById('zipcode').style.border = "thick solid #ed3a14";
		alert( "กรอก รหัสไปรษณีย์ ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(!document.getElementById('firstname_dad').value == "" && !document.getElementById('firstname_dad').value.match(inputTextTH)){
		document.getElementById('p2').click();
		document.getElementById('firstname_dad').style.border = "thick solid #ed3a14";
		alert( "กรอก ชื่อบิดา ให้ครบถ้วน และถูกต้อง !!");
		statusChecking = 1 ;
	}else if(!document.getElementById('lastname_dad').value == "" && !document.getElementById('lastname_dad').value.match(inputTextTH)  ){
		document.getElementById('p2').click();
		document.getElementById('lastname_dad').style.border = "thick solid #ed3a14";
		alert( "กรอก นามสกุลบิดา ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(!document.getElementById('career_dad').value == "" && !document.getElementById('career_dad').value.match(inputTextTH)  ){
		document.getElementById('p2').click();
		document.getElementById('career_dad').style.border = "thick solid #ed3a14";
		alert( "กรอก อาชีพบิดา ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(!document.getElementById('tel_dad').value == "" && (!document.getElementById('tel_dad').value.match(inputTEL) && !document.getElementById('tel_dad').value.match(/^[-]$/))  ){
		document.getElementById('p2').click();
		document.getElementById('tel_dad').style.border = "thick solid #ed3a14";
		alert( "กรอก เบอร์โทรบิดา ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(!document.getElementById('firstname_mom').value == "" && !document.getElementById('firstname_mom').value.match(inputTextTH)  ){
		document.getElementById('p2').click();
		document.getElementById('firstname_mom').style.border = "thick solid #ed3a14";
		alert( "กรอก ชื่อมารดา ให้ครบถ้วน และถูกต้อง !!");
		statusChecking = 1 ;
	}else if(!document.getElementById('lastname_mom').value == "" && !document.getElementById('lastname_mom').value.match(inputTextTH)  ){
		document.getElementById('p2').click();
		document.getElementById('lastname_mom').style.border = "thick solid #ed3a14";
		alert( "กรอก นามสกุลมารดา ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(!document.getElementById('career_mom').value == "" && !document.getElementById('career_mom').value.match(inputTextTH)  ){
		document.getElementById('p2').click();
		document.getElementById('career_mom').style.border = "thick solid #ed3a14";
		alert( "กรอก อาชีพมารดา ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(!document.getElementById('tel_mom').value == "" && (!document.getElementById('tel_mom').value.match(inputTEL) && !document.getElementById('tel_mom').value.match(/^[-]$/))  ){
		document.getElementById('p2').click();
		document.getElementById('tel_mom').style.border = "thick solid #ed3a14";
		alert( "กรอก เบอร์โทรมารดา ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(document.getElementById('firstnamr_em').value == "" || !document.getElementById('firstnamr_em').value.match(inputTextTH)  ){
		document.getElementById('p2').click();
		document.getElementById('firstnamr_em').style.border = "thick solid #ed3a14";
		alert( "กรอก ชื่อผู้ติดต่อยามฉุกเฉิน ให้ครบถ้วน และถูกต้อง !!");
		statusChecking = 1 ;
	}else if(document.getElementById('lastname_em').value == "" || !document.getElementById('lastname_em').value.match(inputTextTH)  ){
		document.getElementById('p2').click();
		document.getElementById('lastname_em').style.border = "thick solid #ed3a14";
		alert( "กรอก นามสกุลผู้ติดต่อยามฉุกเฉิน ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(document.getElementById('tel_em').value == "" || !document.getElementById('tel_em').value.match(inputTEL)  ){
		document.getElementById('p2').click();
		document.getElementById('tel_em').style.border = "thick solid #ed3a14";
		alert( "กรอก เบอร์โทรผู้ติดต่อยามฉุกเฉิน ให้ครบถ้วน และถูกต้อง !!" );
		statusChecking = 1 ;
	}else if(document.getElementById('ref_em').value == "" || !document.getElementById('ref_em').value.match(inputTextTH)  ){
		document.getElementById('p2').click();
		document.getElementById('ref_em').style.border = "thick solid #ed3a14";
		alert( "กรอก ความเกี่ยวข้อง ผู้ติดต่อยามฉุกเฉิน ให้ครบถ้วน และถูกต้อง !!");
		statusChecking = 1 ;
	}else if(!document.getElementById('paymenttype1').checked  && !document.getElementById('paymenttype2').checked ){
		document.getElementById('p3').click();
		alert( "เลือกประเภท การสนับสนุนค่าใช้จ่ายทางการศึกษา  !!");
		statusChecking = 1 ;
	}else if(!document.getElementById('residence1').checked && !document.getElementById('residence2').checked ){
		document.getElementById('p3').click();
		alert( "เลือกประเภท การพักอาศัยระหว่างเรียน   !!");
		statusChecking = 1 ;
	}else if(document.getElementById ("avatar").files.length == 0  ){
		document.getElementById('p3').click();
		alert( "แนบไฟล์ รูปประจำตัว   !!");
		statusChecking = 1 ;
	}else if(document.getElementById ("copyOfIdCard").files.length == 0  ){
		document.getElementById('p3').click();
		alert( "แนบไฟล์ สำเนาบัตรประชาชน   !!");
		statusChecking = 1 ;
	}else if(document.getElementById ("houseRegistrationDocument").files.length == 0  ){
		document.getElementById('p3').click();
		alert( "แนบไฟล์ สำเนาทะเบียนบ้าน   !!");
		statusChecking = 1 ;
	}else if(document.getElementById ("educationalCertificate").files.length == 0  ){
		document.getElementById('p3').click();
		alert( "แนบไฟล์ ใบรับรองผลการศึกษา   !!");
		statusChecking = 1 ;
	}
	
	
	//show view
	if(statusChecking == 0){
		document.getElementById("PVname").innerHTML = data[0].value+" "+data[1].value+" "+data[2].value;
		document.getElementById("PVidcard").innerHTML = data[4].value;
		var payment = "" ;
		if(document.getElementById('paymenttype1').checked){
			payment = "ผู้ปกครอง/นักเรียนรับผิดชอบเอง" ;
		}else if(document.getElementById('paymenttype2').checked){
			payment = "ผ่อนชำระเป็นงวด" ;
		}
		document.getElementById("PVpaymentType").innerHTML = payment ;
		var residence = "" ;
		if(document.getElementById('residence1').checked){
			residence = "หอพักทางโรงเรียน" ;
		}else if(document.getElementById('residence2').checked){
			residence = "จัดหาที่พักเอง" ;
		}
		document.getElementById("PVresidence").innerHTML = residence ;
		document.getElementById("PVbirthday").innerHTML = data[3].value ;
		document.getElementById("PVnationality").innerHTML = data[5].value ;
		document.getElementById("PVethnicity").innerHTML = data[6].value ;
		document.getElementById("PVreligion").innerHTML = data[7].value ;
		document.getElementById("PVheight").innerHTML = data[8].value ;
		document.getElementById("PVweight").innerHTML = data[9].value ;
		document.getElementById("PVbloodtype").innerHTML = data[10].value ;
		document.getElementById("PVdisease").innerHTML = data[11].value ;
		document.getElementById("PVgraduationLevel").innerHTML = data[16].value ;
		document.getElementById("PVgraduationYear").innerHTML = data[17].value ;
		document.getElementById("PVgraduationCourse").innerHTML = data[18].value ;
		document.getElementById("PVgraduationGPA").innerHTML = data[19].value ;
		document.getElementById("PVgraduationInstitution").innerHTML = data[20].value ;
		document.getElementById("PVtel").innerHTML = data[12].value ;
		document.getElementById("PVemail").innerHTML = data[13].value ;
		document.getElementById("PVlineid").innerHTML = data[14].value ;
		document.getElementById("PVfacebook").innerHTML = data[15].value ;
		document.getElementById("PVhouseNO").innerHTML = data[22].value ;
		document.getElementById("PVvillageNO").innerHTML = data[23].value ;
		document.getElementById("PVvillageName").innerHTML = data[24].value ;
		document.getElementById("PValley").innerHTML = data[25].value ;
		document.getElementById("PVroad").innerHTML = data[26].value ;
		document.getElementById("PVsubDistrict").innerHTML = document.getElementById('district').value ;
		document.getElementById("PVdistrict").innerHTML = document.getElementById('amphoe').value ;
		document.getElementById("PVprovince").innerHTML = document.getElementById('province').value ;
		document.getElementById("PVpostcode").innerHTML = document.getElementById('zipcode').value ;
		document.getElementById("PVstatus_dad").innerHTML = document.getElementById('status_dad').value ;
		document.getElementById("PVname_dad").innerHTML = "คุณ "+document.getElementById('firstname_dad').value+" "+document.getElementById('lastname_dad').value  ;
		document.getElementById("PVbrithday_dad").innerHTML = document.getElementById('brithday_dad').value ;
		document.getElementById("PVcareer_dad").innerHTML = document.getElementById('career_dad').value ;
		document.getElementById("PVtel_dad").innerHTML = document.getElementById('tel_dad').value ;
		document.getElementById("PVstatus_mom").innerHTML = document.getElementById('status_mom').value ;
		document.getElementById("PVname_mom").innerHTML =  "คุณ "+document.getElementById('firstname_mom').value+" "+document.getElementById('lastname_mom').value  ;
		document.getElementById("PVbrithday_mom").innerHTML = document.getElementById('brithday_mom').value ;
		document.getElementById("PVcareer_mom").innerHTML = document.getElementById('career_mom').value ;
		document.getElementById("PVtel_mom").innerHTML = document.getElementById('tel_mom').value ;
		document.getElementById("PVname_em").innerHTML =  "คุณ "+document.getElementById('firstnamr_em').value+" "+document.getElementById('lastname_em').value  ;
		document.getElementById("PVtel_em").innerHTML = document.getElementById('tel_em').value ;
		document.getElementById("PVref_em").innerHTML = document.getElementById('ref_em').value ;
		
	document.getElementById('box1').style.display = "none" ;
	document.getElementById('box2').style.display = "block" ;
	document.documentElement.scrollTop = 0 ;
	}
	
	return false ;
}

function editAPPLY(){
	document.getElementById('box1').style.display = "block" ;
	document.getElementById('box2').style.display = "none" ;
	document.documentElement.scrollTop = 0 ;
}

function checkTEXT(x){
	var inputText = /^[A-Za-zก-์-]+$/ ;
	if(!x.value.match(inputText)){
		x.style.border = "thick solid #ed3a14";
	}else{
		x.style.border = "1px solid #000";
	}
}

function checkNULL(x){
	if(x.value == ""){
		x.style.border = "thick solid #ed3a14";
	}else{
		x.style.border = "1px solid #000";
	}
}

function checkINT(x){
	var inputINT = /^\d{2,3}$/ ;
	if(!x.value.match(inputINT)){
		x.style.border = "thick solid #ed3a14";
	}else{
		x.style.border = "1px solid #000";
	}
}

function checkIDCARD(x){
	var inputIDcard = /^[0-9]{13}$/ ;
	if(!x.value.match(inputIDcard)){
		x.style.border = "thick solid #ed3a14";
	}else{
		x.style.border = "1px solid #000";
	}
}

function checkDOUBLE(x){
	var inputDOUBLE = /^\d+(\.\d{1,3})?$/ ;
	if(!x.value.match(inputDOUBLE) && !x.value.match(/^[-]$/) ){
		x.style.border = "thick solid #ed3a14";
	}else{
		x.style.border = "1px solid #000";
	}
}

function checkTEL(x){
	var inputTEL = /^[0]{1}[1-9]{1}\d{8}$/ ;
	if(!x.value.match(inputTEL)){
		x.style.border = "thick solid #ed3a14";
	}else{
		x.style.border = "1px solid #000";
	}
}

function checkTELDM(x){
	var inputTEL = /^[0]{1}[1-9]{1}\d{8}$/ ;
	if(!x.value.match(inputTEL) && !x.value.match(/^[-]$/)){
		x.style.border = "thick solid #ed3a14";
	}else{
		x.style.border = "1px solid #000";
	}
}

function checkEMAIL(x){
	var inputEMAIL = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/ ;
	if(!x.value.match(inputEMAIL)){
		x.style.border = "thick solid #ed3a14";
	}else{
		x.style.border = "1px solid #000";
	}
}

function checkYEAR(x){
	if(!x.value.match(/^[2]{1}\d{3}$/)){
		x.style.border = "thick solid #ed3a14";
	}else{
		x.style.border = "1px solid #000";
	}
}

function checkZIPCODE(x){
	if(!x.value.match(/^\d{5}$/)){
		x.style.border = "thick solid #ed3a14";
	}else{
		x.style.border = "1px solid #000";
	}
}

function typeEM(){
	var typeEM = document.getElementById('em_type').value ;
	
	if(typeEM.match('1')){
		document.getElementById('firstnamr_em').value = "" ;
		document.getElementById('lastname_em').value = "" ;
		document.getElementById('tel_em').value = "" ;
		document.getElementById('ref_em').value = "" ;
	}else if(typeEM.match('2')){
		document.getElementById('firstnamr_em').value = document.getElementById('firstname_dad').value ;
		document.getElementById('lastname_em').value = document.getElementById('lastname_dad').value ;
		document.getElementById('tel_em').value = document.getElementById('tel_dad').value ;
		document.getElementById('ref_em').value = "พ่อ" ;
	}else if(typeEM.match('3')){
		document.getElementById('firstnamr_em').value = document.getElementById('firstname_mom').value ;
		document.getElementById('lastname_em').value = document.getElementById('lastname_mom').value ;
		document.getElementById('tel_em').value = document.getElementById('tel_mom').value ;
		document.getElementById('ref_em').value = "แม่" ;
	}
	
}



