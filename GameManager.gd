extends Node

onready var Game = get_node('/root/Game/')

#var hits = 0
#
#var card1 = null
#var card2 = null
#
#var deck = Array()
#var card_back = preload("res://assets/cards/cardBack_red2.png")

# Called when the node enters the scene tree for the first time.
func _ready():
#	Game.get_node('title').visible = true
#	Game.get_node('GridContainer').visible = false
#	randomize()
#	fill_deck()
#	yield(get_tree().create_timer(2), "timeout")
#	Game.get_node('title').visible = false
#	deal_deck()
#	Game.start_clock()
	pass


#func fill_deck():
#	hits = 0
#	var SUITS = 4
#	var VALUES = 13
#	deck.clear()
#	for suit in range(SUITS):
#		for value in range(VALUES):
#			var c = Card.new(suit+1, value+1)
#			deck.append(c)
#	deck.shuffle()


#func deal_deck():
#	for child in Game.get_node('GridContainer').get_children():
#		child.free()
#	for card in deck:
#		Game.get_node('GridContainer').add_child(card)
#	Game.get_node('GridContainer').visible = true


#func choose_card(card):
#	if card1 == null:
#		card1 = card
#	elif card2 == null:
#		card2 = card
#		check_cards()
#	else:
#		return
#	Game.get_node('CardFlip').play()
#	card.flip()
#	card.set_disabled(true)


#func check_cards():
#	if card1.value == card2.value:
#		yield(get_tree().create_timer(1), "timeout")
#		next_round()
#	else:
#		yield(get_tree().create_timer(1), "timeout")
#		reset_cards()


#func next_round():
#	card1.modulate = Color(0.5,0.5,0.5,0.5)
#	card2.modulate = Color(0.5,0.5,0.5,0.5)
#	card1 = null
#	card2 = null
#	hits += 1
#	Game.update_score(hits)
#	Game.get_node('Right').play()
#	print('%d HITS' % hits)
#	if hits == deck.size() / 2:
#		yield(Game.get_node('Right'), 'finished')
#		Game.get_node('Win').play()
#		print('Game Finished')
#		Game.get_node('completed').visible = true
#
#
#func reset_cards():
#	card1.flip()
#	card2.flip()
#	card1.set_disabled(false)
#	card2.set_disabled(false)
#	card1 = null
#	card2 = null
#	Game.get_node('Wrong').play()


#func restart():
#	_ready()
#
#
#func start():
#	pass # Replace with function body.
#
#
#func pause():
#	pass
