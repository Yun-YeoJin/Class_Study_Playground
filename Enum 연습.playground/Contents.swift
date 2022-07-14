import UIKit

//Enumerations
//타입분류
//도서관 -> 항목 -> 소설, 만화책, 문제집, 패션 등
//분류만 하고 싶을때 + 값

enum BookType {
    case fiction(title: String, price: Int, year: Int)
    case comics(title: String, price: Int, year: Int)
    case workbook(title: String, price: Int, year: Int)
}

var books = [BookType]()

func savebooks(book: BookType) {
    books.append(book)
}

savebooks(book: .comics(title: "aaa", price: 3000, year: 2000))
savebooks(book: .comics(title: "bbb", price: 3000, year: 2000))
savebooks(book: .comics(title: "ccc", price: 3000, year: 2000))
savebooks(book: .fiction(title: "ddd", price: 3000, year: 2000))
savebooks(book: .workbook(title: "eee", price: 3000, year: 2000))
savebooks(book: .workbook(title: "fff", price: 3000, year: 2000))

extension BookType {
    var typeName: String {
        switch self{
        case .comics:
            return "comics"
        case .fiction:
            return "fiction"
        case .workbook:
            return "workbook"

        default:
            ""
            
        }
    }
}
for book in books {
    
    if case let BookType.comics(title , _, _) = book {
        print(title, book.typeName)
    }
}

// -------------------------------------------------------------------------------------

/*
 
 var BookStyle: BookType?

 func savebook(book: BookType) {
    if book == .comics {
        print("코믹쓰")
    } else if book == .fiction {
        print("소설쓰")
    } else if book == .workbook {
        print("워크북쓰")
    }
}
*/

// -------------------------------------------------------------------------------------

/*
  var books = [BookType]()

  func savebooks(book: BookType) {
    books.append(book)
}

    func loadBook(book: BookType) -> [BookType] {
    var tempbooks = [BookType]()
    
    for item in books {
        if item == book {
            tempbooks.append(item)
        }
    }
    return tempbooks
}

savebooks(book: .comics)
savebooks(book: .fiction)
savebooks(book: .workbook)

loadBook(book: .workbook)

*/

// -------------------------------------------------------------------------------------

/*
 var books = [BookType]()

 func savebooks(book: BookType) {
 books.append(book)
 }

 savebooks(book: .comics(title: "aaa", price: 3000, year: 2000))
 savebooks(book: .comics(title: "bbb", price: 3000, year: 2000))
 savebooks(book: .comics(title: "ccc", price: 3000, year: 2000))
 savebooks(book: .fiction(title: "ddd", price: 3000, year: 2000))
 savebooks(book: .workbook(title: "eee", price: 3000, year: 2000))
 savebooks(book: .workbook(title: "fff", price: 3000, year: 2000))

 for book in books {

    if case let BookType.comics(title , _, _) = book {
        print("comics", title, book.typeName)
    }
   }
    switch book {
    case let .comics(_, price, _):
        print(price)
    case let .fiction(title, _, _):
        print(title)
    case let .workbook(_, _, year):
        print(year)

    default:
        break
    }
*/
