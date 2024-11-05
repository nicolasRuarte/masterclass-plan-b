extends Node

onready var label = $TiempoPregunta
onready var timer = $Timer

func _ready():
	timer.start()

func tiempo_restante():
	var tiempoRestante = timer.time_left
	var segundos = int(tiempoRestante)
	
	return segundos

func _process(delta):
	$TiempoPregunta.text = str(tiempo_restante())

