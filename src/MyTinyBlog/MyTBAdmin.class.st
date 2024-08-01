Class {
	#name : #MyTBAdmin,
	#superclass : #Object,
	#instVars : [
		'user',
		'pass'
	],
	#category : #'MyTinyBlog-App'
}

{ #category : #'instance creation' }
MyTBAdmin class >> user: user pass: pass [ 

	^ self new user: user; pass: pass; yourself
]

{ #category : #accessing }
MyTBAdmin >> pass [
	^ pass
]

{ #category : #accessing }
MyTBAdmin >> pass: anObject [
	pass := SHA256 hashMessage: anObject
]

{ #category : #accessing }
MyTBAdmin >> user [
	^ user
]

{ #category : #accessing }
MyTBAdmin >> user: anObject [
	user := anObject
]
