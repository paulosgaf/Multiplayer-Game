extends RichTextLabel

var m = 3
var s = 0
var ms = 0

var placar_p1
var placar_p2
var scorep1 = 0
var scorep2 = 0
var score_max = 5

var zero_m = ""
var zero_s = ""
var zero_ms = ""
	
# warning-ignore:unused_argument
func _process(delta):
	
	placar_p1 = get_parent().get_node("Placar_p1")
	placar_p2 = get_parent().get_node("Placar_p2")
	scorep1 = int(placar_p1.text)
	scorep2 = int(placar_p2.text)
	
	if ms < 0:
		s -= 1
		ms = 99
	
	if s < 0:
		m -= 1
		s = 59
		
	#---------------------------
	
	if (ms == 0 and s == 0 and m == 0) or scorep1 == score_max or scorep2 == score_max:
		ms = 0
		s = 0
		m = 3
		placar_p1.text = str(0)
		placar_p2.text = str(0)
	
	

	#----FORMATAÇÃO DE SAIDA----
	
	if m < 10:
		zero_m = "0"
	else:
		zero_m = ""
	if s < 10:
		zero_s = "0"
	else:
		zero_s = ""
	if ms < 10:
		zero_ms = "0"
	else:
		zero_ms = ""

	set_text(zero_m+str(m)+":"+zero_s+str(s)) #+":"+zero_ms+str(ms))


func _on_Timer_timeout():
	ms -= 1
