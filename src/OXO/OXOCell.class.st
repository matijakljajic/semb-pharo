Class {
	#name : 'OXOCell',
	#superclass : 'Object',
	#instVars : [
		'state'
	],
	#category : 'OXO-Model',
	#package : 'OXO',
	#tag : 'Model'
}

{ #category : 'printing' }
OXOCell >> printOn: aStream [
	"Print cell state for easier debugging process."

	state
		ifNil: [ aStream nextPutAll: '' ]
		ifNotNil: [ aStream nextPutAll: state ]
]

{ #category : 'action' }
OXOCell >> reset [

	state := nil
]

{ #category : 'accessing' }
OXOCell >> state [
	"Get cell state."

	^ state
]

{ #category : 'accessing' }
OXOCell >> state: aState [
	"Set cell state - restrict editing of a state once it's set."

	^ state
		  ifNil: [ state := aState. true ]
		  ifNotNil: [ false ]
]
