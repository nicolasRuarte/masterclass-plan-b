extends Control
onready var pregunta = get_node("IU/ColorRect/Pregunta")
onready var opciones = get_node("IU/opciones")
onready var nodoDatos
onready var demoraRespuesta := get_node("DemoraRespuesta")

const cantidadPreguntas := 6
var datos

export var velocidadJugador = Vector2(10, 0)
var rachaRespuestasCorrectas := 0
var jugadorRespondio := false
var ordenPreguntas := []
var numeroPregunta := 0

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
	if (esRespuestaCorrecta(numeroPregunta, index)):
		rachaRespuestasCorrectas += 1
		velocidadJugador.x += 30
		demoraRespuesta.start()
	else:
		rachaRespuestasCorrectas = 0
		velocidadJugador.x -= 15
		demoraRespuesta.start()
	
	numeroPregunta += 1
	print("numeroPregunta: ", numeroPregunta)

func cargar_preguntas_y_respuestas(idPregunta : int):
	pregunta.text = datos[idPregunta]["pregunta"]
	
	if (numeroPregunta == 0):
		var respuestas = datos[idPregunta]["opciones"]
		for i in range(0, 4):
			opciones.add_item(respuestas[i])
			
	else:
		opciones.clear()
		var respuestas = datos[idPregunta]["opciones"]
		for i in range(0, 4):
			opciones.add_item(respuestas[i])
	
	

func esRespuestaCorrecta(numeroPregunta : int, index):
	var respuestaCorrecta = datos[ordenPreguntas[numeroPregunta]]["correcta"]
	if (index == respuestaCorrecta):
		opciones.set_item_custom_bg_color(index, Color(0, 0, 0))
		return true
	else:
		return false


func _on_DemoraRespuesta_timeout():
	cargar_preguntas_y_respuestas(numeroPregunta)
