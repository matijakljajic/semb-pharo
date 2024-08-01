Class {
	#name : #MyTBBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first',
		'prevRepo'
	],
	#category : #'MyTinyBlog-Tests'
}

{ #category : #running }
MyTBBlogTest >> setUp [

	super setUp.

	prevRepo := VORepository current.
	VORepository setRepository: VOMemoryRepository new.

	blog := MyTBBlog current.
	blog removeAllPosts.
	
	first := MyTBPost title: 'firstTitle' text: 'firstText' category: 'firstCategory'.
	blog addPost: first.
	
	post := (MyTBPost title: 'testTitle' text: 'testText' category: 'testCategory') makeVisible
]

{ #category : #running }
MyTBBlogTest >> tearDown [

	VORepository setRepository: prevRepo.
	
	super tearDown
]

{ #category : #tests }
MyTBBlogTest >> testAddPost [

	blog addPost: post.
	self assert: blog size equals: 2
]

{ #category : #tests }
MyTBBlogTest >> testAdminChange [

	| admin |
	
	admin := blog admin.
	admin user: 'skeksis'.
	admin pass: 'corrupt'.
	self assert: blog admin user equals: 'skeksis'.
	self assert: blog admin pass equals: (SHA256 hashMessage: 'corrupt')
]

{ #category : #tests }
MyTBBlogTest >> testAdminCreation [

	self assert: blog admin user equals: 'admin'.
	self assert: blog admin pass equals: (SHA256 hashMessage: 'ztonpk')
]

{ #category : #tests }
MyTBBlogTest >> testAllCategories [

	self assert: blog allCategories size equals: 1.
	blog addPost: post.
	self assert: blog allCategories size equals: 2
]

{ #category : #tests }
MyTBBlogTest >> testAllCategoriesWithSmthVisible [

	self assert: blog allCategoriesWithSmthVisible size equals: 0.
	blog addPost: post.
	self assert: blog allCategoriesWithSmthVisible size equals: 1
]

{ #category : #tests }
MyTBBlogTest >> testAllPosts [

	blog addPost: post.
	self assert: blog allPosts size equals: 2.
]

{ #category : #tests }
MyTBBlogTest >> testAllPostsFromCategory [

	self assert: (blog allPostsFromCategory: 'firstCategory') size equals: 1.
]

{ #category : #tests }
MyTBBlogTest >> testAllVisiblePosts [

	self assert: blog allVisiblePosts size equals: 0.
	blog addPost: post.
	self assert: blog allVisiblePosts size equals: 1
]

{ #category : #tests }
MyTBBlogTest >> testAllVisiblePostsFromCategory [

	self assert: (blog allVisiblePostsFromCategory: 'testCategory') size equals: 0.
	blog addPost: post.
	self assert: (blog allVisiblePostsFromCategory: 'testCategory') size equals: 1.
]

{ #category : #tests }
MyTBBlogTest >> testDeleteCategory [

	blog deleteCategory: 'firstCategory'.
	self assert: (blog allPostsFromCategory: 'firstCategory') size equals: 0
]

{ #category : #tests }
MyTBBlogTest >> testRemoveAllPosts [

	blog removeAllPosts.
	self assert: blog size equals: 0.
]

{ #category : #tests }
MyTBBlogTest >> testRenameCategoryTo [

	| count |
	count := (blog allPostsFromCategory: 'firstCategory') size.
	blog renameCategory: 'firstCategory' to: '1stCategory'.
	self assert: (blog allPostsFromCategory: 'firstCategory') size equals: 0.
	self assert: (blog allPostsFromCategory: '1stCategory') size equals: count.
]

{ #category : #tests }
MyTBBlogTest >> testSize [

	self assert: blog size equals: 1.
]

{ #category : #tests }
MyTBBlogTest >> testUnclassifiedBlogPosts [

	self assert: blog unclassifiedBlogPosts size equals: 0
]
