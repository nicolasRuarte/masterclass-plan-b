extends Control
onready var pregunta = get_node("ColorRect/Pregunta")
onready var opciones = get_node("opciones")
onready var nodoDatos = get_node("datos")

const cantidadPreguntas := 50

func _ready():
	print(nodoDatos.preguntasRespuestas[0]["pregunta"])


func _on_ItemList_item_selected(index):
	print("Item seleccionado: ", index)
	print("Items: ", opciones.items)
	
	
