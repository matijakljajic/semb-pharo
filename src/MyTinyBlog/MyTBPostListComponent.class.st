Class {
	#name : #MyTBPostListComponent,
	#superclass : #MyTBAppScreenComponent,
	#category : #'MyTinyBlog-Components'
}

{ #category : #rendering }
MyTBPostListComponent >> renderContentOn: html [

	super renderContentOn: html.
	html tbsContainer: [ 
		self blog allVisiblePosts do: [ 
			:x | html render: (MyTBPostComponent with: x) ] ]
]
