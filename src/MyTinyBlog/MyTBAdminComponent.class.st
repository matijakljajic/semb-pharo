Class {
	#name : #MyTBAdminComponent,
	#superclass : #MyTBAppScreenComponent,
	#instVars : [
		'report'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #hooks }
MyTBAdminComponent >> children [

    ^ super children copyWith: self report
]

{ #category : #initialization }
MyTBAdminComponent >> createHeaderComponent [

	^ MyTBAdminHeaderComponent from: self
]

{ #category : #rendering }
MyTBAdminComponent >> goToPostListView [

	self answer
]

{ #category : #initialization }
MyTBAdminComponent >> initialize [

	super initialize.
	self report: (MyTBPostReport from: self blog)
]

{ #category : #rendering }
MyTBAdminComponent >> renderContentOn: html [

	super renderContentOn: html.
	html
		tbsContainer: [ 
			html heading: 'Blog Admin'.
			html horizontalRule.
			html render: self report ]
]

{ #category : #accessing }
MyTBAdminComponent >> report [
	^ report
]

{ #category : #accessing }
MyTBAdminComponent >> report: anObject [
	report := anObject
]
