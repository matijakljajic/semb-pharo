Class {
	#name : #OXO,
	#superclass : #Object,
	#instVars : [
		'game',
		'space'
	],
	#category : #'OXO-Game'
}

{ #category : #'instance creation' }
OXO class >> playVsComputer [

	| newGame |
	
	newGame := self new.
	
	newGame game: (OXOGridElement newWithAI: newGame).
	newGame space root addChild: newGame game.
	newGame space root whenLayoutedDoOnce: [ newGame space extent: newGame game size ].
	
	newGame space show.
	
	^ newGame
]

{ #category : #'instance creation' }
OXO class >> playVsPlayer [

	| newGame |
	
	newGame := self new.
	
	newGame game: (OXOGridElement new: newGame).
	newGame space root addChild: newGame game.
	newGame space root whenLayoutedDoOnce: [ newGame space extent: newGame game size ].
	
	newGame space show.
	
	^ newGame
]

{ #category : #accessing }
OXO >> game [

	^ game
]

{ #category : #accessing }
OXO >> game: anObject [

	game := anObject
]

{ #category : #initialization }
OXO >> initialize [
	
	space := BlSpace new.
	space title: 'OXO'.
	space position: 300 @ 150.
	space resizable: false.
]

{ #category : #initialization }
OXO >> reset [

	game := (self space root childAt: 1) ai
		        ifTrue: [ OXOGridElement newWithAI: self ]
		        ifFalse: [ OXOGridElement new: self ].

	space root removeChildren.
	space root addChild: game
]

{ #category : #accessing }
OXO >> space [

	^ space
]
