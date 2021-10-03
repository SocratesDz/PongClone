class_name Paddle
extends KinematicBody2D

const MOVE_SPEED = 300

export var ai_mode: bool = false

var velocity: Vector2 = Vector2.ZERO
var ball: Ball = null

func _physics_process(delta: float):
	if ai_mode:
		_process_ai_behavior(delta)
	else:
		_process_input()
	_process_movement(delta)

func _process_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y -= MOVE_SPEED
	if Input.is_action_pressed("ui_down"):
		velocity.y += MOVE_SPEED

func _process_movement(delta: float):
	move_and_collide(velocity * delta)

func _process_ai_behavior(delta: float):
	if ball != null:
		var next_speed = position.direction_to(ball.position) * MOVE_SPEED
		velocity.y = next_speed.y
	else:
		velocity.y = 0
