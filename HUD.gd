extends Control


signal reset_pressed
signal pause_resume_pressed

var play_button = preload("res://assets/ui/play.png")
var pause_button = preload("res://assets/ui/pause.png")


func _on_Pause_pressed():
	var button = $Panel/Sections/Buttons/Pause
	if button.get_normal_texture() == play_button:
		button.set_normal_texture(pause_button)
	else:
		button.set_normal_texture(play_button)
	emit_signal('pause_resume_pressed')


func _on_Reset_pressed():
	emit_signal('reset_pressed')


func update_moves(value):
	$Panel/Sections/Moves/Value.text = str(value)


func update_score(value):
	$Panel/Sections/Score/Value.text = str(value)


func update_clock(value):
	var minutes = value / 60
	var seconds = int(ceil(value)) % 60
	$Panel/Sections/Timer/Value.text = "%02d" % minutes + ":" + "%02d" % seconds
