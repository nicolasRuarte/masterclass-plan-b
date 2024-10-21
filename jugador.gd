extends KinematicBody2D
var nodoPadre
var velocidad

func _ready():
	nodoPadre = get_parent()

func _physics_process(delta):
	velocidad = nodoPadre.velocidadJugador
	move_and_slide(velocidad)
