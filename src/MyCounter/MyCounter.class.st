Class {
	#name : #MyCounter,
	#superclass : #WAComponent,
	#instVars : [
		'count'
	],
	#category : #'MyCounter-App'
}

{ #category : #'class initialization' }
MyCounter class >> initialize [

	| app |

	app := WAAdmin register: self asApplicationAt: 'MyCounter'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: TBSDevelopmentLibrary
]

{ #category : #'instance creation' }
MyCounter class >> startingAt: anInteger [ 
	^ self new count: anInteger
]

{ #category : #accessing }
MyCounter >> count [
	"Count getter"
	
	^ count
]

{ #category : #accessing }
MyCounter >> count: anInteger [
	"Count setter"

	count := anInteger
]

{ #category : #action }
MyCounter >> decrement [
	self count: count - 1
]

{ #category : #action }
MyCounter >> increment [
	self count: count + 1
]

{ #category : #initialization }
MyCounter >> initialize [

	count := 0
]

{ #category : #printing }
MyCounter >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' with count: ';
		print: count
]

{ #category : #rendering }
MyCounter >> renderContentOn: html [

	html form: [ 
			html tbsBadge: self count; space.
			html tbsButtonGroup beSmall; 
				with: [ 
					html tbsButton beDefault;
						callback: [ self increment ]; with: '+'.
					html tbsButton beDefault;
						callback: [ self decrement ]; with: '-' ] ]
]

{ #category : #hooks }
MyCounter >> states [

	^ Array with: self
]
