extends Control

var hits = 0
var time_passed = 0

var card1 = null
var card2 = null

var deck = Array()
var card_back = preload("res://assets/cards/cardBack_red2.png")

const SUITS = 4
const VALUES = 13

# Called when the node enters the scene tree for the first time.
func _ready():
	$title.visible = true
	$GridContainer.visible = false
	randomize()
	fill_deck()
	yield(get_tree().create_timer(2), "timeout")
	$title.visible = false
	deal_deck()
	start_clock()


func fill_deck():
	hits = 0
	deck.clear()
	for suit in range(SUITS):
		for value in range(VALUES):
			var c = Card.new(suit+1, value+1)
			c.connect('pressed', self, 'choose_card', [c])
			deck.append(c)
	deck.shuffle()


func deal_deck():
	for child in $GridContainer.get_children():
		child.free()
	for card in deck:
		$GridContainer.add_child(card)
	$GridContainer.visible = true


func choose_card(card):
	if card1 == null:
		card1 = card
	elif card2 == null:
		card2 = card
		check_cards()
	else:
		return
	$CardFlip.play()
	card.flip()
	card.set_disabled(true)


func check_cards():
	if card1.value == card2.value:
		yield(get_tree().create_timer(1), "timeout")
		next_round()
	else:
		yield(get_tree().create_timer(1), "timeout")
		reset_cards()


func next_round():
	card1.modulate = Color(0.5,0.5,0.5,0.5)
	card2.modulate = Color(0.5,0.5,0.5,0.5)
	card1 = null
	card2 = null
	hits += 1
	update_score(hits)
	$Right.play()
	# print('%d HITS' % hits)
	if hits == deck.size() / 2:
		yield($Right, 'finished')
		$Win.play()
		print('Game Finished')
		$completed.visible = true
		$Timer.stop()


func reset_cards():
	card1.flip()
	card2.flip()
	card1.set_disabled(false)
	card2.set_disabled(false)
	card1 = null
	card2 = null
	$Wrong.play()


func start_clock():
	time_passed = 0;
	$Timer.start()


func update_score(value):
	$Labels/Score.text = "Placar: " + str(value)


func _on_TextureButton1_pressed():
	#GameManager.restart()
	pass # Replace with function body.


func _on_TextureButton2_pressed():
	#GameManager.start()
	pass # Replace with function body.


func _on_TextureButton3_pressed():
	#GameManager.pause()
	pass # Replace with function body.


func _on_Timer_timeout():
	time_passed += 1
	var minutes = time_passed / 60
	var seconds = int(ceil(time_passed)) % 60
	$Labels/Timer.text = "%02d" % minutes + ":" + "%02d" % seconds
