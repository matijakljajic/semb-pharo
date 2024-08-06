Class {
	#name : #OXO,
	#superclass : #Object,
	#instVars : [
		'space'
	],
	#category : #'OXO-Game'
}

{ #category : #accessing }
OXO class >> playVsComputer [

	^ self new
]

{ #category : #accessing }
OXO class >> playVsPlayer [

	^ self new
]

{ #category : #initialization }
OXO >> initialize [
	
	| game |
	game := OXOGridElement new: self.
	
	space := BlSpace new.
	space title: 'OXO'.
	space root addChild: game.
	space root whenLayoutedDoOnce: [ space extent: game size ].
	space position: 300 @ 150.
	space resizable: false.
	
	space show
]

{ #category : #initialization }
OXO >> reset [

	| game |
	game := OXOGridElement new: self.

	space root removeChildren.
	space root addChild: game
]
