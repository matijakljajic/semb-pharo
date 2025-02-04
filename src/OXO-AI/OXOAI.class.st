Class {
	#name : 'OXOAI',
	#superclass : 'Object',
	#instVars : [
		'board'
	],
	#category : 'OXO-AI',
	#package : 'OXO-AI'
}

{ #category : 'instance creation' }
OXOAI class >> new: aBoard [

	^ self new board: aBoard
]

{ #category : 'accessing' }
OXOAI >> board [

	^ board
]

{ #category : 'accessing' }
OXOAI >> board: aGameBoard [

	board := aGameBoard
]

{ #category : 'minimax' }
OXOAI >> evaluate [

	self board isOver.

	self board winner = 'X' ifTrue: [ self board winner: nil. ^ 10 ].
	self board winner = 'O' ifTrue: [ self board winner: nil. ^ -10 ].

	^ 0
]

{ #category : 'action' }
OXOAI >> makeBestMove [
	"Make best possible move for 'X' which would be the cell with maximal weight."

	| bestVal bestMove |
	bestVal := SmallInteger minVal.
	bestMove := nil.

	self board grid rowsAndColumnsDo: [ :row :col |
		| cell |
		cell := self board grid at: row @ col.
		cell state ifNil: [
			| moveVal |
			self board makeMove: cell.
			moveVal := self minimax: 0 isMax: false.
			self board undoMove: cell.
			moveVal > bestVal ifTrue: [
				bestMove := cell.
				bestVal := moveVal ] ] ].
	^ bestMove
]

{ #category : 'minimax' }
OXOAI >> max: depthNum isMax: maxxer [

	| best |
	best := SmallInteger minVal.
	self board grid rowsAndColumnsDo: [ :row :col |
		| cell |
		cell := self board grid at: row @ col.
		cell state ifNil: [
			self board makeMove: cell.
			best := best max: (self minimax: depthNum isMax: maxxer not).
			self board undoMove: cell ] ].
	^ best
]

{ #category : 'minimax' }
OXOAI >> min: depthNum isMax: maxxer [

	| best |
	best := SmallInteger maxVal.
	self board grid rowsAndColumnsDo: [ :row :col |
		| cell |
		cell := self board grid at: row @ col.
		cell state ifNil: [
			self board makeMove: cell.
			best := best min: (self minimax: depthNum isMax: maxxer not).
			self board undoMove: cell ] ].
	^ best
]

{ #category : 'minimax' }
OXOAI >> minimax: depthNum isMax: maxxer [

	| score |
	score := self evaluate.

	(score = -10) ifTrue: [ ^ score + depthNum ].
	(score = 10) ifTrue: [ ^ score - depthNum ].
	self movesLeft ifFalse: [ ^ 0 ].
	
	maxxer
		ifTrue: [ ^ self max: depthNum + 1 isMax: maxxer ]
		ifFalse: [ ^ self min: depthNum + 1 isMax: maxxer ]
]

{ #category : 'action' }
OXOAI >> moveValues [
	"For testing purposes - print out all move weights."

	| cells |
	cells := CTArray2D width: 3 height: 3.

	self board grid rowsAndColumnsDo: [ :row :col |
		| cell |
		cell := self board grid at: row @ col.
		cell state ifNil: [
			| moveVal |
			self board makeMove: cell.
			moveVal := self minimax: 0 isMax: false.
			cells atX: row atY: col put: moveVal.
			self board undoMove: cell ] ].
	^ cells
]

{ #category : 'testing' }
OXOAI >> movesLeft [

	^ board moves ~= 9
]
