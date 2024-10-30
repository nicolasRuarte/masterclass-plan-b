extends Control

onready var httpRequest = get_node("VerificarUsuario")
onready var nombreUsuario = get_node("nombreUsuario")
onready var puntaje = get_node("puntaje")

var usuarioExiste := false
var json
const sslValid := false
var nombre : String
var customHeaders :=  ["Content-Type: application/json"]
var datos : Dictionary

func _ready():
	var test = get_parent().get_parent()
	
	if(test is Control):
		puntaje.text = str(test.mtsRecorridos)
	else: 
		print("Nodo padre no es de tipo Control")

func _on_SubirDatos_button_up():
	if (nombreUsuario.text == ""):
		print("Error: campo nombreUsuario incompleto")
		$lblError.text = "Completá el campo de nombre"
		$lblError.visible = true
	else:
		$lblError.visible = false
		datos = {
			"nombreUsuario": nombreUsuario.text,
			"puntaje": int(puntaje.text)
		}
		
		httpRequest.request("http://localhost:4000/obtener-registros", customHeaders, sslValid, HTTPClient.METHOD_GET)

func _on_VerificarUsuario_request_completed(result, response_code, headers, body):
	print("result: ", result)
	print("response_code: ", response_code)
	print("headers: ", headers)
	var usuarios = JSON.parse(body.get_string_from_utf8()).result
	print(usuarios)
	var existeUsuario = false
	
	for usuario in usuarios:
		if(usuario["nombre"] == datos["nombreUsuario"]):
			print("Usuario ya existe")
			existeUsuario = true
			break
		else:
			print("Usuario disponible")
			existeUsuario = false
	
	if (existeUsuario):
		$lblError.text = "El usuario ya existe"
		$lblError.visible = true
	else:
		$lblError.visible = false
		json = JSON.print(datos)
		print("Json enviado: ", json)
		httpRequest.request("http://localhost:4000/enviar-datos", customHeaders, sslValid, HTTPClient.METHOD_POST, json)
		print("Enviando registro")


func _on_SubirPuntaje_request_completed(_result, _response_code, _headers, _body):
	print("POST request completada")
