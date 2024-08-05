Class {
	#name : #OXOCell,
	#superclass : #Object,
	#instVars : [
		'row',
		'col',
		'state'
	],
	#category : #OXO
}

{ #category : #'instance creation' }
OXOCell class >> at: row at: col [

	^ self new
		  row: row;
		  col: col
]

{ #category : #accessing }
OXOCell >> col [
	"Get cell's column."

	^ col
]

{ #category : #accessing }
OXOCell >> col: anInteger [
	"Set cell's column during initialization."

	col ifNil: [ col := anInteger ]
		ifNotNil: [ self error: 'Tried to set cell''s column after initialization.' ]
]

{ #category : #printing }
OXOCell >> printOn: aStream [
	"Print cell state for easier debugging process."

	state
		ifNil: [ aStream nextPutAll: '' ]
		ifNotNil: [ aStream nextPutAll: state ]
]

{ #category : #accessing }
OXOCell >> row [
	"Get cell's row."

	^ row
]

{ #category : #accessing }
OXOCell >> row: anInteger [
	"Set cell's row during initialization."

	row
		ifNil: [ row := anInteger ]
		ifNotNil: [ self error: 'Tried to set cell''s row after initialization.' ]
]

{ #category : #accessing }
OXOCell >> state [
	"Get cell state."

	^ state
]

{ #category : #accessing }
OXOCell >> state: aState [
	"Set cell state - restrict editing of a state once it's set."

	^ state
		  ifNil: [ state := aState. true ]
		  ifNotNil: [ self error: 'Tried to edit cell''s state.'. false ]
]
