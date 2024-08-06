Class {
	#name : #OXOGridElement,
	#superclass : #BlElement,
	#instVars : [
		'game',
		'model'
	],
	#category : #'OXO-View'
}

{ #category : #'instance creation' }
OXOGridElement class >> new: aBlSpace [

	^ self new game: aBlSpace
]

{ #category : #accessing }
OXOGridElement >> changeChildrenColor: aColor [

	self childrenDo: [ :x | x background: aColor ]
]

{ #category : #accessing }
OXOGridElement >> game [

	^ game
]

{ #category : #accessing }
OXOGridElement >> game: anObject [

	game := anObject
]

{ #category : #initialization }
OXOGridElement >> initialize [

	super initialize.
	self background: Color white.
	self layout: (BlGridLayout horizontal cellSpacing: 5).
	self layout columnCount: 3.

	self constraintsDo: [ :layoutConstraints |
		layoutConstraints horizontal fitContent.
		layoutConstraints vertical fitContent ].

	self model: OXOGrid new
]

{ #category : #accessing }
OXOGridElement >> model [

	^ model
]

{ #category : #accessing }
OXOGridElement >> model: anOXOGrid [

	model := anOXOGrid.
	model grid do: [ :anOXOCell |
		self addChild: (OXOCellElement new: anOXOCell) ]
]
