Class {
	#name : #MyTBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'MyTinyBlog-App'
}

{ #category : #'instance creation' }
MyTBBlog class >> current [

	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #'class initialization' }
MyTBBlog class >> initialize [

	self reset
]

{ #category : #'instance creation' }
MyTBBlog class >> reset [

	uniqueInstance := nil
]

{ #category : #accessing }
MyTBBlog >> addPost: aMyTBPost [ 
	
	posts add: aMyTBPost.
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

	posts removeAllSuchThat: [ :x | x category = aCategory ]
]

{ #category : #initialization }
MyTBBlog >> initialize [

	super initialize.
	posts := OrderedCollection new
]

{ #category : #action }
MyTBBlog >> movePostFrom: aString to: aString2 [ 
	self shouldBeImplemented.
]

{ #category : #action }
MyTBBlog >> removeAllPosts [

	posts := OrderedCollection new
]

{ #category : #action }
MyTBBlog >> renameCategory: oldCategory to: newCategory [ 
	
	posts do: [ :x | x category = oldCategory ifTrue: [ x category: newCategory ] ].
]

{ #category : #accessing }
MyTBBlog >> size [

	^ posts size
]

{ #category : #accessing }
MyTBBlog >> unclassifiedBlogPosts [

	^ posts select: [ :x | x isUnclassified ]
]
