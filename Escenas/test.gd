extends Control
onready var pregunta = get_node("IU/ColorRect/Panel/Pregunta")
onready var opciones = get_node("IU/ColorRect/opciones")
onready var nodoDatos
onready var demoraRespuesta := get_node("DemoraRespuesta")
onready var timerActualizarDistancia := get_node("actualizarDistancia")
onready var labelMtsRecorridos := get_node("IU/mtsRecorridos")
onready var labelFin := get_node("IU/Fin")
onready var labelRacha := get_node("IU/Racha")
onready var labelBonificador := get_node("IU/Bonificador")

var subirDatos = preload("res://Escenas/SubirDatos.tscn")

#Variables para las preguntas
var cantidadPreguntas := 0
var datos

#Variables de la velocidad del jugador
export var velocidadJugador = Vector2(10, 0)
const aumentoVelocidadJugador = 30
const disminucionVelocidadJugador = aumentoVelocidadJugador / 2

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
		labelFin.text = "¡Terminaste todas las preguntas!"

	if (esRespuestaCorrecta(numeroPregunta, index)):
		opciones.set_item_custom_bg_color(index, Color(0.0, 1.0, 0.0))
		rachaRespuestasCorrectas += 1
		bonusRacha(rachaRespuestasCorrectas)
		labelRacha.text = str(rachaRespuestasCorrectas)
		velocidadJugador.x += aumentoVelocidadJugador + bonificador
	else:
		opciones.set_item_custom_bg_color(index, Color(1.0, 0.0, 0.0))
		rachaRespuestasCorrectas = 0
		bonusRacha(rachaRespuestasCorrectas)
		bonificador = 0
		var menorQueCero = velocidadJugador.x - disminucionVelocidadJugador < 0
		if (menorQueCero):
			velocidadJugador.x = 10
		else:
			velocidadJugador.x -= disminucionVelocidadJugador
		
	for i in range (0, 4):
		opciones.set_item_disabled(i, true)

	demoraRespuesta.start()

	print("numeroPregunta: ", numeroPregunta)
	print("velocidadJugador: ", velocidadJugador)

func cargar_preguntas_y_respuestas(idPregunta : int):
	pregunta.text = datos[idPregunta]["pregunta"]
	
	opciones.clear()
	var respuestas = datos[idPregunta]["opciones"]
	for i in range(0, 4):
		opciones.add_item(respuestas[i])
	

func esRespuestaCorrecta(numeroPregunta : int, index):
	var respuestaCorrecta = datos[ ordenPreguntas[numeroPregunta] ] [ "correcta" ]
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



func _on_actualizarDistancia_timeout():
	mtsRecorridos += velocidadJugador.x * 10
	
	labelMtsRecorridos.text = "mts. recorridos: " + str(mtsRecorridos)

func bonusRacha(racha): 
	match racha:
		5:
			bonificador = 10
			labelBonificador.text = "+" + str(bonificador)
		10:
			bonificador = 20
			labelBonificador.text = "+" + str(bonificador)
		15:
			bonificador = 30
			labelBonificador.text = "+" + str(bonificador)
		20:
			bonificador = 40
			labelBonificador.text = "+" + str(bonificador)
		
