extends CanvasLayer

signal start_game
signal new_game


# Called when the node enters the scene tree for the first time.
func _ready():
	$P1Score.hide()
	$P2Score.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_p1_score(score):
	$P1Score.text = str(score)
func update_p2_score(score):
	$P2Score.text = str(score)
	
func show_msg(text):
	$Title.text = text
	$Title.show()
	
func results(num):
	if(num == 1):
		show_msg("Player 1 Wins")
	else:
		show_msg("Player 2 Wins")
	await get_tree().create_timer(2.0).timeout
	$Title.text = "PONGCHAMP"
	$Title.show()
	$P1Score.hide()
	$P2Score.hide()
	$Start.show()
	new_game.emit()
	
func _on_start_pressed():
	$Start.hide()
	$Title.hide()
	$P1Score.show()
	$P2Score.show()
	start_game.emit()
