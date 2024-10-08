extends BaseState

# warning-ignore:export_hint_type_mistmatch
@export var move_speed: float = 60
func enter() -> void:
	super.enter()
# warning-ignore:unused_argument
func input(event: InputEvent) -> int:
	if Input.is_action_just_released("run"):
		return State.Walk
	return State.Null
func physics_process(delta: float) -> int:
	player.cur_dir = player._verify_direction()
	player.move()
	if player.velocity != Vector2.ZERO:
		player.velocity = player.velocity.move_toward(player.velocity * move_speed, 1 * delta)
# warning-ignore:return_value_discarded
		player.set_velocity(player.velocity * move_speed)
		player.move_and_slide()
		player.velocity
	else:
		player.velocity = player.velocity.move_toward(Vector2.ZERO, 1 * delta)
		return State.Idle
	return State.Null
func exit() -> void:
	super.exit()
