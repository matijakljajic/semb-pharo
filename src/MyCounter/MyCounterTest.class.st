Class {
	#name : #MyCounterTest,
	#superclass : #TestCase,
	#category : #'MyCounter-Tests'
}

{ #category : #tests }
MyCounterTest >> testCounterDecrement [

	| c |

	c := MyCounter new.
	c count: 2.
	c decrement decrement.
	self assert: c count equals: 0
]

{ #category : #tests }
MyCounterTest >> testCounterIncrement [

	| c |

	c := MyCounter new.
	c count: 8.
	c increment increment.
	self assert: c count equals: 10
]

{ #category : #tests }
MyCounterTest >> testCounterSetAndRead [

	| c |

	c := MyCounter new.
	c count: 10.
	self assert: c count equals: 10
]

{ #category : #tests }
MyCounterTest >> testStartingAt5 [

	| c |

	c := MyCounter startingAt: 5.
	self assert: c count equals: 5
]
