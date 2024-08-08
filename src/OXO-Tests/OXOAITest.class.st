Class {
	#name : #OXOAITest,
	#superclass : #TestCase,
	#category : #'OXO-Tests-AI'
}

{ #category : #tests }
OXOAITest >> testOXOAI [

	| board aiPick |
	board := OXOGrid new.
	board makeMove: (board grid asArray at: 1).
	board makeMove: (board grid asArray at: 4).
	board makeMove: (board grid asArray at: 6).
	board makeMove: (board grid asArray at: 2).
	board makeMove: (board grid asArray at: 3).

	aiPick := (OXOAI new: board) makeBestMove.

	board grid indicesDo: [ :row :col |
		(board grid at: row at: col) = aiPick ifTrue: [ aiPick := row @ col ] ].
	
	self assert: aiPick equals: 3@3
]
