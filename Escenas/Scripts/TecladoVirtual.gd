extends CanvasLayer

var textEdit

func _ready():
	textEdit = get_parent().get_node("nombreUsuario")
	print(textEdit)



func _on_T_pressed():
	textEdit.text += "T"

func _on_Y_pressed():
	textEdit.text += "Y"

func _on_U_button_up():
	textEdit.text += "U"

func _on_I_button_up():
	textEdit.text += "I"

func _on_O_button_up():
	textEdit.text += "O"

func _on_P_button_up():
	textEdit.text += "P"

func _on_A_button_up():
	textEdit.text += "A"

func _on_S_button_up():
	textEdit.text += "S"

func _on_D_button_up():
	textEdit.text += "D"

func _on_F_button_up():
	textEdit.text += "F"

func _on_G_button_up():
	textEdit.text += "G"

func _on_H_button_up():
	textEdit.text += "H"

func _on_J_button_up():
	textEdit.text += "J"

func _on_K_button_up():
	textEdit.text += "K"

func _on_L_button_up():
	textEdit.text += "L"

func _on_N__button_up():
	textEdit.text += "Ñ"

func _on_Z_button_up():
	textEdit.text += "Z"

func _on_X_button_up():
	textEdit.text += "X"

func _on_C_button_up():
	textEdit.text += "C"

func _on_V_button_up():
	textEdit.text += "V"

func _on_B_button_up():
	textEdit.text += "B"

func _on_N_button_up():
	textEdit.text += "N"

func _on_M_button_up():
	textEdit.text += "M"

func _on_0_button_up():
	textEdit.text += "0"

func _on_1_button_up():
	textEdit.text += "1"

func _on_2_button_up():
	textEdit.text += "2"

func _on_3_button_up():
	textEdit.text += "3"

func _on_4_button_up():
	textEdit.text += "4"

func _on_6_button_up():
	textEdit.text += "6"

func _on_5_button_up():
	textEdit.text += "5"

func _on_7_button_up():
	textEdit.text += "7"

func _on_8_button_up():
	textEdit.text += "8"

func _on_9_button_up():
	textEdit.text += "9"

func _on_Space_button_up():
	textEdit.text += " "

func _on_Del_button_up():
	var text = textEdit.text
	text.erase(text.length() - 1, 1)
	
	textEdit.text = text

func _on_Enter_button_up():
	queue_free()

func _on_Q_button_up():
	textEdit.text += "Q"


func _on_W_button_up():
	textEdit.text += "W"


func _on_E_button_up():
	textEdit.text += "E"


func _on_R_button_up():
	textEdit.text += "R"
