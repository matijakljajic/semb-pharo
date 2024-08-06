Class {
	#name : #OXOCellTest,
	#superclass : #TestCase,
	#category : #'OXO-Tests'
}

{ #category : #tests }
OXOCellTest >> testState [

	| cell |
	cell := OXOCell new.
	cell state: 'X'.

	self assert: cell state equals: 'X'.

	self should: [ cell state: 'O' ] raise: Error
]
