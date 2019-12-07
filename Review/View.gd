extends Node

var questions = ["What cheese is traditionally used in pizza?",
 "What is the largest ocean?",
 "How many squares are there on a chess board?",
 "What is the hardest rock?",
 "What is the world's longest river?",
 "How many pounds are in 1 ton?"]

var answers = ["Mozzarella", "Pacific", "64", "Diamond", "Amazon", "2000"]

var incorrect = [
	["Swiss", "Provolone", "Cheddar"], 
	["Atlantic", "Arctic", "Indian"],
	["36", "81", "100"], 
	["Granite", "Ruby", "Limestone"],
	["Thames", "Hudson", "Mississippi"],
	["500", "5000", "1750"]
]

var correctPositions = [0, 1, 3, 2, 3, 1]

var playerCanAnswer = true

var questionIndex = 0

func set_quiz_at_question(index):
	$Label.text = questions[index]
	var counter = 0
	var incorrectCounter = 0
	for n in get_node("Buttons").get_children():
		if counter == correctPositions[index]:
			n.text = answers[index]
		else:
			n.text = incorrect[index][incorrectCounter]
			incorrectCounter += 1
		counter += 1
	
func _ready():
	set_quiz_at_question(questionIndex)

func _on_Button_pressed():
	if playerCanAnswer:
		playerCanAnswer = false
		if correctPositions[questionIndex] == 0:
			$Label.set_text("Correct")
		else:
			$Label.set_text("Incorrect")
		$CorrectTimer.start()

func _on_Button2_pressed():
	if playerCanAnswer:
		playerCanAnswer = false
		if correctPositions[questionIndex] == 1:
			$Label.set_text("Correct")
		else:
			$Label.set_text("Incorrect")
		$CorrectTimer.start()


func _on_Button3_pressed():
	if playerCanAnswer:
		playerCanAnswer = false
		if correctPositions[questionIndex] == 2:
			$Label.set_text("Correct")
		else:
			$Label.set_text("Incorrect")
		$CorrectTimer.start()


func _on_Button4_pressed():
	if playerCanAnswer:
		playerCanAnswer = false
		if correctPositions[questionIndex] == 3:
			$Label.set_text("Correct")
		else:
			$Label.set_text("Incorrect")
		$CorrectTimer.start()


func _on_CorrectTimer_timeout():
	questionIndex += 1
	if questionIndex > len(questions) - 1:
		questionIndex = 0
	set_quiz_at_question(questionIndex)
	playerCanAnswer = true
