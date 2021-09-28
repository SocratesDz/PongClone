class_name Court
extends Node2D

onready var ball = $Ball
onready var p1ScoreLabel = $P1Score
onready var p2ScoreLabel = $P2Score
onready var restartTimer = $RestartGameTimer
onready var ballSpawnPosition = $BallSpawn

var scoreP1 = 0
var scoreP2 = 0
	
func _process(delta):
	p1ScoreLabel.text = str(scoreP1)
	p2ScoreLabel.text = str(scoreP2)

func _on_LeftLimit_body_entered(body):
	if body is Ball:
		scoreP2 += 1
		restartTimer.start()

func _on_RightLimit_body_entered(body):
	if body is Ball:
		scoreP1 += 1
		restartTimer.start()

func _on_RestartGameTimer_timeout():
	ball.position = ballSpawnPosition.position
