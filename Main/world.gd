extends Node2D


@export var spawn_time: float = 0.5 ##time in seconds
@export var radius: float = 500
@export var deadzone: float = 100
@onready var player := $Player as Player
var _timer_to_spawn:= Timer.new()

func	 _ready() -> void:
	setup_timer()
	

func _process(_delta: float) -> void:
	if _timer_to_spawn.is_stopped():
		print("timer invocation")
		var spawn_postion = _calculate_target_postion()
		print( "Postiton:"+str(spawn_postion))
		_spawn_target(spawn_postion)
		_timer_to_spawn.start()

func setup_timer():
	_timer_to_spawn.autostart = false
	_timer_to_spawn.one_shot = true
	_timer_to_spawn.wait_time = spawn_time
	add_child(_timer_to_spawn)
	
func _spawn_target(spawn_postion: Vector2):
	var target = Target.new_target()
	target.global_position = spawn_postion
	add_child(target)


func _calculate_target_postion() -> Vector2:
	var is_x_minus = randf() > 0.5
	var is_y_minus = randf() > 0.5
	var x := 0.0
	var y := 0.0
	if is_x_minus:
		x = randf_range(player.global_position.x - radius, player.global_position.x + deadzone)
	else:
		x = randf_range(player.global_position.x + deadzone, radius + player.global_position.x)
		
	if is_y_minus:
		y = randf_range( player.global_position.y - radius, player.global_position.y + deadzone)
	else:	
		y = randf_range(player.global_position.y + deadzone, player.global_position.y + radius)
	
	
	return Vector2(x, y)
	
	
	
	
	
	
