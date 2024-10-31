extends CanvasLayer

func cambiar_escena():
	$AnimationPlayer.play("bajar")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene("res://Escenas/test.tscn")
	$AnimationPlayer.play_backwards("bajar")
