Class {
	#name : #MyTBAuthComponent,
	#superclass : #WAComponent,
	#instVars : [
		'pass',
		'user',
		'component'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #'instance creation' }
MyTBAuthComponent class >> from: aComponent [

	^ self new component: aComponent; yourself
]

{ #category : #accessing }
MyTBAuthComponent >> component [
	^ component
]

{ #category : #accessing }
MyTBAuthComponent >> component: anObject [
	component := anObject
]

{ #category : #accessing }
MyTBAuthComponent >> pass [
	^ pass
]

{ #category : #accessing }
MyTBAuthComponent >> pass: anObject [
	pass := anObject
]

{ #category : #rendering }
MyTBAuthComponent >> renderBodyOn: html [

	html tbsModalBody: [
			html tbsForm: [ 
				self renderUserFieldOn: html.
				self renderPassFieldOn: html.
				html tbsModalFooter: [ self renderButtonsOn: html ] ] ]
]

{ #category : #rendering }
MyTBAuthComponent >> renderButtonsOn: html [


	html tbsSubmitButton
		bePrimary;
		callback: [ self validate ];
		value: 'Confirm'.
	html tbsButton
		attributeAt: 'type' put: 'button';
		attributeAt: 'data-dismiss' put: 'modal';
		beDefault;
		value: 'Cancel'
]

{ #category : #rendering }
MyTBAuthComponent >> renderContentOn: html [

	html tbsModal
		id: 'myAuthDialog';
		with: [ html tbsModalDialog: [ 
				html tbsModalContent: [ 
					self renderHeaderOn: html.
					self renderBodyOn: html ] ] ]
]

{ #category : #rendering }
MyTBAuthComponent >> renderHeaderOn: html [

	html tbsModalHeader: [ 
		html tbsModalCloseIcon.
		html tbsModalTitle level4 with: 'Authentication' ]
]

{ #category : #rendering }
MyTBAuthComponent >> renderPassFieldOn: html [
	
	html
		tbsFormGroup: [ html label with: 'Password'.
			html passwordInput
				tbsFormControl;
				callback: [ :value | pass := value ];
				value: pass ]
]

{ #category : #rendering }
MyTBAuthComponent >> renderUserFieldOn: html [
	
	html
		tbsFormGroup: [ html label with: 'Account'.
			html textInput
				tbsFormControl;
				attributeAt: 'autofocus' put: 'true';
				callback: [ :value | user := value ];
				value: user ]
]

{ #category : #accessing }
MyTBAuthComponent >> user [
	^ user
]

{ #category : #accessing }
MyTBAuthComponent >> user: anObject [
	user := anObject
]

{ #category : #accessing }
MyTBAuthComponent >> validate [

	^ component tryConnectionWithLogin: self user andPassword: self pass
]
