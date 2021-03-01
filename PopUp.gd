extends Control


signal play_pressed


func _on_Button_pressed():
	emit_signal('play_pressed')


func show_win(time, moves):
	var minutes = time / 60
	var seconds = int(ceil(time)) % 60
	$CenterContainer/Panel/VBoxContainer/title.visible = false
	$CenterContainer/Panel/VBoxContainer/completed.visible = true
	$CenterContainer/Panel/VBoxContainer/Label.text = "Você encontrou todos os pares em %d:%d e %d jogadas!" % [minutes, seconds, moves]
	$CenterContainer/Panel/VBoxContainer/Button.text = "Repetir"
