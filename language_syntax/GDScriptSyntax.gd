class_name GDScriptSyntax extends CodeHighlighter

func _init():
	member_variable_color = Gruvbox.GRAY
	function_color = Gruvbox.BLUE2
	symbol_color = Gruvbox.GRAY
	number_color = Gruvbox.BLUE2
	
	# basic keywords
	for kw in ["class", "class_name", "extends", "var", "const", "func"]:
		add_keyword_color(kw, Gruvbox.RED2)
		
	# basic types
	for kw in ["int", "float"]:
		add_keyword_color(kw, Gruvbox.RED2)
		
	# classes
	# -- vectors
	for num in range(2, 4):
		add_keyword_color("Vector%s" % num, Gruvbox.GREEN2)
		add_keyword_color("Vector%si" % num, Gruvbox.GREEN2)
		
	# -- others
	for kw in ["String", "Dictionary", "Array", "Node", "Node2D", "Node3D"]:
		add_keyword_color(kw, Gruvbox.GREEN2)
	
	add_color_region('"', '"', Gruvbox.YELLOW2)
	add_color_region('#', '', Gruvbox.BG2, true)
