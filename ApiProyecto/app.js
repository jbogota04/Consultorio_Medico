const express = require("express")
const mysql=require("mysql")
const myconn=require("express-myconnection")
// const app=express()
// const indexroutes=require("./routes/index")

//cadena de conexion
const conexion=mysql.createConnection({
	host:"localhost",
	port:3308,
	user:"root",
	password:"wika2022",
	database:"gestiondecitasusuario"
});

conexion.connect(function(err){
	if(err){
		console.log("Error de conexion:" + err.stack)
		return;
	}else {
		console.log(" Conexion Exitosa # de identificador " + conexion.threadId)
	}
	

})