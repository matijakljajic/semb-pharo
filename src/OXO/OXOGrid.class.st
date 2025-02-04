Class {
	#name : 'OXOGrid',
	#superclass : 'Object',
	#instVars : [
		'cells',
		'moves',
		'turn',
		'winner'
	],
	#category : 'OXO-Model',
	#package : 'OXO',
	#tag : 'Model'
}

{ #category : 'adding' }
OXOGrid >> addMove [
	"Increment number of moves played."

	moves := moves + 1
]

{ #category : 'testing' }
OXOGrid >> checkInCol: idx [
	"Check column on said index for a winner."

	| set |
	winner ifNil: [
		set := ((self grid atColumn: idx) collect: [ :x | x state ]) asSet.
		self checkSet: set ].
	^ winner
]

{ #category : 'testing' }
OXOGrid >> checkInDiagonals [
	"Check diagonals for a winner."

	| set1 set2 |
	winner ifNil: [
		set1 := Set newFrom: {
				        (self grid at: 1 @ 1) state.
				        (self grid at: 2 @ 2) state.
				        (self grid at: 3 @ 3) state } asOrderedCollection.
		set2 := Set newFrom: {
				        (self grid at: 1 @ 3) state.
				        (self grid at: 2 @ 2) state.
				        (self grid at: 3 @ 1) state } asOrderedCollection.
		self checkSet: set1.
		self checkSet: set2 ].
	^ winner
]

{ #category : 'testing' }
OXOGrid >> checkInRow: idx [
	"Check row on said index for a winner."

	| set |
	winner ifNil: [
		set := ((self grid atRow: idx) collect: [ :x | x state ]) asSet.
		self checkSet: set ].
	^ winner
]

{ #category : 'testing' }
OXOGrid >> checkSet: aSet [
	"Check if all symbols are the same."

	aSet size == 1 ifFalse: [ ^ self ].
	(aSet includes: 'X') ifTrue: [ winner := 'X' ].
	(aSet includes: 'O') ifTrue: [ winner := 'O' ]
]

{ #category : 'initialization' }
OXOGrid >> fillWithCells [
	"Initalization helper."

	cells rowsAndColumnsDo: [ :row :col |
		cells atX: row atY: col put: (OXOCell new) ]
]

{ #category : 'accessing' }
OXOGrid >> grid [
	"Get Array2D component itself."

	^ cells
]

{ #category : 'initialization' }
OXOGrid >> initialize [
	"Initialize new OXO model with a 3x3 grid."

	cells := Array2D new: 3.
	self fillWithCells.
	moves := 0
]

{ #category : 'testing' }
OXOGrid >> isOver [
	"Check if game's over."

	moves >= 5 ifFalse: [ ^ false ].
	1 to: 3 do: [ :idx |
		self checkInRow: idx.
		self checkInCol: idx ].
	self checkInDiagonals.

	(moves == 9 or: winner isNotNil)
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ]
]

{ #category : 'adding' }
OXOGrid >> makeMove: aCell [
	"Make move at said row and at said column if it's empty."

	aCell ifNotNil: [ (aCell state: self turn) ifTrue: [ self addMove ] ]
]

{ #category : 'accessing' }
OXOGrid >> moves [
	"Get number of moves played."

	^ moves
]

{ #category : 'accessing' }
OXOGrid >> turn [
	"Get who plays / whose turn it is based on number of moves played."

	turn := moves % 2 = 0
		        ifTrue: [ 'O' ]
		        ifFalse: [ 'X' ].
	^ turn
]

{ #category : 'adding' }
OXOGrid >> undoMove [
	"Increment number of moves played."

	moves := moves - 1
]

{ #category : 'adding' }
OXOGrid >> undoMove: aCell [
	"Make move at said row and at said column if it's empty."

	aCell reset.
	self undoMove.
]

{ #category : 'accessing' }
OXOGrid >> winner [
	"Get winning symbol."

	^ winner
]

{ #category : 'accessing' }
OXOGrid >> winner: anObject [
	"Set winning symbol."

	winner := anObject
]
