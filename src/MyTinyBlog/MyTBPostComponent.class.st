Class {
	#name : #MyTBPostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #'instance creation' }
MyTBPostComponent class >> with: aPost [
	^ self new post: aPost.
	
]

{ #category : #accessing }
MyTBPostComponent >> date [ 
	^ post date
]

{ #category : #initialization }
MyTBPostComponent >> initialize [

	super initialize.
	post := MyTBPost new
]

{ #category : #accessing }
MyTBPostComponent >> post: aMyTBPost [
	post := aMyTBPost
]

{ #category : #rendering }
MyTBPostComponent >> renderContentOn: html [

	html heading level: 2; with: self title.
	html heading level: 6; with: self date.
	html text: self text	
]

{ #category : #accessing }
MyTBPostComponent >> text [
	^ post text
]

{ #category : #accessing }
MyTBPostComponent >> title [
	^ post title
]
