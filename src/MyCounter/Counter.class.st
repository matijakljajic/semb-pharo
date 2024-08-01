Class {
	#name : #Counter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #'MyCounter-App'
}

{ #category : #'instance creation' }
Counter class >> startingAt: anInteger [ 
	^ self new count: anInteger
]

{ #category : #accessing }
Counter >> count [
	"Count getter"
	
	^ count
]

{ #category : #accessing }
Counter >> count: anInteger [
	"Count setter"

	count := anInteger
]

{ #category : #accessing }
Counter >> decrement [
	self count: count - 1
]

{ #category : #accessing }
Counter >> increment [
	self count: count + 1
]

{ #category : #printing }
Counter >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' with count: ';
		print: count
]
