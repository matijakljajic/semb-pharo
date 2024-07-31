Class {
	#name : #MyTBPostTest,
	#superclass : #TestCase,
	#category : #'MyTinyBlog-Tests'
}

{ #category : #tests }
MyTBPostTest >> testPostIsCreatedCorrectly [

	| post |
	
	post := MyTBPost title: 'testTitle' text: 'testText' category: 'testCategory'.
	
	self assert: post title equals: 'testTitle'.
	self assert: post text equals: 'testText'.
	self assert: post category equals: 'testCategory'.
	self deny: post isVisible
]

{ #category : #tests }
MyTBPostTest >> testPostIsInitializedCorrectly [
	
	| post |
	
	post := MyTBPost new.
	
	self assert: post isUnclassified.
	self deny: post isVisible
]

{ #category : #tests }
MyTBPostTest >> testWithoutCategoryIsUnclassified [

	| post |
	
	post := MyTBPost title: 'testTitle' text: 'testText'.
	
	self assert: post title equals: 'testTitle'.
	self assert: post text equals: 'testText'.
	self assert: post isUnclassified.
	self deny: post isVisible
]
