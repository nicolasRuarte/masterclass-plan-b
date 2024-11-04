extends Control
onready var pregunta = get_node("IU/ColorRect/Panel/Pregunta")
onready var opciones = get_node("IU/ColorRect/opciones")
onready var nodoDatos
onready var demoraRespuesta := get_node("DemoraRespuesta")
onready var timerActualizarDistancia := get_node("actualizarDistancia")
onready var labelMtsRecorridos := get_node("IU/mtsRecorridos")
onready var labelBonificador := get_node("IU/Bonificador")

var subirDatos = preload("res://Escenas/SubirDatos.tscn")

#Variables para las preguntas
var cantidadPreguntas := 0
var datos
var yaRespondio = false
var estaEnRacha := false

#Variables de la velocidad del jugador
export var velocidadJugador = Vector2(0, -10)
const aumentoVelocidadJugador = -30
const disminucionVelocidadJugador = 15

#Variables para el desarrollo de las preguntas del juego
var ordenPreguntas := []
var numeroPregunta := 0

#Variable de finalización de juego
var fin := false

#variables que se muestran en pantalla
var rachaRespuestasCorrectas := 0
var bonificador = 0
var mtsRecorridos := 0.0

func _ready():
	randomize()
	$AudioStreamPlayer.play()
	nodoDatos = get_node("datos")
	datos = nodoDatos.preguntasRespuestas
	cantidadPreguntas = datos.size()
	
	#Aleatorizando el orden de las preguntas al comenzar el juego
	for i in range(0, cantidadPreguntas):
		ordenPreguntas.append(datos[i]["id"])
	
	ordenPreguntas.shuffle()
	print("Orden de las preguntas: ", ordenPreguntas)
	
	cargar_preguntas_y_respuestas(ordenPreguntas[0])

func _on_ItemList_item_selected(index):
	fin = numeroPregunta == cantidadPreguntas - 1
	
	if (fin):
		var cuestionario = subirDatos.instance()
		$IU.add_child(cuestionario)
		get_tree().paused = true
	
	if(yaRespondio):
		return
	
	if (esRespuestaCorrecta(numeroPregunta, index)):
		opciones.set_item_custom_bg_color(index, Color(0.0, 1.0, 0.0))
		$sonidoCorrecto.play()
		rachaRespuestasCorrectas += 1
		bonusRacha(rachaRespuestasCorrectas)
		$IU/Fuego/Racha.text = str(rachaRespuestasCorrectas)
		velocidadJugador.y += aumentoVelocidadJugador - bonificador
		$IU/Dialogo.hablar(true)
	else:
		opciones.set_item_custom_bg_color(index, Color(1.0, 0.0, 0.0))
		$sonidoIncorrecto.play()
		rachaRespuestasCorrectas = 0
		$IU/Fuego/Racha.text = str(rachaRespuestasCorrectas)
		
		if (estaEnRacha):
			$AnimationPlayer.play_backwards("fuego")
			$IU/Fuego/Racha.add_color_override("font_color", Color(0, 0, 0 ))
			labelBonificador.text = ""
		estaEnRacha = false
		bonificador = 0
		
		var mayorQueCero = velocidadJugador.y + disminucionVelocidadJugador > 0
		if (mayorQueCero):
			velocidadJugador.y = -10
		else:
			velocidadJugador.y += disminucionVelocidadJugador
		$IU/Dialogo.hablar(false)
	
	yaRespondio = true
	
	demoraRespuesta.start()
	for i in range (0, 4):
		opciones.set_item_disabled(i, true)

	print("numeroPregunta: ", numeroPregunta)
	print("velocidadJugador: ", velocidadJugador)

func cargar_preguntas_y_respuestas(idPregunta : int):
	pregunta.text = datos[idPregunta]["pregunta"]
	
	opciones.clear()
	var respuestas = datos[idPregunta]["opciones"]
	for i in range(0, 4):
		opciones.add_item(respuestas[i])
	

func esRespuestaCorrecta(numPregunta, index):
	var respuestaCorrecta = datos[ ordenPreguntas[numPregunta] ] [ "correcta" ]
	if (index == respuestaCorrecta):
		print("Jugador respondió correctamente. Index: ", index, ". respuestaCorrecta: ", respuestaCorrecta)
		return true
	else:
		print("Jugador respondió incorrectamente. Index: ", index, ". respuestaCorrecta: ", respuestaCorrecta)
		return false

func _on_DemoraRespuesta_timeout():
	numeroPregunta += 1
	print("Cargando pregunta: ", numeroPregunta)
	cargar_preguntas_y_respuestas(ordenPreguntas[numeroPregunta])
	yaRespondio = false

func _on_actualizarDistancia_timeout():
	mtsRecorridos += velocidadJugador.y * 10 * -1	
	
	labelMtsRecorridos.text = "kms recorridos: " + str(mtsRecorridos)

func bonusRacha(racha):	 
	match racha:
		5:
			estaEnRacha = true
			bonificador = 10
			labelBonificador.text = "+" + str(bonificador)
			$AnimationPlayer.play("fuego")
			$IU/Fuego.play("default")
			$IU/Fuego/Racha.add_color_override("font_color", Color(0, 0, 0))
			$Racha.play()
		10:
			bonificador = 20
			labelBonificador.text = "+" + str(bonificador)
			$AnimationPlayer.play("fuego2")
			print("Escala fuego pasó a : ", $IU/Fuego.scale)
		15:
			bonificador = 30
			labelBonificador.text = "+" + str(bonificador)
		20:
			bonificador = 50
			labelBonificador.text = "+" + str(bonificador)
