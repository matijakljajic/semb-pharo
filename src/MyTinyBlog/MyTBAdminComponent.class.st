Class {
	#name : #MyTBAdminComponent,
	#superclass : #MyTBAppScreenComponent,
	#category : #'MyTinyBlog-Components'
}

{ #category : #initialization }
MyTBAdminComponent >> createHeaderComponent [

	^ MyTBAdminHeaderComponent from: self
]

{ #category : #rendering }
MyTBAdminComponent >> goToPostListView [

	self answer
]

{ #category : #rendering }
MyTBAdminComponent >> renderContentOn: html [

	super renderContentOn: html.
	html
		tbsContainer: [ html heading: 'Blog Admin'.
			html horizontalRule ]
]
