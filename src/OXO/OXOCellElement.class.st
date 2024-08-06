Class {
	#name : #OXOCellElement,
	#superclass : #BlElement,
	#instVars : [
		'cell',
		'text'
	],
	#category : #'OXO-View'
}

{ #category : #'instance creation' }
OXOCellElement class >> new: anOXOCell [

	^ self new cell: anOXOCell.
]

{ #category : #accessing }
OXOCellElement >> cell [
	"Get OXOCell instance."

	^ cell
]

{ #category : #accessing }
OXOCellElement >> cell: anOXOCell [
	"Set OXOCell instance."

	cell := anOXOCell
]

{ #category : #'event action' }
OXOCellElement >> click [

	(self parent model moves = 9 or: self parent model winner isNotNil)
		ifTrue: [ ^ self parent game reset ].

	self parent model makeMove: self cell.
	self fillCell: self parent model turn.
	(self parent model isOver and: self parent model winner = 'O')
		ifTrue: [ self parent changeChildrenColor: Color green twiceDarker ]
		ifFalse: [
			self parent model winner = 'X' ifTrue: [
				self parent changeChildrenColor: Color red twiceDarker ].
			self parent model moves = 9 ifTrue: [
				self parent changeChildrenColor: Color yellow twiceDarker ] ]
]

{ #category : #accessing }
OXOCellElement >> fillCell: aState [
	"Set cell state in String form."

	text text: (self cell state asRopedText fontSize: 64; foreground: Color white).
	self addChild: text
]

{ #category : #initialization }
OXOCellElement >> initialize [

	super initialize.
	self initializeText.

	self size: 68 @ 68.
	self layout: BlLinearLayout new alignCenter.
	self background: (BlColorPaint color: Color black).

	self cell: OXOCell new.
	self addEventHandlerOn: BlClickEvent do: [ :anEvent | self click ]
]

{ #category : #initialization }
OXOCellElement >> initializeText [

	text := BlTextElement new
]
