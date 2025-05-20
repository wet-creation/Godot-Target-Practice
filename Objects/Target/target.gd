class_name Target extends Node2D


const my_scene: PackedScene = preload("res://Objects/Target/Target.tscn")


func _on_health_component_death() -> void:
	queue_free()


static func new_target() -> Target:
	var target = my_scene.instantiate()
	return target
