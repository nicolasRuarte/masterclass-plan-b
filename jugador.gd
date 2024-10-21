extends KinematicBody2D

var velocity := Vector2()

func _physics_process(delta):
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 250
	move_and_slide(velocity)
