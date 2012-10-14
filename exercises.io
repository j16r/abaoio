"Exercises from day 2 of 7l7w" println

/* Matcher framework */
Expectation := Object clone
Expectation eql := method(
  actualValue := self value
  expectedValue := call evalArgAt(0)
  if(expectedValue == actualValue) else("Expected #{expectedValue}, got #{actualValue}" interpolate println))

Object should := method(
  expectation := Expectation clone
  expectation value := call target
  expectation)
nil should := true should := false should := Object getSlot("should")

/* Fibonacci method */
fib := method(
  upTo := call evalArgAt(0)
  if(upTo <= 1,
     return upTo,
     return fib(upTo - 1) + fib(upTo - 2)))

fib(1) should eql(1)
fib(2) should eql(1)
fib(3) should eql(2)
fib(4) should eql(3)
fib(5) should eql(5)
fib(6) should eql(8)
fib(7) should eql(13)
fib(8) should eql(21)

/* Average lists */
List myAverage := method(
  sum ifNil(return 0) ifNonNil(return sum / size))

list(1, 2, 3, 4, 5) myAverage should eql(3)
list() myAverage should eql(0)
/*list(1, nil, 3, 4, 5) myAverage*/

/* Invincible div */
/*Number / := */

/* 2 dimensional lists / matrices */
Matrix := Object clone
Matrix dim := method(
  x := call evalArgAt(0)
  y := call evalArgAt(1)

  vector := list()
  for(rowIndex, 1, y,
    row := list()
    for(colIndex, 1, x,
      row append(0)
    )
    vector append(row)
  )

  matrix := Matrix clone
  matrix vector := vector
  return matrix)
Matrix set := method(
  x := call evalArgAt(0)
  y := call evalArgAt(1)
  value := call evalArgAt(2)

  vector at(y) atPut(x, value)
  return self)
Matrix get := method(
  x := call evalArgAt(0)
  y := call evalArgAt(1)

  return vector at(y) at(x))

Matrix dim(1, 1) vector should eql(list(list(0)))
Matrix dim(2, 3) vector should eql(list(list(0, 0), list(0, 0), list(0, 0)))

Matrix dim(1, 1) set(0, 0, 10) vector should eql(list(list(10)))
Matrix dim(2, 3) set(1, 2, 10) vector should eql(list(list(0, 0), list(0, 0), list(0, 10)))

values := Matrix dim(2, 3)
values set(0, 0, 1000)
values set(1, 0, 1000)
values get(0, 1) should eql(0)
values get(1, 0) should eql(1000)

/* Serializing to a file */
f := File with("matrix.json")
f openForUpdating
f write(values vector asJson)
f close

/* Concurrency */
slower := Object clone
faster := Object clone
slower start := method(wait(2), writeln("Slowly"))
faster start := method(wait(1), writeln("Faster"))

"Order should appear as:\nSlowly\nFaster\nFaster\nSlowly\n" println
slower start; faster start

slower @@start; faster @@start
wait(3)

