extends CanvasLayer

signal start_game # Used when the player clicks start
signal new_game

# Messages used
const p1Win:String = "Player 1 Wins"
const p2Win:String = "Player 2 Wins"
const title:String = "PONGCHAMP"


# Called when the node enters the scene tree for the first time.
func _ready():
	$P1Score.hide()
	$P2Score.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called when the score needs to be updated
func update_p1_score(score):
	$P1Score.text = str(score)
func update_p2_score(score):
	$P2Score.text = str(score)
	
# Called for the victory screen
func show_msg(text):
	$Title.text = text
	$Title.show()
	
# Called when one player wins
# @Param int winner player number
func results(num):
	# Show the appropriate victory msg
	if(num == 1):
		show_msg(p1Win)
	else:
		show_msg(p2Win)
	
	# Go back to the main screen
	$Title.text = title
	$Title.show()
	$P1Score.hide()
	$P2Score.hide()
	$Start.show()
	new_game.emit()
	
# Starts the game when the player clicks start
func _on_start_pressed():
	# Hide the background and "PONGCHAMP"
	$Start.hide()
	$Title.hide()
	# Show the player scores
	$P1Score.show()
	$P2Score.show()
	start_game.emit()
