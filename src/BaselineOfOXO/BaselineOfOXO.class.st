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
			package: 'OXO-AI' with: [ spec requires: #('OXO') ];
			package: 'OXO-Tests' with: [ spec requires: #( 'OXO' 'OXO-AI' ) ] ]
]

{ #category : #accessing }
BaselineOfOXO >> projectClass [
	^ MetacelloCypressBaselineProject
]
