extends Node

func _init():
	game_signals.connect("spawn_obj_fx", Callable(self, "spawn_fx_at_obj"))

func spawn_fx_at_obj(pos,fx,obj):
	var effect = load(game_libraries.effects_library[fx]).instantiate()
	obj.add_child(effect)
	effect.global_position.x = pos.x + randf_range(-2,2)
	effect.global_position.y = pos.y
