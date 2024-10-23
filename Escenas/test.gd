extends Control
onready var pregunta = get_node("IU/ColorRect/Panel/Pregunta")
onready var opciones = get_node("IU/ColorRect/opciones")
onready var nodoDatos
onready var demoraRespuesta := get_node("DemoraRespuesta")
onready var timerActualizarDistancia := get_node("actualizarDistancia")
onready var labelMtsRecorridos := get_node("IU/mtsRecorridos")
onready var labelVictoria := get_node("IU/victoria")

const cantidadPreguntas := 10
var datos

export var velocidadJugador = Vector2(10, 0)
var jugadorRespondio := false
var ordenPreguntas := []
var numeroPregunta := 0
const aumentoVelocidadJugador = 30
const disminucionVelocidadJugador = aumentoVelocidadJugador / 2
var victoria := false

#variables que se muestran en pantalla
var rachaRespuestasCorrectas := 0
var mtsRecorridos := 0.0

func _ready():
	randomize()
	nodoDatos = get_node("datos")
	datos = nodoDatos.preguntasRespuestas
	
	#Aleatorizando el orden de las preguntas al comenzar el juego
	for i in range(0, cantidadPreguntas):
		ordenPreguntas.append(datos[i]["id"])
	ordenPreguntas.shuffle()
	print("Orden de las preguntas: ", ordenPreguntas)
	
	cargar_preguntas_y_respuestas(ordenPreguntas[0])

func _on_ItemList_item_selected(index):
	victoria = numeroPregunta == cantidadPreguntas
	
	if (victoria):
		get_tree().paused = true
		labelVictoria.text = "¡Terminaste todas las preguntas!"
	else:
		if (esRespuestaCorrecta(numeroPregunta, index)):
			opciones.set_item_custom_bg_color(index, Color(0.0, 1.0, 0.0))
			rachaRespuestasCorrectas += 1
			velocidadJugador.x += aumentoVelocidadJugador
		else:
			opciones.set_item_custom_bg_color(index, Color(1.0, 0.0, 0.0))
			rachaRespuestasCorrectas = 0
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
	cargar_preguntas_y_respuestas(ordenPreguntas[numeroPregunta])



func _on_actualizarDistancia_timeout():
	mtsRecorridos += velocidadJugador.x * 10
	
	labelMtsRecorridos.text = "mts. recorridos: " + str(mtsRecorridos)
