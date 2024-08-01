Class {
	#name : #MyTBPostListComponent,
	#superclass : #MyTBAppScreenComponent,
	#instVars : [
		'currentCategory'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #utilities }
MyTBPostListComponent >> categoriesComponent [

	^ MyTBCategoriesComponent categories: self blog allCategories postsList: self
]

{ #category : #accessing }
MyTBPostListComponent >> currentCategory [
	^ currentCategory
]

{ #category : #accessing }
MyTBPostListComponent >> currentCategory: anObject [
	currentCategory := anObject
]

{ #category : #utilities }
MyTBPostListComponent >> postComponentFor: aPost [

	^ MyTBPostComponent new post: aPost
]

{ #category : #accessing }
MyTBPostListComponent >> readSelectedPosts [

	^ self currentCategory
		ifNil: [ self blog allVisiblePosts ]
		ifNotNil: [ :arg | self blog allVisiblePostsFromCategory: currentCategory ]
]

{ #category : #rendering }
MyTBPostListComponent >> renderCategoriesOn: html [

	^ html render: self categoriesComponent
]

{ #category : #rendering }
MyTBPostListComponent >> renderCategoryColumnOn: html [

	^ html tbsColumn
		extraSmallSize: 12;
		smallSize: 3;
		mediumSize: 4;
		with: [ self renderCategoriesOn: html ]
]

{ #category : #rendering }
MyTBPostListComponent >> renderContentOn: html [

	super renderContentOn: html.
	html
		tbsContainer: [ html tbsRow
				showGrid;
				with: [ self renderCategoryColumnOn: html.
					self renderPostsColumnOn: html ] ]
]

{ #category : #rendering }
MyTBPostListComponent >> renderPostsColumnOn: html [

	^ html tbsColumn
		extraSmallSize: 12;
		smallSize: 9;
		mediumSize: 8;
		with: [ self renderPostsOn: html ]
]

{ #category : #rendering }
MyTBPostListComponent >> renderPostsOn: html [

	^ self readSelectedPosts do: [ :p | html render: (self postComponentFor: p) ]
]
