extends Control

onready var httpRequest = get_node("VerificarUsuario")
onready var nombreUsuario = get_node("nombreUsuario")
onready var puntaje = get_node("puntaje")

var usuarioExiste := false
var json
const sslValid := true
var nombre : String
var customHeaders :=  ["Content-Type: application/json"]
var datos : Dictionary
var teclado := preload("res://Escenas/TecladoVirtual.tscn")
var yaSubioDatos := false

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
		
		if(!yaSubioDatos):
			httpRequest.request("https://pagina-puntajes.onrender.com/obtener-registros", customHeaders, sslValid, HTTPClient.METHOD_GET)
			
		else:
			$lblError.text = "Ya subiste tus datos"
			$lblError.add_color_override("font_color", Color(1, 0, 0))
			$lblError.visible = true
	
	

func _on_VerificarUsuario_request_completed(result, response_code, headers, body):
	print("result: ", result)
	print("response_code: ", response_code)
	print("headers: ", headers)
	var usuarios = JSON.parse(body.get_string_from_utf8()).result
	var existeUsuario = false
	
	for usuario in usuarios:
		if(usuario["nombre"] == datos["nombreUsuario"]):
			existeUsuario = true
			break
		else:
			existeUsuario = false
	
	if (existeUsuario):
		$lblError.text = "El usuario ya existe"
		$lblError.visible = true
	else:
		$lblError.visible = false
		json = JSON.print(datos)
		print("Json enviado: ", json)
		$SubirPuntaje.request("https://pagina-puntajes.onrender.com/enviar-datos", customHeaders, sslValid, HTTPClient.METHOD_POST, json)
		print("Enviando registro")
		$lblError.add_color_override("font_color", Color(0, 1, 0))
		$lblError.text = "Datos enviados exitosamente"
		$lblError.visible = true
		yaSubioDatos = true


func _on_SubirPuntaje_request_completed(_result, _response_code, _headers, _body):
	print("POST request completada")
	


func _on_nombreUsuario_focus_entered():
	var instancia = teclado.instance()
	add_child(instancia)

func _on_nombreUsuario_focus_exited():
	$TecladoVirtual/ColorRect.visible = true

func _on_Cerrar_button_up():
	get_tree().quit()
