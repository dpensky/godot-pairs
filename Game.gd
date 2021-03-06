extends Control

var hits = 0
var moves = 0
var time_passed = 0
var paused = false

var card1 = null
var card2 = null

var deck = Array()
var card_back = preload("res://assets/cards/cardBack_red2.png")

const SUITS = 2
const VALUES = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$PopUp.visible = true
	$HUD.visible = false
	$GridContainer.visible = false
	randomize()


func fill_deck():
	hits = 0
	moves = 0
	$HUD.update_score(hits)
	$HUD.update_moves(moves)
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
	if paused:
		return
	if card1 == null:
		card1 = card
	elif card2 == null:
		card2 = card
		check_cards()
	else:
		return
	$Sounds/CardFlip.play()
	card.flip()
	card.set_disabled(true)


func check_cards():
	moves += 1
	$HUD.update_moves(moves)
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
	$HUD.update_score(hits)
	$Sounds/Right.play()
	# print('%d HITS' % hits)
	if hits == deck.size() / 2:
		yield($Sounds/Right, 'finished')
		paused = true
		$Sounds/Win.play()
		print('Game Finished')
		$Timer.stop()
		$PopUp.visible = true
		$PopUp.show_win(time_passed, moves)


func reset_cards():
	card1.flip()
	card2.flip()
	card1.set_disabled(false)
	card2.set_disabled(false)
	card1 = null
	card2 = null
	$Sounds/Wrong.play()


func start_clock():
	time_passed = 0;
	$HUD.update_clock(time_passed)
	$Timer.start()


func _on_Timer_timeout():
	time_passed += 1
	$HUD.update_clock(time_passed)


func _on_PopUp_play_pressed():
	paused = false
	fill_deck()
	$PopUp.visible = false
	$HUD.visible = true
	deal_deck()
	start_clock()


func _on_HUD_pause_resume_pressed():
	if card1 or card2:
		return
	paused = not paused
	$Timer.paused = paused


func _on_HUD_reset_pressed():
	_on_PopUp_play_pressed()
