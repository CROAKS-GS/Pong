extends Node

var player1score 
var player2score 

const victoryCond:int = 5 # Score needed for a Dub

signal bounce # Used to signal a ball bounce


# Called when the node enters the scene tree for the first time.
func _ready():
	$Background.visible = false

# Sets the background and player/ball positions
func new_game():
	$Background.visible = true
	$ColorRect.visible = false
	$player1.start($Player1Position.position)
	$player2.start($Player2Position.position)
	$Ball.start()
	player1score = 0
	player2score = 0

# Called when the player plays another game
# NOT FINALIZED
func additional_game():
	$Background.visible = false
	$ColorRect.visible = true
	$player1.hide()
	$player2.hide()
	$Ball.hide()
	$Ball.velocity = Vector2.ZERO

# Called when one player scores to reset the positions of players and ball
func reset():	
	$player1.start($Player1Position.position)
	$player2.start($Player2Position.position)
	$Ball.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(player1score == victoryCond):
		$HUD.results(1)
	if(player2score == victoryCond):
		$HUD.results(2)
	

# Called when the ball collides with a player
func _on_playerhit():
	# Make the ball bounce
	bounce.emit()

# Called when either player scores, increase and update score
func _on_ball_player_1_score():
	player1score += 1
	$HUD.update_p1_score(player1score)
	reset()
func _on_ball_player_2_score():
	player2score += 1
	$HUD.update_p2_score(player2score)
	reset()
