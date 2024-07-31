Class {
	#name : #MyTBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #'MyTinyBlog-App'
}

{ #category : #'instance creation' }
MyTBPost class >> title: aTitle text: aText [

	^ self new
		title: aTitle;
		text: aText;
		yourself
]

{ #category : #'instance creation' }
MyTBPost class >> title: aTitle text: aText category: aCategory [

	^ self new
		title: aTitle;
		text: aText;
		category: aCategory;
		yourself
]

{ #category : #accessing }
MyTBPost class >> unclassifiedTag [
	
	^ 'Unclassified'
]

{ #category : #accessing }
MyTBPost >> category [
	^ category
]

{ #category : #accessing }
MyTBPost >> category: anObject [
	category := anObject
]

{ #category : #accessing }
MyTBPost >> date [
	^ date
]

{ #category : #accessing }
MyTBPost >> date: anObject [
	date := anObject
]

{ #category : #initialization }
MyTBPost >> initialize [

	super initialize.
	self date: Date today.
	self makeInvisible.
	self category: self class unclassifiedTag
]

{ #category : #testing }
MyTBPost >> isUnclassified [

	^ self category = self class unclassifiedTag
]

{ #category : #testing }
MyTBPost >> isVisible [

	^ self visible
]

{ #category : #action }
MyTBPost >> makeInvisible [

	self visible: false
]

{ #category : #action }
MyTBPost >> makeVisible [
	
	self visible: true
]

{ #category : #accessing }
MyTBPost >> text [
	^ text
]

{ #category : #accessing }
MyTBPost >> text: anObject [
	text := anObject
]

{ #category : #accessing }
MyTBPost >> title [
	^ title
]

{ #category : #accessing }
MyTBPost >> title: anObject [
	title := anObject
]

{ #category : #accessing }
MyTBPost >> visible [
	^ visible
]

{ #category : #accessing }
MyTBPost >> visible: anObject [
	visible := anObject
]
