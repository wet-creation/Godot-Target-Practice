extends Entity

class_name Player

@onready var mouse_position:= get_global_mouse_position()
@onready var marker:=%ShootPosition
var _timer_to_attack:= Timer.new()
func	 _ready() -> void:
	setup_timer()

func _process(delta: float) -> void:
	if Input.is_action_pressed("attack") && _timer_to_attack.is_stopped():
		_timer_to_attack.start()
		print("attacking")
		_shoot()
		
func _physics_process(delta):
	mouse_position = get_global_mouse_position()
	look_at(mouse_position)


func _on_hp_damaged() -> void:
	pass # Replace with function body.


func _on_death() -> void:
	pass # Replace with function body.


func _shoot():
	var direction = mouse_position - marker.global_position
	var bullet = Bullet.new_bullet(direction, self)
	bullet.global_position = marker.global_position	
	get_parent().add_child(bullet)
	
	
func setup_timer():
	_timer_to_attack.autostart = false
	_timer_to_attack.one_shot = true
	_timer_to_attack.wait_time = 1
	add_child(_timer_to_attack)
