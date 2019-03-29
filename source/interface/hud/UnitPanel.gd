extends Control

onready var unit_name = $NinePatchRect/CenterContainer/VBoxContainer/Name
onready var image = $NinePatchRect/CenterContainer/VBoxContainer/Image/Unit
onready var level = $NinePatchRect/CenterContainer/VBoxContainer/General/Level
onready var type = $NinePatchRect/CenterContainer/VBoxContainer/General/Type
onready var race = $NinePatchRect/CenterContainer/VBoxContainer/General/Race
onready var hp = $NinePatchRect/CenterContainer/VBoxContainer/Stats/Row1/HP
onready var xp = $NinePatchRect/CenterContainer/VBoxContainer/Stats/Row1/XP
onready var mp = $NinePatchRect/CenterContainer/VBoxContainer/Stats/Row2/MP
onready var defense = $NinePatchRect/CenterContainer/VBoxContainer/Stats/Row2/D

onready var tween = $Tween

func _ready() -> void:
	clear_unit()

func update_unit(unit : Unit) -> void:
	tween.interpolate_property(self, "modulate", modulate, Color("ffffffff"), 0.2, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
	unit_name.text = unit.name
	image.texture = unit.sprite.texture
	image.set_material(unit.sprite.get_material())
	level.text = str("L", unit.type.level)
	type.text = str(unit.type.ID)
	race.text = str(unit.type.race)
	hp.text = str("HP: ", unit.current_health, "/", unit.type.health)
	xp.text = str("XP: ", unit.current_experience, "/", unit.type.experience)
	mp.text = str("MP: ", unit.current_moves, "/", unit.type.moves)

func clear_unit() -> void:
	tween.interpolate_property(self, "modulate", modulate, Color("00ffffff"), 0.2, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
	unit_name.text = "-"
	image.texture = null
	level.text = "-"
	type.text = "-"
	race.text = "-"
	hp.text = "-"
	xp.text = "-"
	mp.text = "-"