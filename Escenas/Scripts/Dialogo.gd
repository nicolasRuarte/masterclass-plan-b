extends Label

var felicitaciones := [
	"¡Bien hecho!",
	"print(¡Correcto!)",
	"¡Bien respondido!",
	"¡Eres una máquina!",
	"Ni ChatGPT la sacaba",
	"¡Automático!",
	"¡Nervios de acero!",
	"Google un poroto",
	"¡Vino aceitado!",
	"jugador.Genio = true"
]

var consuelos = [
	"Nos demuestra que es humano",
	"¡Vamos que todavía hay pilas!",
	"Hay que aceitar el motor nomás \n¡Vamos!",
	"if (error) seguirAdelante()",
	"Ajustamos tuercas y a seguir",
	"Errar es humano",
	"Tranquilo. Solo fue un \ncruzamiento de cables",
	"Solo fue un error en la señal",
	"El que no haya contestado mal \nque tire el primer transistor",
	"Puedes culpar a los que \nexponen"
]

func _ready():
	randomize()

func hablar(respuestaCorrecta):
	var probabilidad = randi() % 100 + 1
	
	if (probabilidad >= 0 && probabilidad <= 35):
		$AnimationPlayer.play("aparecer")
		if(respuestaCorrecta):
			text = felicitaciones[randi() % felicitaciones.size()]
		else:
			text = consuelos[randi() % consuelos.size()]
		yield($AnimationPlayer, "animation_finished")
		$AnimationPlayer.play_backwards("aparecer")
	else:
		return
