Class {
	#name : #MyTBPostReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'blog'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #'instance creation' }
MyTBPostReport class >> filteredDescriptionsFrom: aBlogPost [

	^ aBlogPost magritteDescription
		select: [ :each | #(title category date) includes: each accessor selector ]
]

{ #category : #'instance creation' }
MyTBPostReport class >> from: aBlog [

	| allPlogs report |
	
	allPlogs := aBlog allPosts.
	report := self rows: allPlogs description: (self filteredDescriptionsFrom: allPlogs anyOne).
	report blog: aBlog.
	report addColumn: (MACommandColumn new addCommandOn: report selector: #viewPost: text: 'View';
		yourself;
		addCommandOn: report selector: #editPost: text: 'Edit';
		yourself;
		addCommandOn: report selector: #deletePost: text: 'Delete';
		yourself).
	^ report
]

{ #category : #rendering }
MyTBPostReport >> addPost [

	| post |

	post := self call: (self renderAddPostForm: MyTBPost new).
	post ifNotNil: [ :arg | blog addPost: post. self refreshReport ]
]

{ #category : #accessing }
MyTBPostReport >> blog [
	^ blog
]

{ #category : #accessing }
MyTBPostReport >> blog: aMyTBBlog [
	blog := aMyTBBlog
]

{ #category : #rendering }
MyTBPostReport >> deletePost: aPost [

	(self confirm: 'Do you want remove this post ?')
		ifFalse: [ ^ self ].
	blog removeBlogPost: aPost.
	self refreshReport
]

{ #category : #rendering }
MyTBPostReport >> editPost: aPost [

	| post |

	post := self call: (self renderEditPostForm: aPost).
	post ifNotNil: [ :arg | blog save ]
]

{ #category : #rendering }
MyTBPostReport >> refreshReport [

	self rows: blog allPosts.
	self refresh.
]

{ #category : #rendering }
MyTBPostReport >> renderAddPostForm: aPost [

	^ aPost asComponent
		addDecoration: (TBSMagritteFormDecoration buttons: { #save -> 'Add post' . #cancel -> 'Cancel'});
		yourself
]

{ #category : #rendering }
MyTBPostReport >> renderContentOn: html [

	html tbsGlyphIcon iconPencil.
	html anchor callback: [ self addPost ]; with: 'Add post'.
	super renderContentOn: html
]

{ #category : #rendering }
MyTBPostReport >> renderEditPostForm: aPost [
	
	^ aPost asComponent
		addDecoration:
			(TBSMagritteFormDecoration
				buttons: {(#save -> 'Save post'). (#cancel -> 'Cancel')});
		yourself
]

{ #category : #rendering }
MyTBPostReport >> renderViewPostForm: aPost [

	^ aPost asComponent
		addDecoration: (TBSMagritteFormDecoration buttons: { #cancel -> 'Back' });
		readonly: true;
		yourself
]

{ #category : #rendering }
MyTBPostReport >> viewPost: aPost [

	self call: (self renderViewPostForm: aPost)
]
