running
runClasses: aCollectionOfClasses spec: aSCISpec
  | suite classes |
  suite := TestSuite named: aSCISpec name.
  classes := (aCollectionOfClasses
    select: [ :each | (each includesBehavior: TestCase) and: [ each isAbstract not ] ])
      asSortedCollection: [ :a :b | a name <= b name ].
  classes
    do: [ :each | suite addTests: each suite allTests ].
  ^ self runSuite: suite spec: aSCISpec