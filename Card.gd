extends TextureButton

class_name Card

var suit   # naipe
var value  # numbers
var face   # front texture
var back   # back texture
var card_back = preload("res://assets/cards/cardBack_red2.png")

func _init(_suit, _value):
	suit = _suit
	value = _value
	face = load("res://assets/cards/card-" + str(suit) + "-" + str(value) + ".png")
	back = card_back
	set_normal_texture(back)


# Called when the node enters the scene tree for the first time.
func _ready():
	set_expand(true)
	set_h_size_flags(3)  # fill + expand, 1 + 2
	set_v_size_flags(3)  # fill + expand, 1 + 2
	set_stretch_mode(TextureButton.STRETCH_KEEP_ASPECT_CENTERED)


func _pressed():
	# GameManager.choose_card(self)
	# flip()
	pass


func flip():
	if get_normal_texture() == back:
		set_normal_texture(face)
	else:
		set_normal_texture(back)
