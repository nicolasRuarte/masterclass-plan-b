extends Control

func _ready():
	$AnimacionTitulo.start()
	$AnimationPlayer.play("texto")
	$AudioStreamPlayer.play()

func _on_AnimacionTitulo_timeout():
	if($"Título".visible):
		$"Título".visible = false
	else:
		$"Título".visible = true


func _on_Jugar_button_up():
	$AudioStreamPlayer.stop()
	EscenaTransicion.cambiar_escena()
