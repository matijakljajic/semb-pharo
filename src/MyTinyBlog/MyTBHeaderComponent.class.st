Class {
	#name : #MyTBHeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #'instance creation' }
MyTBHeaderComponent class >> from: aComponent [

	^ self new component: aComponent; yourself
]

{ #category : #accessing }
MyTBHeaderComponent >> component [
	^ component
]

{ #category : #accessing }
MyTBHeaderComponent >> component: anObject [
	component := anObject
]

{ #category : #rendering }
MyTBHeaderComponent >> renderBrandOn: html [

	html tbsNavbarBrand url: self application url; with: MyTBBlog current name
]

{ #category : #rendering }
MyTBHeaderComponent >> renderButtonsOn: html [

	self session someoneIsLogged 
		ifTrue: [ self renderConnectButtonOn: html ]
		ifFalse: [ self renderModalAuthButtonOn: html ]
]

{ #category : #rendering }
MyTBHeaderComponent >> renderConnectButtonOn: html [

	html form: [ html tbsNavbarButton tbsPullRight;
		callback: [ component goToAdminView ];
		with: [ html tbsGlyphIcon iconLogin. html text: ' Admin View' ] ]
]

{ #category : #rendering }
MyTBHeaderComponent >> renderContentOn: html [

	html tbsNavbar
		beDefault;
		with: [ html
				tbsContainer: [ self renderBrandOn: html.
					self renderButtonsOn: html ] ]
]

{ #category : #rendering }
MyTBHeaderComponent >> renderModalAuthButtonOn: html [

	html render: (MyTBAuthComponent from: component).
	html tbsNavbarButton tbsPullRight;
		attributeAt: 'data-target' put: '#myAuthDialog';
		attributeAt: 'data-toggle' put: 'modal';
		with: [
			html tbsGlyphIcon iconLock.
			html text: ' Connect' ]
]
