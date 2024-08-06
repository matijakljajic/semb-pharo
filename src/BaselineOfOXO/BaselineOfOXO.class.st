Class {
	#name : #BaselineOfOXO,
	#superclass : #BaselineOf,
	#category : #BaselineOfOXO
}

{ #category : #baselines }
BaselineOfOXO >> baseline: spec [

	<baseline>
	spec for: #common do: [
		"Dependencies"
		spec
			baseline: 'Bloc'
			with: [ spec repository: 'github://pharo-graphics/Bloc:v2.0.0/src' ].
		"Packages"
		spec
			package: 'OXO';
			package: 'OXO-Tests' with: [ spec requires: #( 'OXO' ) ] ]
]

{ #category : #accessing }
BaselineOfOXO >> projectClass [
	^ MetacelloCypressBaselineProject
]
