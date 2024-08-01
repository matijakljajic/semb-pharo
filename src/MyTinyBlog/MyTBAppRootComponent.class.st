Class {
	#name : #MyTBAppRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #testing }
MyTBAppRootComponent class >> canBeRoot [

	^ true
]

{ #category : #'class initialization' }
MyTBAppRootComponent class >> initialize [

	| app |
	app := WAAdmin register: self asApplicationAt: 'TinyBlog'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary
]

{ #category : #hooks }
MyTBAppRootComponent >> children [

	^ { main }
]

{ #category : #initialization }
MyTBAppRootComponent >> initialize [

	super initialize.
	main := MyTBPostListComponent new.
]

{ #category : #accessing }
MyTBAppRootComponent >> main: anObject [
	main := anObject
]

{ #category : #rendering }
MyTBAppRootComponent >> renderContentOn: html [

	html render: main
]

{ #category : #updating }
MyTBAppRootComponent >> updateRoot: htmlRoot [
	super updateRoot: htmlRoot.
	htmlRoot beHtml5.
	htmlRoot
		title: MyTBBlog current name
]
