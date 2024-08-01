Class {
	#name : #MyTBAppScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #accessing }
MyTBAppScreenComponent >> blog [

	^ MyTBBlog current
]

{ #category : #hooks }
MyTBAppScreenComponent >> children [

	^ { header }
]

{ #category : #initialization }
MyTBAppScreenComponent >> createHeaderComponent [

	^ MyTBHeaderComponent from: self
]

{ #category : #initialization }
MyTBAppScreenComponent >> initialize [

	super initialize.
	header := self createHeaderComponent.
]

{ #category : #rendering }
MyTBAppScreenComponent >> renderContentOn: html [

	html render: header
]
