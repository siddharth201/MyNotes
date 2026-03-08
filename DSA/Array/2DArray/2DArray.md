
> Given a matrix print row-wise sum  
```swift
public func rowWiseSum(mat: [[Int]]) {
    if mat.isEmpty { return  }
    
    for i in 0..<mat.count {
        var sum = 0
        for j in 0..<mat[i].count {
            sum += mat[i][j]
        }
        print(sum)
    }
}
```

> Given a matrix print column-wise sum
```swift
public func columnWiseSum(mat: [[Int]]) {
    if mat.isEmpty { return  }
    
    let cols = mat[0].count
    let rows = mat.count
    
    for c in 0..<cols {
        var sum = 0
        for r in 0..<rows {
            if c < mat[r].count {
                sum += mat[r][c]
            }
        }
        print(sum)
    }
}
```

> Given a matrix print diagonal matrix
```swift
public func printDiagonal(mat: [[Int]]) {
    if mat.isEmpty { return }
    
    for i in 0..<mat.count {
        print(mat[i][i])
    }
    
    var i = 0
    var j = mat.count - 1
    while(i <= mat.count-1 && j >= 0) {
        print(mat[i][j])
        i+=1
        j-=1
    }
}
```
> Given a matrix print all diagonal matrix from L-R ant Top-Bottom
```swift
public func printAllDiagonal(mat: [[Int]]) {
    if mat.isEmpty { return }
    
    for k in 0..<mat[0].count {
        var i = 0
        var j = k
        while(i < mat.count && j >= 0) {
            print(mat[i][j])
            i += 1
            j -= 1
        }
        print(" ")
    }
    
    for k in 1..<mat.count {
        var i = k
        var j = mat[i].count-1
        while(i < mat.count && j >= 0) {
            print(mat[i][j])
            i += 1
            j -= 1
        }
        print(" ")
    }
}
```
> Given a matrix print transpose matrix
```swift
public func transposeMatrix(mat: [[Int]]) {
    if mat.isEmpty { return }
    var mat = mat
    print(mat)
    for j in 0..<mat[0].count-1 {
        for i in j+1..<mat.count {
            let temp = mat[i][j]
            mat[i][j] = mat[j][i]
            mat[j][i] = temp
        }
    }
    print(mat)
}
```  

### Inputs
```swift
let matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

let matrix_column_wise = [
    [1, 2, 3],
    [4, 5]
  ]

let matrix1 = [
    [1, 2, 3, 10],
    [4, 5, 6, 11],
    [7, 8, 9, 12],
    [13, 14, 15, 16]
]

let customMatrix = [
    [1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10],
    [11, 12, 13, 14, 15],
    [16, 17, 18, 19, 20]
]
```

###How to Call
```swift
rowWiseSum(mat: matrix)  

columnWiseSum(mat: matrix)
columnWiseSum(mat: matrix_column_wise)

