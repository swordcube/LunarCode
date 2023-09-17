class_name GDScriptSyntax extends CodeHighlighter

func _init():
	member_variable_color = Gruvbox.GRAY
	function_color = Gruvbox.BLUE2
	symbol_color = Gruvbox.GRAY
	number_color = Gruvbox.BLUE2
	
	# basic keywords
	for kw in ["class", "class_name", "extends", "var", "const", "func", "for", "in", "null"]:
		add_keyword_color(kw, Gruvbox.RED2)
		
	# basic types
	for kw in return_types():
		add_keyword_color(kw, Gruvbox.RED2)
	# -- vectors
	for num in range(2, 4):
		add_keyword_color("Vector%s" % num, Gruvbox.GREEN2)
		add_keyword_color("Vector%si" % num, Gruvbox.GREEN2)
		
	# classes
	for kw in ClassDB.get_class_list():
		add_keyword_color(kw, Gruvbox.GREEN2)
	
	add_color_region('"', '"', Gruvbox.YELLOW2)
	add_color_region("'", "'", Gruvbox.YELLOW2)
	add_color_region('#', '', Gruvbox.BG3, true)

func return_types():
	return ["bool", "int", "float", "String", "Rect2", "Rect2i", "Transform2D", "Plane", "Quaternion", "AABB", "Basis", "Transform3D", "Projection", "Color", "StringName", "NodePath", "RID", "Object", "Callable", "Signal", "Dictionary", "Array", "PackedByteArray", "PackedInt32Array", "PackedInt64Array", "PackedFloat32Array", "PackedFloat64Array", "PackedStringArray", "PackedVector2Array", "PackedVector3Array", "PackedColorArray"]
