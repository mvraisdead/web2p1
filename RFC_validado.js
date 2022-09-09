function R(){
    var texto="";
    var error="";
    var caracteres['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    var dato1=document.getElementById("n").value;
    if(dato=="") error+="Falta nombre <br>"
    else dato1= dato1.substring.(0,1);

    var dato2=document.getElementById("n").value;
    if(dato=="") error+="Falta nombre <br>"
    else dato2= dato1.substring.(0,2);

    var dato3=document.getElementById("n").value;
    if(dato=="") error+="Falta nombre <br>"
    else dato3= dato3.substring.(0,1);

    if(document.getElementById("bday").value){
        //1990-11-02
        var dato4=document.getElementById("bday").value.substring(2, 4);
        var dato5=document.getElementById("bday").value.substring(5, 7);
        var dato6=document.getElementById("bday").value.substring(8, 10);
    }else error += "Falta bDay"<br>
    var dato7= ""; //hacer aleatorio
    var i=0;
    for(i=0; i<3; i++){
        dato7 +=caracteres[Math.floor(Math.random()*caracteres.length)];
    }
    texto = dato1 + dato2 + dato3 + dato4 + dato5 + dato6 + dato7;
    document.getElementById("RFC").value=texto.toLocaleUpperCase();
    document.getElementById("error").innerHTML=error; 
}