Class {
	#name : #MyTBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #'MyTinyBlog-App'
}

{ #category : #'instance creation' }
MyTBPost class >> title: aTitle text: aText [

	^ self new
		title: aTitle;
		text: aText;
		yourself
]

{ #category : #'instance creation' }
MyTBPost class >> title: aTitle text: aText category: aCategory [

	^ self new
		title: aTitle;
		text: aText;
		category: aCategory;
		yourself
]

{ #category : #accessing }
MyTBPost class >> unclassifiedTag [
	
	^ 'Unclassified'
]

{ #category : #accessing }
MyTBPost >> category [
	^ category
]

{ #category : #accessing }
MyTBPost >> category: anObject [
	category := anObject
]

{ #category : #accessing }
MyTBPost >> date [
	^ date
]

{ #category : #accessing }
MyTBPost >> date: anObject [
	date := anObject
]

{ #category : #'magritte descriptions' }
MyTBPost >> descriptionCategory [
	
	<magritteDescription>
	^ MAStringDescription new
		label: 'Category';
		priority: 300;
		accessor: #category;
		comment: 'Unclassified if empty';
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #'magritte descriptions' }
MyTBPost >> descriptionContainer [

	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: TBSMagritteFormRenderer;
		yourself
]

{ #category : #'magritte descriptions' }
MyTBPost >> descriptionDate [

	<magritteDescription>
	^ MADateDescription new
		label: 'Date';
		priority: 400;
		accessor: #date;
		beRequired;
		yourself
]

{ #category : #'magritte descriptions' }
MyTBPost >> descriptionText [
	
	<magritteDescription>
	^ MAMemoDescription new
		label: 'Text';
		priority: 200;
		accessor: #text;
		beRequired;
		requiredErrorMessage: 'A blog post must contain a text.';
		comment: 'Please enter a text';
		componentClass: TBSMagritteTextAreaComponent;
		yourself
]

{ #category : #'magritte descriptions' }
MyTBPost >> descriptionTitle [

	<magritteDescription>
	^ MAStringDescription new
		label: 'Title';
		priority: 100;
		accessor: #title;
		requiredErrorMessage: 'A blog post must have a title.';
		comment: 'Please enter a title';
		componentClass: TBSMagritteTextInputComponent;
		beRequired;
		yourself
]

{ #category : #'magritte descriptions' }
MyTBPost >> descriptionVisible [
	
	<magritteDescription>
	^ MABooleanDescription new
		checkboxLabel: 'Visible';
		priority: 500;
		accessor: #visible;
		componentClass: TBSMagritteCheckboxComponent;
		beRequired;
		yourself
]

{ #category : #initialization }
MyTBPost >> initialize [

	super initialize.
	self date: Date today.
	self makeInvisible.
	self category: self class unclassifiedTag
]

{ #category : #testing }
MyTBPost >> isUnclassified [

	^ self category = self class unclassifiedTag
]

{ #category : #testing }
MyTBPost >> isVisible [

	^ self visible
]

{ #category : #action }
MyTBPost >> makeInvisible [

	self visible: false
]

{ #category : #action }
MyTBPost >> makeVisible [
	
	self visible: true
]

{ #category : #accessing }
MyTBPost >> text [
	^ text
]

{ #category : #accessing }
MyTBPost >> text: anObject [
	text := anObject
]

{ #category : #accessing }
MyTBPost >> title [
	^ title
]

{ #category : #accessing }
MyTBPost >> title: anObject [
	title := anObject
]

{ #category : #accessing }
MyTBPost >> visible [
	^ visible
]

{ #category : #accessing }
MyTBPost >> visible: anObject [
	visible := anObject
]
