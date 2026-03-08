
### Node
```swift
public class Node {
    let val: Int
    var next: Node?
    
    public init(nodeVal val: Int, nextNode next: Node? = nil) {
        self.val = val
        self.next = next
    }
}
```

### Basic LinkedList Operations
```swift
public class LinkedList {
    private var head: Node?
    
    private var h1: Node?
    private var h2: Node?
    
    public init() {}
    
    // MARK: - 1. Insert Operations
    
    // MARK: Insert at Head
    public func insertAtHead(_ val: Int) {
        head = Node(nodeVal: val, nextNode: head)
    }
    
    // MARK: Insert at Position (0-based index)
    public func insertAtPosition(_ val: Int, _ pos: Int) {
        if pos < 0 { return }

        if pos == 0 {
            head = Node(nodeVal: val, nextNode: head)
            return
        }

        var index = 0
        var temp = head

        while index < pos - 1 {
            if temp == nil {
                return
            }
            temp = temp!.next
            index += 1
        }
        
        temp!.next = Node(nodeVal: val, nextNode: temp!.next)
    }
    
    // MARK: Insert at Tail
    public func insertAtTail(_ val: Int) {
        let newNode = Node(nodeVal: val)
        
        guard let head = head else {
            self.head = newNode
            return
        }
        
        var temp = head
        while temp.next != nil {
            temp = temp.next!
        }
        
        temp.next = newNode
    }
    
    // MARK: - 2. Delete Operations
    
    // MARK: Delete Head
    public func deleteHead() {
        head = head?.next
    }
    
    // MARK: Delete by Value
    public func deleteByValue(_ val: Int) {
        guard let head = head else { return }
        
        if head.val == val {
            self.head = head.next
            return
        }
        
        var curr = head
        while curr.next != nil {
            if curr.next!.val == val {
                curr.next = curr.next!.next
                return
            }
            curr = curr.next!
        }
    }
    
    //MARK: Delete Tail
    public func deleteTail() {
        // empty list
        guard let head = head else { return }

        // single node list
        if head.next == nil {
            self.head = nil
            return
        }

        var curr = head

        // stop at second last node
        while curr.next?.next != nil {
            curr = curr.next!
        }

        // delete tail
        curr.next = nil
    }
    
    // MARK: Delete at Position
    public func deleteAtPosition(_ pos: Int) {
        
        guard var curr = head else { return }
        
        if pos == 0 {
            head = head!.next
            return
        }
        
        var index = 0
        while index < pos-1 {
            if curr.next == nil {
                print("Position not exist in LinkedList")
                return
            }
            curr = curr.next!
            index += 1
        }
        
        if curr.next == nil {
            return
        }
        
        curr.next = curr.next!.next
        
    }
    
    // MARK: - 3. Traverse / Print
    public func printList() {
        var temp = head
        while temp != nil {
            print("\(temp!.val)", terminator: "->")
            temp = temp!.next
        }
        print("nil")
    }
    
    // MARK: - Traverse Custom List / Print Custom List
    public func printCustomList(_ head: Node?) {
        var temp = head
        while temp != nil {
            print("\(temp!.val)", terminator: "->")
            temp = temp!.next
        }
        print("nil")
    }
    
    //MARK: - 4. Access kth element in LinkedList
    //Version -1 Seems Incorrect
    public func accessKthElement_v1(_ k: Int) -> Node? {
        guard var temp = head else {
            print("Empty List")
            return nil
        }
        
        if k == 0 {
            return temp
        }
        
        var index = 0
        
        while index < k {
            if temp.next == nil {
                print("Out of List")
                return  nil
            }
            temp = temp.next!
            index += 1
        }
        
        return temp.next
    }
    
    //Version -2
    public func accessKthElement_v2(_ k: Int) -> Node? {
        if k < 0 { return nil}
        
        var temp = head
        var index = 0
        
        while temp != nil {
            if index == k {
                return temp
            }
            temp = temp!.next
            index += 1
        }
        
        print("Out of List")
        return temp
    }
    
    //MARK: - 5. Search for a given data x in the LinkedList
    public func contains_v1(_ value: Int) -> Bool {
        
        var temp = head
        
        while temp != nil {
            if temp!.val == value {
                return true
            }
            temp = temp!.next
        }
        return false
    }
    
    public func contains_v2(_ value: Int) -> Bool {
        var current = head
        
        while let node = current {
            if node.val == value {
                return true
            }
            current = node.next
        }
        
        return false
    }
    
    //MARK: - 6.Reverse List
    public func reverseList() {
        
        if head == nil || head!.next == nil {
            return
        }
        
        var prev: Node? = nil
        var next: Node?
        var current = head
        
        while current != nil {
            next = current!.next
            current?.next = prev
            prev = current
            
            current = next
        }
        head = prev
    }
    
    //MARK: - 7.Find Middle in List
    public func findMiidleElement() -> Node? {
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
}
```  

//MARK: - 8.Merge two sorted list into a single sorted list
extension LinkedList {
    
    // Prepare First List
    public func firstList(_ val: Int) {
        h1 = Node(nodeVal: val, nextNode: h1)
    }
    
    // Prepare Second List
    public func secondList(_ val: Int) {
        h2 = Node(nodeVal: val, nextNode: h2)
    }
    
    public func printH1List() {
        var temp = h1
        while temp != nil {
            print("\(temp!.val)", terminator: "->")
            temp = temp!.next
        }
        print("nil")
    }
    
    public func printH2List() {
        var temp = h2
        while temp != nil {
            print("\(temp!.val)", terminator: "->")
            temp = temp!.next
        }
        print("nil")
    }
    
    
    //Brute-Force
    public func mergeSortedList_Brute() {
        
        var h1 = h1
        var h2 = h2
        
        var mergedListHead: Node?
        var mergedListTail:Node?
        
        while h1 != nil && h2 != nil {
            if h1!.val <= h2!.val {
                insertAtTail(val: h1!.val)
                h1 = h1!.next
            } else {
                insertAtTail(val: h2!.val)
                h2 = h2!.next
            }
        }
        
        if h1 == nil && h2 != nil {
            while h2 != nil {
                insertAtTail(val: h2!.val)
                h2 = h2!.next
            }
        } else if h2 == nil && h1 != nil {
            while h1 != nil {
                insertAtTail(val: h1!.val)
                h1 = h1!.next
            }
        }
        
        func insertAtTail(val: Int) {
            if mergedListHead == nil {
                mergedListHead = Node(nodeVal: val)
                mergedListTail = mergedListHead
            } else {
                mergedListTail?.next = Node(nodeVal: val)
                mergedListTail = mergedListTail?.next
            }
        }
        
        printCustomList(mergedListHead)
    }
    
    public func mergeSortedList() {
        
        if h1 == nil {
            printCustomList(h2)
            return
        }
        if h2 == nil {
            printCustomList(h1)
            return
        }
    
        var head1 = self.h1
        var head2 = self.h2
        var newHead: Node?

        if head1!.val <= head2!.val {
            newHead = head1
            head1 = head1!.next
        } else {
            newHead = head2
            head2 = head2!.next
        }
        
        var temp = newHead
        
        while (head1 != nil && head2 != nil) {
            if head1!.val <= head2!.val {
                temp!.next = head1
                head1 = head1!.next
            } else {
                temp!.next = head2
                head2 = head2!.next
            }
            temp = temp!.next
        }
        
        if head1 == nil {
            temp!.next = head2
        } else {
            temp!.next = head1
        }
        
        printCustomList(newHead)
    }
}

//MARK: - 9.Check if given LinkedList has a cycle
extension LinkedList {
    
}


//MARK: - 10.Given a LinkedList with cycle, find start of cycle
extension LinkedList {
    
}

//MARK: - 11. Check if given LinkedList is a palindron
extension LinkedList {
    
}

//MARK: - 12. Find the length of longest odd length palindromic list in the given LinkedList
extension LinkedList {
    
}

