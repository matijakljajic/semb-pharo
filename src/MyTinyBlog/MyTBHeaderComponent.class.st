Class {
	#name : #MyTBHeaderComponent,
	#superclass : #WAComponent,
	#category : #'MyTinyBlog-Components'
}

{ #category : #rendering }
MyTBHeaderComponent >> renderBrandOn: html [

	html tbsNavbarBrand url: self application url; with: MyTBBlog current name
]

{ #category : #rendering }
MyTBHeaderComponent >> renderContentOn: html [

	html tbsNavbar beDefault; with: [ html tbsContainer: [ self renderBrandOn: html ] ]
]
