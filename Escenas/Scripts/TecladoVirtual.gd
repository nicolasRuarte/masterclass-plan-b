extends CanvasLayer

func _process(delta):
	$TextEdit.focus_mode = Control.FOCUS_ALL

func _on_Q_button_up():
	$TextEdit.text += "Q"
	Input.action_press("Q")


func _on_W_button_up():
	Input.action_press("W")


func _on_E_button_up():
	Input.action_press("E")


func _on_R_button_up():
	Input.action_press("R")


func _on_T_pressed():
	Input.action_press("T")


func _on_Y_pressed():
	Input.action_press("Y")


func _on_U_button_up():
	Input.action_press("U")


func _on_I_button_up():
	Input.action_press("I")


func _on_O_button_up():
	Input.action_press("O")


func _on_P_button_up():
	Input.action_press("P")


func _on_A_button_up():
	Input.action_press("A")


func _on_S_button_up():
	Input.action_press("S")


func _on_D_button_up():
	Input.action_press("D")


func _on_F_button_up():
	Input.action_press("F")


func _on_G_button_up():
	Input.action_press("G")


func _on_H_button_up():
	Input.action_press("H")


func _on_J_button_up():
	Input.action_press("J")


func _on_K_button_up():
	Input.action_press("K")


func _on_L_button_up():
	Input.action_press("L")


func _on_N__button_up():
	Input.action_press("ñ")


func _on_Z_button_up():
	Input.action_press("Z")


func _on_X_button_up():
	Input.action_press("X")


func _on_C_button_up():
	Input.action_press("C")


func _on_V_button_up():
	Input.action_press("V")


func _on_B_button_up():
	Input.action_press("B")


func _on_N_button_up():
	Input.action_press("N")


func _on_M_button_up():
	Input.action_press("M")


func _on_0_button_up():
	Input.action_press("0")


func _on_1_button_up():
	Input.action_press("1")


func _on_2_button_up():
	Input.action_press("2")


func _on_3_button_up():
	Input.action_press("3")


func _on_4_button_up():
	Input.action_press("4")


func _on_6_button_up():
	Input.action_press("6")


func _on_5_button_up():
	Input.action_press("5")


func _on_7_button_up():
	Input.action_press("7")


func _on_8_button_up():
	Input.action_press("8")


func _on_9_button_up():
	Input.action_press("9")


func _on_Space_button_up():
	Input.action_press("Space")
