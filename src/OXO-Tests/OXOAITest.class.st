Class {
	#name : #OXOAITest,
	#superclass : #TestCase,
	#instVars : [
		'board'
	],
	#category : #'OXO-Tests-AI'
}

{ #category : #running }
OXOAITest >> setUp [

	super setUp.
	
	board := OXOGrid new.
	board makeMove: (board grid asArray at: 1).
	board makeMove: (board grid asArray at: 4).
	board makeMove: (board grid asArray at: 6).
	board makeMove: (board grid asArray at: 2).
	board makeMove: (board grid asArray at: 3).
]

{ #category : #tests }
OXOAITest >> testEvaluate [

	self assert: (OXOAI new: board) evaluate equals: 0.
	board makeMove: (board grid asArray at: 5).
	board makeMove: (board grid asArray at: 9).
	self assert: (OXOAI new: board) evaluate equals: -10
]

{ #category : #tests }
OXOAITest >> testMakeBestMove [

	| aiPick |
	aiPick := (OXOAI new: board) makeBestMove.

	board grid indicesDo: [ :row :col |
		(board grid at: row at: col) = aiPick ifTrue: [ aiPick := row @ col ] ].

	self assert: aiPick equals: 3 @ 3
]

{ #category : #tests }
OXOAITest >> testMoveValues [

	| cells |
	cells := (OXOAI new: board) moveValues.
	board grid indicesDo: [ :row :col |
		(board grid at: row at: col) ifNil: [
			self assert: (cells at: row at: col) isNotNil ] ].
	self assert: ((OXOAI new: board) moveValues at: 3 at: 3) equals: 0
]

{ #category : #tests }
OXOAITest >> testMovesLeft [

	self assert: (OXOAI new: board) movesLeft equals: true
]
