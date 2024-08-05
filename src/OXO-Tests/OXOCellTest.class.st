Class {
	#name : #OXOCellTest,
	#superclass : #TestCase,
	#category : #'OXO-Tests'
}

{ #category : #tests }
OXOCellTest >> testAtAt [

	| cell |
	cell := OXOCell at: 2 at: 3.

	self assert: cell row equals: 2.
	self assert: cell col equals: 3
]

{ #category : #tests }
OXOCellTest >> testCol [

	| cell |
	cell := OXOCell new col: 3.

	self assert: cell col equals: 3.

	self should: [ cell col: 1 ] raise: Error
]

{ #category : #tests }
OXOCellTest >> testRow [

	| cell |
	cell := OXOCell new row: 2.

	self assert: cell row equals: 2.

	self should: [ cell row: 1 ] raise: Error
]

{ #category : #tests }
OXOCellTest >> testState [

	| cell |
	cell := OXOCell new.
	cell state: 'X'.

	self assert: cell state equals: 'X'.

	self should: [ cell state: 'O' ] raise: Error
]
