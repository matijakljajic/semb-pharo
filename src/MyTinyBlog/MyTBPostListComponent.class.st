Class {
	#name : #MyTBPostListComponent,
	#superclass : #MyTBAppScreenComponent,
	#instVars : [
		'currentCategory',
		'showLoginError'
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

{ #category : #rendering }
MyTBPostListComponent >> goToAdminView [

	self call: MyTBAdminComponent new
]

{ #category : #'error handing' }
MyTBPostListComponent >> hasLoginError [

	^ showLoginError ifNil: [ false ]
]

{ #category : #'error handing' }
MyTBPostListComponent >> loginErrorMessage [

	^ 'Incorrect login and/or password'
]

{ #category : #'error handing' }
MyTBPostListComponent >> loginErrorOccurred [

	showLoginError := true
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
		with: [ 
			self renderCategoriesOn: html.
			self renderLoginErrorMessageIfAnyOn: html ]
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
MyTBPostListComponent >> renderLoginErrorMessageIfAnyOn: html [

	self hasLoginError
		ifFalse: [ ^ self ].
	showLoginError := false.
	html tbsAlert
		beDanger;
		with: self loginErrorMessage
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

{ #category : #utilities }
MyTBPostListComponent >> tryConnectionWithLogin: user andPassword: pass [

	(user = self blog admin user and: [ (SHA256 hashMessage: pass) = self blog admin pass ])
		ifTrue: [ 
			self session admin: self blog admin.
			self goToAdminView ]
		ifFalse: [ self loginErrorOccurred ]
]
