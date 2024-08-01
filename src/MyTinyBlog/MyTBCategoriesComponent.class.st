Class {
	#name : #MyTBCategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #'instance creation' }
MyTBCategoriesComponent class >> categories: categories postsList: aMyTBScreen [

	^ self new categories: categories; postsList: aMyTBScreen 
]

{ #category : #accessing }
MyTBCategoriesComponent >> categories [
	^ categories
]

{ #category : #accessing }
MyTBCategoriesComponent >> categories: aCollection [
	categories := aCollection asSortedCollection
]

{ #category : #accessing }
MyTBCategoriesComponent >> postsList [
	^ postsList
]

{ #category : #accessing }
MyTBCategoriesComponent >> postsList: aComponent [
	postsList := aComponent
]

{ #category : #rendering }
MyTBCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [

	html tbsLinkifyListGroupItem
		class: 'active' if: aCategory = self postsList currentCategory;
		callback: [ self selectCategory: aCategory ];
		with: aCategory
]

{ #category : #rendering }
MyTBCategoriesComponent >> renderContentOn: html [ 

	html tbsListGroup: 
		[ html tbsListGroupItem 
			with: [ html strong: 'Categories' ].
			html tbsLinkifyListGroupItem
					class: 'active' if: nil = self postsList currentCategory;
					callback: [ self selectCategory: nil ];
					with: 'All'.
			categories do: [ :cat | self renderCategoryLinkOn: html with: cat ] ].
]

{ #category : #action }
MyTBCategoriesComponent >> selectCategory: aCategory [

	postsList currentCategory: aCategory
]
