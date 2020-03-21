/* general form of Closure
{ (parameters) -> returnType in
   statements
}
*/

func calculator(n0: Int, n1: Int, operation: (Int, Int) -> Int) -> Int{
    return operation(n0, n1)
}

/* pass the function def as parameter without using closure
func multiply(n0: Int, n1: Int) -> Int {
    return n0 * n1
}

let result = calculator(n0: 2, n1: 3, operation: multiply(n0:n1:))
*/

/* use closures
let result = calculator(n0: 2, n1: 3, operation: {(v1: Int, v2: Int) in
    return v1 * v2
})
 */

/* get rid of the param type and the return keyword
let result = calculator(n0: 2, n1: 3, operation: {(v1, v2) in v1 * v2})
 */

/* use anonymous parameter
let result = calculator(n0: 3, n1: 2, operation: {$0 * $1})
 */

/* use trailing closure
let result = calculator(n0: 3, n1: 2){$0 * $1}
print(result)
 */

// paratical use of Closure
let array = [2, 4, 5, 7, 6]

print(array.map({$0 + 1}))



