Class {
	#name : #OXOCellTest,
	#superclass : #TestCase,
	#category : #'OXO-Tests-Game'
}

{ #category : #tests }
OXOCellTest >> testReset [

	| cell |
	cell := OXOCell new.
	cell state: 'X'.
	cell reset.

	self assert: cell state equals: nil.
]

{ #category : #tests }
OXOCellTest >> testState [

	| cell |
	cell := OXOCell new.
	cell state: 'X'.

	self assert: cell state equals: 'X'.
]
