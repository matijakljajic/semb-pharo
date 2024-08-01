Class {
	#name : #MyTBBlog,
	#superclass : #Object,
	#instVars : [
		'name',
		'posts'
	],
	#category : #'MyTinyBlog-App'
}

{ #category : #'instance creation' }
MyTBBlog class >> current [

	^ self selectAll
		ifNotEmpty: [ :x | x anyOne ]
		ifEmpty: [ self new save ]
]

{ #category : #'class initialization' }
MyTBBlog class >> initialize [

	self reset
]

{ #category : #initialization }
MyTBBlog class >> initializeVoyageOnMemoryDB [

	VOMemoryRepository new enableSingleton
]

{ #category : #testing }
MyTBBlog class >> isVoyageRoot [

	^ true
]

{ #category : #'instance creation' }
MyTBBlog class >> reset [

	self initializeVoyageOnMemoryDB 
]

{ #category : #accessing }
MyTBBlog >> addPost: aMyTBPost [ 
	
	posts add: aMyTBPost.
	self save
]

{ #category : #accessing }
MyTBBlog >> allCategories [

	^ (posts collect: [ :x | x category ]) asSet
]

{ #category : #accessing }
MyTBBlog >> allCategoriesWithSmthVisible [

	^ ((posts select: [ :x | x isVisible ]) collect: [ :x | x category ]) asSet
]

{ #category : #accessing }
MyTBBlog >> allPosts [

	^ posts
]

{ #category : #accessing }
MyTBBlog >> allPostsFromCategory: aCategory [

	^ posts select: [ :x | x category = aCategory ]
]

{ #category : #accessing }
MyTBBlog >> allVisiblePosts [

	^ posts select: [ :x | x isVisible ]
]

{ #category : #accessing }
MyTBBlog >> allVisiblePostsFromCategory: aCategory [ 
	
	^ posts select: [ :x | x isVisible and: (x category = aCategory) ]
]

{ #category : #action }
MyTBBlog >> deleteCategory: aCategory [

	posts removeAllSuchThat: [ :x | x category = aCategory ].
	self save
]

{ #category : #initialization }
MyTBBlog >> initialize [

	super initialize.
	posts := OrderedCollection new
]

{ #category : #accessing }
MyTBBlog >> name [
	^ name ifNil: [ 'TinyBlog' ] ifNotNil: [ :arg | name ]
]

{ #category : #accessing }
MyTBBlog >> name: anObject [
	name := anObject
]

{ #category : #action }
MyTBBlog >> removeAllPosts [

	posts := OrderedCollection new.
	self save
]

{ #category : #action }
MyTBBlog >> renameCategory: oldCategory to: newCategory [ 
	
	posts do: [ :x | x category = oldCategory ifTrue: [ x category: newCategory ] ].
	self save
]

{ #category : #accessing }
MyTBBlog >> size [

	^ posts size
]

{ #category : #accessing }
MyTBBlog >> unclassifiedBlogPosts [

	^ posts select: [ :x | x isUnclassified ]
]
