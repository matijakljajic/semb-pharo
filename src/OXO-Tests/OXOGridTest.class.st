Class {
	#name : #OXOGridTest,
	#superclass : #TestCase,
	#instVars : [
		'oxo'
	],
	#category : #'OXO-Tests'
}

{ #category : #running }
OXOGridTest >> setUp [

	super setUp.
	
	oxo := OXOGrid new.
]

{ #category : #tests }
OXOGridTest >> testAddMove [

	self assert: oxo moves equals: 0.

	oxo at: 1 at: 1.

	self assert: oxo moves equals: 1
]

{ #category : #tests }
OXOGridTest >> testAtAt [

	self assert: oxo moves equals: 0.
	oxo at: 1 at: 1.
	self
		assert: (oxo grid at: 1 at: 1) state equals: 'O';
		assert: oxo moves equals: 1.

	self should: [ oxo at: 1 at: 1 ] raise: Error
]

{ #category : #tests }
OXOGridTest >> testCheckInCol [

	oxo at: 1 at: 1.
	oxo at: 2 at: 1.
	oxo at: 3 at: 3.
	oxo at: 1 at: 2.
	oxo at: 1 at: 3.
	oxo at: 2 at: 2.
	oxo at: 2 at: 3.
	
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

	oxo at: 1 at: 1.
	oxo at: 2 at: 1.
	oxo at: 3 at: 3.
	oxo at: 1 at: 2.
	oxo at: 1 at: 3.
	oxo at: 2 at: 3.
	oxo at: 2 at: 2.
	
	self assert: (oxo checkInDiagonals) equals: 'O'.
]

{ #category : #tests }
OXOGridTest >> testCheckInDiagonals2 [

	oxo at: 1 at: 1.
	oxo at: 2 at: 1.
	oxo at: 3 at: 1.
	oxo at: 1 at: 2.
	oxo at: 1 at: 3.
	oxo at: 2 at: 3.
	oxo at: 2 at: 2.
	
	self assert: (oxo checkInDiagonals) equals: 'O'.
]

{ #category : #tests }
OXOGridTest >> testCheckInRow [

	oxo at: 1 at: 1.
	oxo at: 2 at: 1.
	oxo at: 3 at: 3.
	oxo at: 1 at: 2.
	oxo at: 1 at: 3.
	oxo at: 2 at: 2.
	oxo at: 3 at: 2.
	oxo at: 2 at: 3.
	
	self assert: (oxo checkInRow: 1) equals: nil.
	self assert: (oxo checkInRow: 2) equals: 'X'.
]

{ #category : #tests }
OXOGridTest >> testCheckSet [

	| set |
	oxo at: 1 at: 1.
	oxo at: 2 at: 1.
	oxo at: 3 at: 3.
	oxo at: 1 at: 2.
	oxo at: 1 at: 3.
	oxo at: 2 at: 2.
	oxo at: 2 at: 3.
	
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

	oxo at: 1 at: 1.
	oxo at: 2 at: 1.
	oxo at: 3 at: 3.
	oxo at: 1 at: 2.
	oxo at: 1 at: 3.
	oxo at: 2 at: 2.
	oxo at: 3 at: 2.

	self assert: oxo isOver equals: false.
	
	oxo at: 2 at: 3.
	
	self assert: oxo isOver equals: true
]

{ #category : #tests }
OXOGridTest >> testMoves [

	self assert: oxo moves equals: 0
]

{ #category : #tests }
OXOGridTest >> testTurn [

	self assert: oxo turn equals: 'O'.
	oxo at: 1 at: 1.
	self assert: oxo turn equals: 'X'
]
