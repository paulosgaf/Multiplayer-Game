extends RichTextLabel

var win = 0


func _process(delta):
	set_text(str(win))

func _win():
	win += 1
