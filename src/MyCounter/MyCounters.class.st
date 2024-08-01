Class {
	#name : #MyCounters,
	#superclass : #WAComponent,
	#instVars : [
		'counts'
	],
	#category : #'MyCounter-App'
}

{ #category : #'class initialization' }
MyCounters class >> initialize [
	
	| app |

	app := WAAdmin register: self asApplicationAt: 'MyCounters'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: TBSDevelopmentLibrary
]

{ #category : #hooks }
MyCounters >> children [
	
	^ counts
]

{ #category : #initialization }
MyCounters >> initialize [
	
	super initialize.
	counts := (1 to: 5) collect: [ :each | MyCounter new ]
]

{ #category : #initialization }
MyCounters >> renderContentOn: html [
	
	counts do: [ :c | html render: c ]
]
