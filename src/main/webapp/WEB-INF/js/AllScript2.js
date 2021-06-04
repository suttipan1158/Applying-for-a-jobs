
//======================= Check Script All Login  And Register============================

function checkUsername(x){
	var inputText = /^[A-Za-z0-9]+$/ ;
	var inputSize = /^([A-Za-z0-9]{5,15})?$/ ;

	if(x.value == ""){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptUS").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!x.value.match(inputText)){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptUS").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ และตัวเลขอารบิกเท่านั้น [A-Z,a-z] [0-9]";
	}else if(!x.value.match(inputSize)){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptUS").innerHTML = "+ มีความยาวตั้งแต่  5 - 15 ตัวอักษร";
	}else{
		x.style.border = "1px solid #000";
		document.getElementById("showScriptUS").innerHTML = "";
	}
}
function checkPassword(pwd) {
	var inputText = /^[A-Za-z0-9@_]+$/ ;
	var inputSize = /^([A-Za-z0-9@_]{5,15})?$/ ;

	if(pwd.value == ""){
		pwd.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptpwd").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!pwd.value.match(inputText)){
		pwd.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptpwd").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ และตัวเลขอารบิกเท่านั้น [A-Z,a-z @_] [0-9]";
	}else if(!pwd.value.match(inputSize)){
		pwd.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptpwd").innerHTML = "+ มีความยาวตั้งแต่  5 - 15 ตัวอักษร";
	}else{
		pwd.style.border = "1px solid #000";
		document.getElementById("showScriptpwd").innerHTML = "";
	}
}

///Check Script All Register

function checkPasswordconfirm(pwdc,pwd) {
	var inputText = /^[A-Za-z0-9@_]+$/ ;
	var inputSize = /^([A-Za-z0-9@_]{5,15})?$/ ;

	if(pwdc.value == ""){
		pwdc.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptpwdc").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(pwdc.value != pwd.value){
		pwdc.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptpwdc").innerHTML = "+ ข้อมูล "+"ยืนยันรหัสผ่าน"+" จะต้องตรงกับข้อมูลในช่องของ"+"รหัสผ่าน";
	}else if(!pwdc.value.match(inputText)){
		pwdc.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptpwdc").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ และตัวเลขอารบิกเท่านั้น [A-Z,a-z @_] [0-9]";
	}else if(!pwdc.value.match(inputSize)){
		pwdc.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptpwdc").innerHTML = "+ มีความยาวตั้งแต่  5 - 15 ตัวอักษร";
	}else{
		pwdc.style.border = "1px solid #000";
		document.getElementById("showScriptpwdc").innerHTML = "";
	}
}

function FName(fn) {
	var inputText = /^[A-Za-zก-์-]+$/ ;
	var inputSize = /^([A-Za-zก-์-]{2,32})?$/ ;
	if(fn.value == ""){
		fn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptFname").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
		 
	}else if(!fn.value.match(inputText)){
		fn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptFname").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ  หรือภาษาไทยเท่านั้น[A-Za-zก-์-] และต้องไม่มีช่องว่างอยู่ภายในชื่อ";
	}else if(!fn.value.match(inputSize)){
		fn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptFname").innerHTML = "+ มีความยาวตั้งแต่  2 - 32 ตัวอักษร";
	}else{
		fn.style.border = "1px solid #000";
		document.getElementById("showScriptFname").innerHTML = "";
	}
}
function LName(ln) {
	var inputText = /^[A-Za-zก-์- ]+$/ ;
	var inputSize = /^([A-Za-zก-์- ]{2,32})?$/ ;
	 if(!ln.value.match(inputText)){
		 ln.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptLname").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ  หรือภาษาไทยเท่านั้น[A-Za-zก-์- ]";
	}else if(!ln.value.match(inputSize)){
		ln.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptLname").innerHTML = "+ มีความยาวตั้งแต่  2 - 32 ตัวอักษร";
	}else{
		ln.style.border = "1px solid #000";
		document.getElementById("showScriptLname").innerHTML = "";
	}
}
function checkbrithday(x){
	if(x.value == ""){
		x.style.border = "thick solid #ed3a14";
	}else{
		x.style.border = "1px solid #000";
	}
}
function checkTelPerson(tel) {
	var inputText = /^[0-9]+$/ ;
	var inputSize = /^0([8|9|6])([0-9]{8}$)/ ;

	if(tel.value == ""){
		tel.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptTel").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!tel.value.match(inputText)){
		tel.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptTel").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ และตัวเลขอารบิกเท่านั้น [ 0-9 ]";
	}else if(!tel.value.match(inputSize)){
		tel.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptTel").innerHTML = "+ มีความยาว 10  ตัวอักษรเท่านั้น  และต้องขึ้นต้นด้วย '08 หรือ 09 หรือ 06' เท่านั้น";
	}else{
		tel.style.border = "1px solid #000";
		document.getElementById("showScriptTel").innerHTML = "";
	}
}
function CheckEmail(em) {
	var inputText = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/ ;
	var inputSize = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/ ;
	if(em.value == ""){
		em.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptEmail").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!em.value.match(inputText)){
		em.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptEmail").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ และตัวเลขอารบิกเท่านั้น [A-Z,a-z,0-9] และมีตัวอักษรพิเศษ - . _ ได้ และมีตัวอักษร @ 1ตัว เท่านั้น";
	}else if(!em.value.match(inputSize)){
		em.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptEmail").innerHTML = "+ มีความยาวตั้งแต่  6 - 50 ตัวอักษร";
	}else{
		em.style.border = "1px solid #000";
		document.getElementById("showScriptEmail").innerHTML = "";
	}
}
function CheckAddress(adr) {
	var inputText = /^[A-Za-z0-9/. ก-์-]+$/ ;
	if(adr.value == ""){
		adr.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptAddress").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!adr.value.match(inputText)){
		adr.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptAddress").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ ภาษาไทย และตัวเลขอารบิกเท่านั้น [A-Z,a-z,ก-์,0-9] และมีตัวอักขระพิเศษ / เท่านั้น";
	}else{
		adr.style.border = "1px solid #000";
		document.getElementById("showScriptAddress").innerHTML = "";
	}
}
function CheckSubdistrict(sdt) {
	var inputText = /^[ก-์-]+$/ ;
	var inputSize = /^[ก-์-]{2,20}$/ ;
	if(sdt.value == " "){
		sdt.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptSubD").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!sdt.value.match(inputText)){
		sdt.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptSubD").innerHTML = "+ ต้องเป็นตัวอักษรภาษาไทยเท่านั้น [ก-์]";
	}else if(!sdt.value.match(inputSize)){
		sdt.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptSubD").innerHTML = "+ มีความยาวตั้งแต่  2 - 20 ตัวอักษร";
	}else{
		sdt.style.border = "1px solid #000";
		document.getElementById("showScriptSubD").innerHTML = "";
	}
}
function Checkdistrict(dt) {
	var inputText = /^[ก-์-]+$/ ;
	var inputSize = /^[ก-์-]{2,20}$/ ;
		if(!dt.value.match(inputText)){
			dt.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptDtt").innerHTML = "+ ต้องเป็นตัวอักษรภาษาไทยเท่านั้น [ก-์]";
		}else if(!dt.value.match(inputSize)){
			dt.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptDtt").innerHTML = "+ มีความยาวตั้งแต่  2 - 20 ตัวอักษร";
		}else{
			dt.style.border = "1px solid #000";
			document.getElementById("showScriptDtt").innerHTML = "";
		}
}
function Checkdistrict2(dt) {
	var inputText = document.getElementById("amphoe").value;
	var inputSize = /^[ก-์-]{2,20}$/ ;

	if(!dt.value.match(inputText)){
			dt.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptDtt").innerHTML = "+ ต้องเป็นตัวอักษรภาษาไทยเท่านั้น [ก-์] ";
	}else{
		dt.style.border = "1px solid #000";
		document.getElementById("showScriptDtt").innerHTML = "";
	}
	
}
function CheckProvince(pvn) {
	var inputText = /^[ก-์-]+$/ ;
	var inputSize = /^[ก-์-]{2,20}$/ ;
		if(!pvn.value.match(inputText)){
			pvn.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptPvn").innerHTML = "+ ต้องเป็นตัวอักษรภาษาไทยเท่านั้น [ก-์]";
		}else if(!pvn.value.match(inputSize)){
			pvn.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptPvn").innerHTML = "+ มีความยาวตั้งแต่  2 - 20 ตัวอักษร";
		}else{
			pvn.style.border = "1px solid #000";
			document.getElementById("showScriptPvn").innerHTML = "";
		}
}
function CheckProvince2(dt) {
	var inputText = document.getElementById("province").value;
		
		if(dt.value == ""){
			pvn.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptPvn").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
		}else{
			dt.style.border = "1px solid #000";
			document.getElementById("showScriptPvn").innerHTML = "";
		}
}
function CheckPostcode(ptc) {
	var inputText = /^[0-9]+$/ ;
	var inputSize = /^[0-9]{5}$/ ;
	 if(!ptc.value.match(inputText)){
		ptc.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptPtc").innerHTML = "+ ต้องเป็นตัวเลขเท่านั้น [0-9]";
	}else if(!ptc.value.match(inputSize)){
		ptc.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptPtc").innerHTML = "+ มีความยาว 5  ตัวอักษร";
	}else{
		ptc.style.border = "1px solid #000";
		document.getElementById("showScriptPtc").innerHTML = "";
	}
	
}
function CheckPostcode2(ptc) {
		ptc.style.border = "1px solid #000";
		document.getElementById("showScriptPtc").innerHTML = "";
}

///Java Script for Customer
function CheckSubmitToCustomer() {
	
	var birthday = new Date(document.getElementById('datepicker').value.split("/")[2]-543+"-"+document.getElementById('datepicker').value.split("/")[1]+"-"+document.getElementById('datepicker').value.split("/")[0]);
	var birthday2 = new Date();
	birthday2.setFullYear(new Date().getFullYear()-15);
	
	
	if (document.getElementById("username").value =="") {
		document.getElementById("username").style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ชื่อผู้ใช้งาน' !!" );
		document.getElementById("username").focus();
		 return false;
	}else if(document.getElementById('password').value == ""){
		document.getElementById('password').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'รหัสผ่าน' ของผู้ใช้งาน !!" );
		document.getElementById("password").focus();
		 return false;
	}else if(document.getElementById('passwordconfirm').value == ""){
		document.getElementById('passwordconfirm').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ยืนยันรหัสผ่าน' ของผู้ใช้งาน !!" );
		document.getElementById("passwordconfirm").focus();
		 return false;
	}else if(document.getElementById('fname').value == ""){
		document.getElementById('fname').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ชื่อจริง ' ของผู้ใช้งาน !!" );
		document.getElementById("fname").focus();
		 return false;
	}else if(document.getElementById('lname').value == ""){
		document.getElementById('lname').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'นามสกุล' ของผู้ใช้งาน !!" );
		document.getElementById("lname").focus();
		 return false;
	}else if(document.getElementById('datepicker').value ==""){
		document.getElementById('datepicker').style.border = "thick solid #ed3a14";
		alert( "กรุณาเลือก 'วัน/เดือน/ปีที่เกิด' ของผู้ใช้งาน !!" );
		document.getElementById("datepicker").focus();
		 return false;
	}else if(birthday.getTime() > birthday2.getTime()){
		document.getElementById('datepicker').style.border = "thick solid #ed3a14";
		alert( "อายุผู้สมัครคือ 15 ปีขึ้นไป !!" );
		document.getElementById("datepicker").focus();
		 return false;
	}else if(document.getElementById('tel').value == ""){
		document.getElementById('tel').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'เบอร์โทรศัพท์' ของผู้ใช้งาน !!" );
		document.getElementById("tel").focus();
		 return false;
	}else if(document.getElementById('email').value == ""){
		document.getElementById('email').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'อีเมล์' ของผู้ใช้งาน !!" );
		document.getElementById("email").focus();
		 return false;
	}else if(document.getElementById('address').value == ""){
		document.getElementById('address').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ที่อยู่' ของผู้ใช้งาน !!" );
		document.getElementById("address").focus();
		 return false;
	}else if(document.getElementById('subDistrict').value == ""){
		document.getElementById('subDistrict').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ตำบล/แขวง ' ของผู้ใช้งาน !!" );
		document.getElementById("subDistrict").focus();
		 return false;
	}else if(document.getElementById('district').value == ""){
		document.getElementById('district').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'อำเภอ/เขต ' ของผู้ใช้งาน !!" );
		document.getElementById("district").focus();
		 return false;
	}else if(document.getElementById('province').value == ""){
		document.getElementById('province').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'จังหวัด ' ของผู้ใช้งาน !!" );
		document.getElementById("province").focus();
		 return false;
	}else if(document.getElementById('postcode').value == ""){
		document.getElementById('postcode').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'รหัสไปษณีย์ ' ของผู้ใช้งาน !!" );
		document.getElementById("postcode").focus();
		 return false;
	}else{
		alert( "ท่านได้ตรวจสอบขอมูลละเอียดดีแล้ว ยืนยันการลงทะเบียนหรือไม่ ?" );
	}
	return true;
}
///Java Script for Service Person
function CheckSubmitToPerson() {
	
	var birthday = new Date(document.getElementById('datepicker2').value.split("/")[2]-543+"-"
							+document.getElementById('datepicker2').value.split("/")[1]
								+"-"+document.getElementById('datepicker2').value.split("/")[0]);
	var birthday2 = new Date();
	birthday2.setFullYear(new Date().getFullYear()-15);
	
	
	if (document.getElementById("username2").value =="") {
		document.getElementById("username2").style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ชื่อผู้ใช้งาน' !!" );
		document.getElementById("username2").focus();
		 return false;
	}else if(document.getElementById('password2').value == ""){
		document.getElementById('password2').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'รหัสผ่าน' ของผู้ใช้งาน !!" );
		document.getElementById("password2").focus();
		 return false;
	}else if(document.getElementById('passwordconfirm2').value == ""){
		document.getElementById('passwordconfirm2').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ยืนยันรหัสผ่าน' ของผู้ใช้งาน !!" );
		document.getElementById("passwordconfirm2").focus();
		 return false;
	}else if(document.getElementById('fname2').value == ""){
		document.getElementById('fname2').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ชื่อจริง ' ของผู้ใช้งาน !!" );
		document.getElementById("fname2").focus();
		 return false;
	}else if(document.getElementById('lname2').value == ""){
		document.getElementById('lname2').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'นามสกุล' ของผู้ใช้งาน !!" );
		document.getElementById("lname2").focus();
		 return false;
	}else if(document.getElementById('datepicker2').value ==""){
		document.getElementById('datepicker2').style.border = "thick solid #ed3a14";
		alert( "กรุณาเลือก 'วัน/เดือน/ปีที่เกิด' ของผู้ใช้งาน !!" );
		document.getElementById("datepicker2").focus();
		 return false;
	}else if(birthday.getTime() > birthday2.getTime()){
		document.getElementById('datepicker2').style.border = "thick solid #ed3a14";
		alert( "อายุผู้สมัครคือ 15 ปีขึ้นไป !!" );
		document.getElementById("datepicker2").focus();
		 return false;
	}else if(document.getElementById('tel2').value == ""){
		document.getElementById('tel2').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'เบอร์โทรศัพท์' ของผู้ใช้งาน !!" );
		document.getElementById("tel2").focus();
		 return false;
	}else if(document.getElementById('email2').value == ""){
		document.getElementById('email2').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'อีเมล์' ของผู้ใช้งาน !!" );
		document.getElementById("email2").focus();
		 return false;
	}else if(document.getElementById('address2').value == ""){
		document.getElementById('address2').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ที่อยู่' ของผู้ใช้งาน !!" );
		document.getElementById("address2").focus();
		 return false;
	}else if(document.getElementById('district2').value == ""){
		document.getElementById('district2').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ตำบล/แขวง ' ของผู้ใช้งาน !!" );
		document.getElementById("district2").focus();
		 return false;
	}else if(document.getElementById('amphoe2').value == ""){
		document.getElementById('amphoe2').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'อำเภอ/เขต ' ของผู้ใช้งาน !!" );
		document.getElementById("amphoe2").focus();
		 return false;
	}else if(document.getElementById('province2').value == ""){
		document.getElementById('province2').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'จังหวัด ' ของผู้ใช้งาน !!" );
		document.getElementById("province2").focus();
		 return false;
	}else if(document.getElementById('zipcode2').value == ""){
		document.getElementById('zipcode2').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'รหัสไปษณีย์ ' ของผู้ใช้งาน !!" );
		document.getElementById("zipcode2").focus();
		 return false;
	}else if(document.getElementById("couplePhotoCards").files.length == 0){
		document.getElementById("couplePhotoCards").style.border = "thick solid #ed3a14";
		alert( "กรุณาอัพโหลดไฟร์ 'รูปถ่ายคู่บัตรประชาชน ' ของผู้ใช้งาน !!" );
		document.getElementById("couplePhotoCards").focus();
		 return false;
	}else if(document.getElementById("idCardsPhoto").files.length == 0){
		document.getElementById("idCardsPhoto").style.border = "thick solid #ed3a14";
		alert( "กรุณาอัพโหลดไฟร์ 'เอกสารบัตรประชาชน ' ของผู้ใช้งาน !!" );
		document.getElementById("idCardsPhoto").focus();
		 return false;
	}else if(document.getElementById("profilePhoto").files.length == 0){
		document.getElementById("profilePhoto").style.border = "thick solid #ed3a14";
		alert( "กรุณาอัพโหลดไฟร์ 'รูปประจำตัว ' ของผู้ใช้งาน !!" );
		document.getElementById("profilePhoto").focus();
		 return false;
	}else{
		alert( "ท่านได้ตรวจสอบขอมูลละเอียดดีแล้ว ยืนยันการลงทะเบียนหรือไม่ ?" );
	}
	return true;
}
///Java Script for Company
function CheckSubmitToCompany() {
	
	
	if (document.getElementById("username3").value =="") {
		document.getElementById("username3").style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ชื่อผู้ใช้งาน' !!" );
		document.getElementById("username3").focus();
		 return false;
	}else if(document.getElementById('password3').value == ""){
		document.getElementById('password3').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'รหัสผ่าน' ของผู้ใช้งาน !!" );
		document.getElementById("password3").focus();
		 return false;
	}else if(document.getElementById('passwordconfirm3').value == ""){
		document.getElementById('passwordconfirm3').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ยืนยันรหัสผ่าน' ของผู้ใช้งาน !!" );
		document.getElementById("passwordconfirm3").focus();
		 return false;
	}else if(document.getElementById('companyName').value == ""){
		document.getElementById('companyName').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ชื่อของบริษัท ' ของผู้ใช้งาน !!" );
		document.getElementById("companyName").focus();
		 return false;
	}else if(document.getElementById('contactName').value == ""){
		document.getElementById('contactName').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ชื่อผู้ติดต่อ' ของผู้ใช้งาน !!" );
		document.getElementById("contactName").focus();
		 return false;
	}else if(document.getElementById('tel3').value == ""){
		document.getElementById('tel3').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'เบอร์โทรศัพท์' ของผู้ใช้งาน !!" );
		document.getElementById("tel3").focus();
		 return false;
	}else if(document.getElementById('email3').value == ""){
		document.getElementById('email3').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'อีเมล์' ของผู้ใช้งาน !!" );
		document.getElementById("email3").focus();
		 return false;
	}else if(document.getElementById('address3').value == ""){
		document.getElementById('address3').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ที่อยู่' ของผู้ใช้งาน !!" );
		document.getElementById("address3").focus();
		 return false;
	}else if(document.getElementById('district3').value == ""){
		document.getElementById('district3').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'ตำบล/แขวง ' ของผู้ใช้งาน !!" );
		document.getElementById("district3").focus();
		 return false;
	}else if(document.getElementById('amphoe3').value == ""){
		document.getElementById('amphoe3').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'อำเภอ/เขต ' ของผู้ใช้งาน !!" );
		document.getElementById("amphoe3").focus();
		 return false;
	}else if(document.getElementById('province3').value == ""){
		document.getElementById('province3').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'จังหวัด ' ของผู้ใช้งาน !!" );
		document.getElementById("province3").focus();
		 return false;
	}else if(document.getElementById('zipcode3').value == ""){
		document.getElementById('zipcode3').style.border = "thick solid #ed3a14";
		alert( "กรุณากรอก 'รหัสไปษณีย์ ' ของผู้ใช้งาน !!" );
		document.getElementById("zipcode3").focus();
		 return false;
	}else if(document.getElementById("businessLicense").files.length == 0){
		document.getElementById("businessLicense").style.border = "thick solid #ed3a14";
		alert( "กรุณาอัพโหลดไฟร์ 'ใบอนุญาตประกอบธุรกิจ ' ของผู้ใช้งาน !!" );
		document.getElementById("businessLicense").focus();
		 return false;
	}else if(document.getElementById("profilePhoto2").files.length == 0){
		document.getElementById("profilePhoto2").style.border = "thick solid #ed3a14";
		alert( "กรุณาอัพโหลดไฟร์ 'รูปโปรไฟล์  ' ของผู้ใช้งาน !!" );
		document.getElementById("profilePhoto2").focus();
		 return false;
	}else{
		alert( "ท่านได้ตรวจสอบขอมูลละเอียดดีแล้ว ยืนยันการลงทะเบียนหรือไม่ ?" );
	}
	return true;
}
function checkfileCom1(x){
	if(document.getElementById("businessLicense").files.length != 0){
		document.getElementById("businessLicense").style.border = "1px solid #000";
	}
}
function checkfileCom2(x){
	 if(document.getElementById("profilePhoto2").files.length != 0){
		document.getElementById("profilePhoto2").style.border = "1px solid #000";
	}
}
function checkCompanyName(cn) {
	var inputText = /^[A-Za-z-/._ก-์- 0-9]+$/ ;
	var inputSize = /^([A-Za-z-/._ก-์- 0-9]{2,32})?$/ ;
	if(cn.value == ""){
		cn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptcompanyName").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!cn.value.match(inputText)){
		cn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptcompanyName").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ  หรือภาษาไทย  และอักขระพิเศษที่กำหนดเท่านั้น[A-Za-zก-์- -/._] ";
	}else if(!cn.value.match(inputSize)){
		cn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptcompanyName").innerHTML = "+ มีความยาวตั้งแต่  2 - 32 ตัวอักษร";
	}else{
		cn.style.border = "1px solid #000";
		document.getElementById("showScriptcompanyName").innerHTML = "";
	}
}
function checkContactName(cn) {
	var inputText = /^[A-Za-zก-์- ]+$/ ;
	var inputSize = /^([A-Za-zก-์- ]{2,32})?$/ ;
	if(cn.value == ""){
		cn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptcontactName").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!cn.value.match(inputText)){
		cn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptcontactName").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ  หรือภาษาไทยเท่านั้น[A-Za-zก-์- ] ";
	}else if(!cn.value.match(inputSize)){
		cn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptcontactName").innerHTML = "+ มีความยาวตั้งแต่  2 - 32 ตัวอักษร";
	}else{
		cn.style.border = "1px solid #000";
		document.getElementById("showScriptcontactName").innerHTML = "";
	}
}
function checkfdFanpage(fn) {
	var inputText = /^[A-Za-z0-9-/_.()-_ก-์- ]+$/ ;
	var inputSize = /^([A-Za-z0-9-/_.()-_ก-์- ]{2,32})?$/ ;
	var inputSize2 = /^[- ]+$/ ;
	 if(!fn.value.match(inputText)){
		fn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptfdFanpage").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ  หรือภาษาไทย หรือตัวเลขอาบิก  และอักขระพิเศษที่กำหนดเท่านั้น[A-Za-z0-9ก-์-  -/_.()-_] ";
	}else if(fn.value.match(inputSize2)){
		fn.style.border = "1px solid #000";
		document.getElementById("showScriptfdFanpage").innerHTML = "";
	}else if(!fn.value.match(inputSize)){
		fn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptfdFanpage").innerHTML = "+ มีความยาวตั้งแต่  2 - 32 ตัวอักษร";
	}else{
		fn.style.border = "1px solid #000";
		document.getElementById("showScriptfdFanpage").innerHTML = "";
	}
}
function checkWebSite(ws) {
	var inputText = /^[A-Za-z0-9-ก-์- ]+$/ ;
	var inputSize = /^([A-Za-z0-9-ก-์-  ]{2,32})?$/ ;
	var inputSize2 = /^[- ]+$/ ;
	if(!ws.value.match(inputText)){
		ws.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptwebSite").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ  หรือภาษาไทย หรือตัวเลขอาบิก  และอักขระพิเศษที่กำหนดเท่านั้น[A-Za-z0-9 - ก-์- ] ";
	}else if(ws.value.match(inputSize2)){
		ws.style.border = "1px solid #000";
		document.getElementById("showScriptwebSite").innerHTML = "";
	}else if(!ws.value.match(inputSize)){
		ws.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptwebSite").innerHTML = "+ มีความยาวตั้งแต่  2 - 32 ตัวอักษร";
	}else{
		ws.style.border = "1px solid #000";
		document.getElementById("showScriptwebSite").innerHTML = "";
	}
}
function checkTelCompany(tel) {
	var inputText = /^[0-9]+$/ ;
	var inputSize = /^0([8|9|6|2|53])([0-9]{7,8}$)/ ;

	if(tel.value == ""){
		tel.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptTelCom").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!tel.value.match(inputText)){
		tel.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptTelCom").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ และตัวเลขอารบิกเท่านั้น [ 0-9 ]";
	}else if(!tel.value.match(inputSize)){
		tel.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptTelCom").innerHTML = "+ มีความยาว 9-10  ตัวอักษรเท่านั้น  และต้องขึ้นต้นด้วย '08','09','06','02','053' เท่านั้น";
	}else{
		tel.style.border = "1px solid #000";
		document.getElementById("showScriptTelCom").innerHTML = "";
	}
}
//=================== Check File Name is Not Thai//
var extensionLists = {}; //Create an object for all extension lists 
extensionLists.image = ['jpg', 'png'];

// One validation function for all file types    
function isValidFileType(fName, fType) {
    return extensionLists[fType].indexOf(fName.split('.').pop()) > -1;
    
}
function fileName(input) {
    var name = input.files[0].name.replace(/\.[^/.]+$/, '')
    var inputText = /^[ก-์]+$/ ;

    if(name.match(inputText)){
    	alert(name +'   ชื่อของไฟล์ไม่ถูกต้อง\n +ชื่อของไฟล์จะต้องเป็นตัวอักษร A-Z หรือ a-z และ ตัวเลข 0 - 9 เท่านั้น !!  ');
    	 input.value = "";
    }
    if (!isValidFileType(name,'image')) {
    	return failValidation(' กรุณาเลือกไฟล์รูปภาพ jsp หรือ png เท่านั้น');
    }
   
}

//====================== End From  Register  ==============================//

//====================== Check Create Request  =============================//
function checkUsername(x){
	var inputText = /^[A-Za-z0-9]+$/ ;
	var inputSize = /^([A-Za-z0-9]{5,15})?$/ ;

	if(x.value == ""){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptUS").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!x.value.match(inputText)){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptUS").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ และตัวเลขอารบิกเท่านั้น [A-Z,a-z] [0-9]";
	}else if(!x.value.match(inputSize)){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptUS").innerHTML = "+ มีความยาวตั้งแต่  5 - 15 ตัวอักษร";
	}else{
		x.style.border = "1px solid #000";
		document.getElementById("showScriptUS").innerHTML = "";
	}
}
/*<!-- ************* Script Cleaner Number ****************** -->*/

function showListDays () {
	var texts = document.getElementById("day").value; /* input value of radio id="day"  */
	document.getElementById('showCleanerno').style.display = 'block'; /* display id="showCleanerno"  */
	document.getElementById("cleanerNo").innerHTML = texts;	/* รับค่าจาก texts แล้วเอาไปใสใน ตัวที่มี id="cleanerNo" */
	document.getElementById('days').style.display = 'block'; 			/* display id="showCleanerno"  */

    document.getElementById('weeks').style.display = 'none';
    document.getElementById('months').style.display = 'none';
}
function showListWeek () {

    var texts = document.getElementById("week").value; 
    document.getElementById('showCleanerno').style.display = 'block';
    document.getElementById("cleanerNo").innerHTML = texts;
    document.getElementById('weeks').style.display = 'block'; 
    
    document.getElementById('days').style.display = 'none';
    document.getElementById('months').style.display = 'none';

}
function showListMonth () {
    var texts = document.getElementById("month").value; 
    document.getElementById('showCleanerno').style.display = 'block';
    document.getElementById("cleanerNo").innerHTML = texts;
    document.getElementById('months').style.display = 'block'; 
    
    document.getElementById('days').style.display = 'none';
    document.getElementById('weeks').style.display = 'none';

}

/********************* Show History Cleaner Provider *******************/
function showHistoryProviders () {
    document.getElementById('ShowtHistoryProvider').style.display = 'block';
}
function showNotHistoryProviders () {
    document.getElementById('ShowtHistoryProvider').style.display = 'none';
}
/******************** Check Price Min And Max  *****************************/
function checkpricemin(x) {
	var inputText = /^[0-9]+$/ ;
	var inputSize = /^([0-9]{3,5})?$/ ;

	if(x.value == ""){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("Moneymin").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!x.value.match(inputText)){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("Moneymin").innerHTML = "+ ต้องเป็นตัวเลขอารบิกเท่านั้น  [0-9]";
	}else if(!x.value.match(inputSize)){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("Moneymin").innerHTML = "+ มีความยาวตั้งแต่  3 - 5 ตัวอักษร";
	}else{
		x.style.border = "1px solid #000";
		document.getElementById("Moneymin").innerHTML = "";
	}
}
function checkpricemax(x) {
	var inputText = /^[0-9]+$/ ;
	var inputSize = /^([0-9]{3,5})?$/ ;

	if(x.value == ""){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("Moneymax").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!x.value.match(inputText)){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("Moneymax").innerHTML = "+ ต้องเป็นตัวเลขอารบิกเท่านั้น  [0-9]";
	}else if(!x.value.match(inputSize)){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("Moneymax").innerHTML = "+ มีความยาวตั้งแต่  3 - 5 ตัวอักษร";
	}else{
		x.style.border = "1px solid #000";
		document.getElementById("Moneymax").innerHTML = "";
	}
}
/******************** Check Data Customer *****************************/
function FName(fn) {
	var inputText = /^[A-Za-zก-์-]+$/ ;
	var inputSize = /^([A-Za-zก-์-]{2,32})?$/ ;
	if(fn.value == ""){
		fn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptFname").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!fn.value.match(inputText)){
		fn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptFname").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ  หรือภาษาไทยเท่านั้น[A-Za-zก-์-] และต้องไม่มีช่องว่างอยู่ภายในชื่อ";
	}else if(!fn.value.match(inputSize)){
		fn.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptFname").innerHTML = "+ มีความยาวตั้งแต่  2 - 32 ตัวอักษร";
	}else{
		fn.style.border = "1px solid #000";
		document.getElementById("showScriptFname").innerHTML = "";
	}
}
function LName(ln) {
	var inputText = /^[A-Za-zก-์- ]+$/ ;
	var inputSize = /^([A-Za-zก-์- ]{2,32})?$/ ;
	 if(!ln.value.match(inputText)){
		 ln.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptLname").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ  หรือภาษาไทยเท่านั้น[A-Za-zก-์- ]";
	}else if(!ln.value.match(inputSize)){
		ln.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptLname").innerHTML = "+ มีความยาวตั้งแต่  2 - 32 ตัวอักษร";
	}else{
		ln.style.border = "1px solid #000";
		document.getElementById("showScriptLname").innerHTML = "";
	}
}
function checkTelCustomer(tel) {
	var inputText = /^[0-9]+$/ ;
	var inputSize = /^0([8|9|6])([0-9]{8}$)/ ;

	if(tel.value == ""){
		tel.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptTel").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!tel.value.match(inputText)){
		tel.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptTel").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ และตัวเลขอารบิกเท่านั้น [ 0-9 ]";
	}else if(!tel.value.match(inputSize)){
		tel.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptTel").innerHTML = "+ มีความยาว 10  ตัวอักษรเท่านั้น  และต้องขึ้นต้นด้วย '08 หรือ 09 หรือ 06' เท่านั้น";
	}else{
		tel.style.border = "1px solid #000";
		document.getElementById("showScriptTel").innerHTML = "";
	}
}
function CheckAddress(adr) {
	var inputText = /^[A-Za-z0-9/. ก-์-]+$/ ;
	if(adr.value == ""){
		adr.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptAddress").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!adr.value.match(inputText)){
		adr.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptAddress").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ ภาษาไทย และตัวเลขอารบิกเท่านั้น [A-Z,a-z,ก-์,0-9] และมีตัวอักขระพิเศษ / เท่านั้น";
	}else{
		adr.style.border = "1px solid #000";
		document.getElementById("showScriptAddress").innerHTML = "";
	}
}
function CheckSubdistrict(sdt) {
	var inputText = /^[ก-์-]+$/ ;
	var inputSize = /^[ก-์-]{2,20}$/ ;
	if(sdt.value == " "){
		sdt.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptSubD").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
	}else if(!sdt.value.match(inputText)){
		sdt.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptSubD").innerHTML = "+ ต้องเป็นตัวอักษรภาษาไทยเท่านั้น [ก-์]";
	}else if(!sdt.value.match(inputSize)){
		sdt.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptSubD").innerHTML = "+ มีความยาวตั้งแต่  2 - 20 ตัวอักษร";
	}else{
		sdt.style.border = "1px solid #000";
		document.getElementById("showScriptSubD").innerHTML = "";
	}
}
function Checkdistrict(dt) {
	var inputText = /^[ก-์-]+$/ ;
	var inputSize = /^[ก-์-]{2,20}$/ ;
		if(!dt.value.match(inputText)){
			dt.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptDtt").innerHTML = "+ ต้องเป็นตัวอักษรภาษาไทยเท่านั้น [ก-์]";
		}else if(!dt.value.match(inputSize)){
			dt.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptDtt").innerHTML = "+ มีความยาวตั้งแต่  2 - 20 ตัวอักษร";
		}else{
			dt.style.border = "1px solid #000";
			document.getElementById("showScriptDtt").innerHTML = "";
		}
}
function Checkdistrict2(dt) {
	var inputText = document.getElementById("amphoe").value;

	if(!dt.value.match(inputText)){
			dt.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptDtt").innerHTML = "+ ต้องเป็นตัวอักษรภาษาไทยเท่านั้น [ก-์] ";
	}else{
		dt.style.border = "1px solid #000";
		document.getElementById("showScriptDtt").innerHTML = "";
	}
	
}
function CheckProvince(pvn) {
	var inputText = /^[ก-์-]+$/ ;
	var inputSize = /^[ก-์-]{2,20}$/ ;
		if(!pvn.value.match(inputText)){
			pvn.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptPvn").innerHTML = "+ ต้องเป็นตัวอักษรภาษาไทยเท่านั้น [ก-์]";
		}else if(!pvn.value.match(inputSize)){
			pvn.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptPvn").innerHTML = "+ มีความยาวตั้งแต่  2 - 20 ตัวอักษร";
		}else{
			pvn.style.border = "1px solid #000";
			document.getElementById("showScriptPvn").innerHTML = "";
		}
}
function CheckProvince2(dt) {
	var inputText = document.getElementById("province").value;
		
		if(dt.value == ""){
			pvn.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptPvn").innerHTML = "+ ต้องไม่เป็นค่าว่าง";
		}else{
			dt.style.border = "1px solid #000";
			document.getElementById("showScriptPvn").innerHTML = "";
		}
}
function CheckPostcode(ptc) {
	var inputText = /^[0-9]+$/ ;
	var inputSize = /^[0-9]{5}$/ ;
	 if(!ptc.value.match(inputText)){
		ptc.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptPtc").innerHTML = "+ ต้องเป็นตัวเลขเท่านั้น [0-9]";
	}else if(!ptc.value.match(inputSize)){
		ptc.style.border = "thick solid #ed3a14";
		document.getElementById("showScriptPtc").innerHTML = "+ มีความยาว 5  ตัวอักษร";
	}else{
		ptc.style.border = "1px solid #000";
		document.getElementById("showScriptPtc").innerHTML = "";
	}
	
}
function CheckPostcode2(ptc) {
	var inputText = document.getElementById("zipcode").value;
		ptc.style.border = "1px solid #000";
		document.getElementById("showScriptPtc").innerHTML = "";
}
/******************** Check After Submit *****************************/
function checkAllSubmit(){
	
	var selectOption = document.getElementById("listaddressType").value;
	var selectOption2 = document.getElementById("listaddressFormat").value;
	var selectOption3 = document.getElementById("listaddressType").value; 
	if(selectOption == "ทั้งหมด" ){
		selectOption.style.border = "thick solid #ed3a14";
	}else if(selectOption2 == "ทั้งหมด"){
		selectOption2.style.border = "thick solid #ed3a14";
	}else if(selectOption3 == "ทั้งหมด"){
		selectOption3.style.border = "thick solid #ed3a14";
	}else{
		selectOption.style.border = "1px solid #000";
		selectOption2.style.border = "1px solid #000";
		selectOption3.style.border = "1px solid #000";
	}
	
	var ServiceDate = new Date(document.getElementById('datepicker').value.split("/")[2]-543+"-"+document.getElementById('datepicker').value.split("/")[1]+"-"+document.getElementById('datepicker').value.split("/")[0]);
	var ServiceDate2 = new Date();
	//birthday2.setFullYear(new Date().getFullYear()-15);
		if(ServiceDate.getTime() <= ServiceDate2.getTime()){
			document.getElementById('datepicker').style.border = "thick solid #ed3a14";
			alert( "วันที่ต้องไม่ใช้วันที่ในอดิต หรือปัจจุบัน!!" );
		}
	
	var timeservice = document.getElementById("timeservice").value;
		if(timeservice == ""){
			alert( "กรุณากรอกเวลาเริ่มทำความสะอาด !!!" );
			timeservice.style.border = "1px solid #000";
		}
	
	
}
//====================== End Check Create Request ======================//

//====================== Check Filter to Address======================//
function checkSubDistrictThai(x) {
	var address = /^[ก-์-]+$/ ;
	if(!x.value.match(address)){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("checkSubDistrict").innerHTML = "+ กรุณากรอกเป็นภาษาไทย";
	}else{
		x.style.border = "1px solid #000";
		document.getElementById("checkSubDistrict").innerHTML = "";
	}
}
function checkdistrictThai(x) {
	var address = /^[ก-์-]+$/ ;
	if(!x.value.match(address)){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("checkdistrict").innerHTML = "+ กรุณากรอกเป็นภาษาไทย";
	}else{
		x.style.border = "1px solid #000";
		document.getElementById("checkdistrict").innerHTML = "";
	}
}
function checkprovinceThai(x) {
	var address = /^[ก-์-]+$/ ;
	if(!x.value.match(address)){
		x.style.border = "thick solid #ed3a14";
		document.getElementById("checkprovince").innerHTML = "+ กรุณากรอกเป็นภาษาไทย";
	}else{
		x.style.border = "1px solid #000";
		document.getElementById("checkprovince").innerHTML = "";
	}
}
//====================== End Check Filter to Address =========================//

//====================== pick Edit Show From Edit =========================//

function editCustomerdata() {
	
	//document.getElementById("username").disabled=false;
	document.getElementById("password").disabled=false;
	document.getElementById("passwordconfirm").disabled=false;
	document.getElementById("fname").disabled=false;
	document.getElementById("lname").disabled=false;
	document.getElementById("datepicker").disabled=false;
	document.getElementById("tel").disabled=false;
	document.getElementById("email").disabled=false;
	document.getElementById("address").disabled=false;
	document.getElementById("district").disabled=false;
	document.getElementById("amphoe").disabled=false;
	document.getElementById("province").disabled=false;
	document.getElementById("zipcode").disabled=false;
	
		document.getElementById("map").style.display ='block'; 
	document.getElementById("divButton").style.display = 'block';
	
	document.getElementById("editbutton").style.display='none';
	
}
function editPersondata() {
	
	//document.getElementById("username").disabled=false;
	document.getElementById("password2").disabled=false;
	document.getElementById("passwordconfirm2").disabled=false;
	document.getElementById("fname2").disabled=false;
	document.getElementById("lname2").disabled=false;
	document.getElementById("datepicker2").disabled=false;
	document.getElementById("tel2").disabled=false;
	document.getElementById("email2").disabled=false;
	document.getElementById("address2").disabled=false;
	document.getElementById("district").disabled=false;
	document.getElementById("amphoe").disabled=false;
	document.getElementById("province").disabled=false;
	document.getElementById("zipcode").disabled=false;
	document.getElementById("latitude").disabled=false;
	document.getElementById("longitude").disabled=false;
	
	document.getElementById("map").style.display ='block'; 
	document.getElementById("divButton2").style.display = 'block';
	
	document.getElementById("editbutton2").style.display='none';
	
	document.getElementById("showcpcimg1").style.display = 'block';
	document.getElementById("showcpcimg2").style.display='none';
	
	document.getElementById("showicpimg1").style.display = 'block';
	document.getElementById("showicpimg2").style.display='none';
	
	document.getElementById("showpppimg1").style.display = 'block';
	document.getElementById("showpppimg2").style.display='none';
}
function editCompanydata() {
	
	document.getElementById("password3").disabled=false;
	document.getElementById("passwordconfirm3").disabled=false;
	document.getElementById("companyName").disabled=false;
	document.getElementById("contactName").disabled=false;
	document.getElementById("fdFanpage").disabled=false;
	document.getElementById("fdFanpageURL").disabled=false;
	document.getElementById("webSite").disabled=false;
	document.getElementById("webSiteURL").disabled=false;
	document.getElementById("tel3").disabled=false;
	document.getElementById("email3").disabled=false;
	document.getElementById("address3").disabled=false;
	document.getElementById("district").disabled=false;
	document.getElementById("amphoe").disabled=false;
	document.getElementById("province").disabled=false;
	document.getElementById("zipcode").disabled=false;
	document.getElementById("latitude").disabled=false;
	document.getElementById("longitude").disabled=false;
	
	document.getElementById("map").style.display ='block'; 
	document.getElementById("divButton3").style.display = 'block';
	
	document.getElementById("editbutton3").style.display='none';
	
	document.getElementById("showbnlnimg1").style.display = 'block';
	document.getElementById("showbnlnimg2").style.display='none';
	
	document.getElementById("showpfpimg1").style.display = 'block';
	document.getElementById("showpfpimg2").style.display='none';
}
//====================== End pick Edit Show From Edit =========================//



