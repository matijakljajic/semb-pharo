Class {
	#name : #OXOGridTest,
	#superclass : #TestCase,
	#instVars : [
		'oxo'
	],
	#category : #'OXO-Tests-Game'
}

{ #category : #running }
OXOGridTest >> setUp [

	super setUp.
	
	oxo := OXOGrid new.
]

{ #category : #tests }
OXOGridTest >> testAddMove [

	self assert: oxo moves equals: 0.

	oxo makeMove: (oxo grid asArray at: 1).

	self assert: oxo moves equals: 1
]

{ #category : #tests }
OXOGridTest >> testCheckInCol [

	oxo makeMove: (oxo grid asArray at: 1).
	oxo makeMove: (oxo grid asArray at: 4).
	oxo makeMove: (oxo grid asArray at: 9).
	oxo makeMove: (oxo grid asArray at: 2).
	oxo makeMove: (oxo grid asArray at: 3).
	oxo makeMove: (oxo grid asArray at: 5).
	oxo makeMove: (oxo grid asArray at: 6).
	
	self assert: (oxo checkInCol: 2) equals: nil.
	self assert: (oxo checkInCol: 3) equals: 'O'.
]

{ #category : #tests }
OXOGridTest >> testCheckInDiagonals [

	self testCheckInDiagonals1.
	self tearDown; setUp.
	self testCheckInDiagonals2.
]

{ #category : #tests }
OXOGridTest >> testCheckInDiagonals1 [

	oxo makeMove: (oxo grid asArray at: 1).
	oxo makeMove: (oxo grid asArray at: 4).
	oxo makeMove: (oxo grid asArray at: 9).
	oxo makeMove: (oxo grid asArray at: 2).
	oxo makeMove: (oxo grid asArray at: 3).
	oxo makeMove: (oxo grid asArray at: 6).
	oxo makeMove: (oxo grid asArray at: 5).

	self assert: oxo checkInDiagonals equals: 'O'
]

{ #category : #tests }
OXOGridTest >> testCheckInDiagonals2 [

	oxo makeMove: (oxo grid asArray at: 1).
	oxo makeMove: (oxo grid asArray at: 4).
	oxo makeMove: (oxo grid asArray at: 7).
	oxo makeMove: (oxo grid asArray at: 2).
	oxo makeMove: (oxo grid asArray at: 3).
	oxo makeMove: (oxo grid asArray at: 6).
	oxo makeMove: (oxo grid asArray at: 5).

	self assert: oxo checkInDiagonals equals: 'O'
]

{ #category : #tests }
OXOGridTest >> testCheckInRow [

	oxo makeMove: (oxo grid asArray at: 1).
	oxo makeMove: (oxo grid asArray at: 4).
	oxo makeMove: (oxo grid asArray at: 9).
	oxo makeMove: (oxo grid asArray at: 2).
	oxo makeMove: (oxo grid asArray at: 3).
	oxo makeMove: (oxo grid asArray at: 5).
	oxo makeMove: (oxo grid asArray at: 8).
	oxo makeMove: (oxo grid asArray at: 6).

	self assert: (oxo checkInRow: 1) equals: nil.
	self assert: (oxo checkInRow: 2) equals: 'X'
]

{ #category : #tests }
OXOGridTest >> testCheckSet [

	| set |
	oxo makeMove: (oxo grid asArray at: 1).
	oxo makeMove: (oxo grid asArray at: 4).
	oxo makeMove: (oxo grid asArray at: 9).
	oxo makeMove: (oxo grid asArray at: 2).
	oxo makeMove: (oxo grid asArray at: 3).
	oxo makeMove: (oxo grid asArray at: 5).
	oxo makeMove: (oxo grid asArray at: 6).

	set := ((oxo grid atColumn: 2) collect: [ :x | x state ]) asSet.
	oxo checkSet: set.
	self assert: oxo winner equals: nil.

	set := ((oxo grid atColumn: 3) collect: [ :x | x state ]) asSet.
	oxo checkSet: set.
	self assert: oxo winner equals: 'O'
]

{ #category : #tests }
OXOGridTest >> testFillWithCells [

	self assert: oxo grid size equals: 9
]

{ #category : #tests }
OXOGridTest >> testGrid [

	self assert: (oxo grid isMemberOf: Array2D)
]

{ #category : #tests }
OXOGridTest >> testInitialize [

	self
		assert: oxo grid rowCount equals: 3;
		assert: oxo grid columnCount equals: 3;
		assert: oxo grid size equals: 9;
		assert: oxo moves equals: 0
]

{ #category : #tests }
OXOGridTest >> testIsOver [

	oxo makeMove: (oxo grid asArray at: 1).
	oxo makeMove: (oxo grid asArray at: 4).
	oxo makeMove: (oxo grid asArray at: 9).
	oxo makeMove: (oxo grid asArray at: 2).
	oxo makeMove: (oxo grid asArray at: 3).
	oxo makeMove: (oxo grid asArray at: 5).
	oxo makeMove: (oxo grid asArray at: 8).

	self assert: oxo isOver equals: false.
	
	oxo makeMove: (oxo grid asArray at: 6).
	
	self assert: oxo isOver equals: true
]

{ #category : #tests }
OXOGridTest >> testMakeMove [

	self assert: oxo moves equals: 0.
	oxo makeMove: (oxo grid asArray at: 1).
	self
		assert: (oxo grid asArray at: 1) state equals: 'O';
		assert: oxo moves equals: 1
]

{ #category : #tests }
OXOGridTest >> testMoves [

	self assert: oxo moves equals: 0
]

{ #category : #tests }
OXOGridTest >> testTurn [

	self assert: oxo turn equals: 'O'.
	oxo makeMove: (oxo grid asArray at: 1).
	self assert: oxo turn equals: 'X'
]
