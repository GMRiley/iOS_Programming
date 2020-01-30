/*:
 ## Exercise - Type Casting and Inspection
 
 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let content:[Any] = [1,2,"One","Two",0.1,0.2,true,false]
print(content)
/*:
 Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
 */
for i in content.indices{
    print("The \(type(of: content[i])) has a value of \(content[i])")
}

/*:
 Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
 */
let dict:[String: Any] = ["OneInt": 1, "TwoInt": 2, "OneDouble": 0.1, "TwoDouble": 0.2, "OneStr": "One","TwoStr": "Two", "OneBool":true, "TwoBool": false]
print(dict)
/*:
 Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
 */
var total: Double = 0
for (_,value) in dict{
    total += ((type(of: value) == String.self) ? 1.0 : (type(of: value) == Bool.self) ? 2.0 : value as! Double.Typ)
}
print(total)
/*:
 Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
 */


//: page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
