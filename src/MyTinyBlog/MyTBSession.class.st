Class {
	#name : #MyTBSession,
	#superclass : #WASession,
	#instVars : [
		'admin'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #accessing }
MyTBSession >> admin [
	^ admin
]

{ #category : #accessing }
MyTBSession >> admin: anObject [
	admin := anObject
]

{ #category : #initialization }
MyTBSession >> reset [

	admin := nil.
	self requestContext redirectTo: self application url.
	self unregister
]

{ #category : #accessing }
MyTBSession >> someoneIsLogged [

	^ self admin notNil
]
