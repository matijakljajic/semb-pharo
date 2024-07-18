Class {
	#name : #CounterTest,
	#superclass : #TestCase,
	#category : #'MyCounter-Tests'
}

{ #category : #tests }
CounterTest >> testCounterDecrement [

| c |
c := Counter new.
c count: 2.
c decrement decrement.
self assert: c count equals: 0
]

{ #category : #tests }
CounterTest >> testCounterIncrement [

| c |
c := Counter new.
c count: 8.
c increment increment.
self assert: c count equals: 10
]

{ #category : #tests }
CounterTest >> testCounterSetAndRead [

| c |
c := Counter new.
c count: 10.
self assert: c count equals: 10
]

{ #category : #tests }
CounterTest >> testStartingAt5 [

| c |
c := Counter startingAt: 5.
self assert: c count equals: 5
]
