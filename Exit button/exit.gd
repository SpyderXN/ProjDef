extends Node2D


var tween: Tween

func pressed():
	#if tween and tween.is_running():
		#tween.kill()
	#
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "scale:x", 10, 0.1)
	tween.parallel().tween_property(self, "scale:y", 5, 0.1)

func released():
	#if tween and tween.is_running():
		#tween.kill()
	
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "scale:x", 5, 0.1)
	tween.parallel().tween_property(self, "scale:y", 2, 0.1)

func _on_exit_pressed() -> void:
	#if tween and tween.is_running():
		#tween.kill()
	#
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "scale:x", 10, 0.1)
	tween.parallel().tween_property(self, "scale:y", 5, 0.1)


func _on_exitbutton_released() -> void:
	#if tween and tween.is_running():
		#tween.kill()
	
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "scale:x", 5, 0.1)
	tween.parallel().tween_property(self, "scale:y", 2, 0.1)
