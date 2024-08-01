Class {
	#name : #MyTBAdminHeaderComponent,
	#superclass : #MyTBHeaderComponent,
	#category : #'MyTinyBlog-Components'
}

{ #category : #rendering }
MyTBAdminHeaderComponent >> renderButtonsOn:html [

	html form: [ 
		self renderDisconnectButtonOn: html.
		self renderPublicViewButtonOn: html ]
]

{ #category : #rendering }
MyTBAdminHeaderComponent >> renderDisconnectButtonOn: html [

	html tbsNavbarButton tbsPullRight;
		callback: [ self session reset ];
		with: [ html text: 'Disconnect '. html tbsGlyphIcon iconLogout ]
]

{ #category : #rendering }
MyTBAdminHeaderComponent >> renderPublicViewButtonOn: html [

	self session someoneIsLogged ifTrue: [ 
		html tbsNavbarButton tbsPullRight;
		callback: [ component goToPostListView ];
		with: [
			html tbsGlyphIcon iconEyeOpen.
			html text: ' Public View' ] ]
]
