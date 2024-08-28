data BookInfo = Book Int String [String] 
                deriving (Show)

data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

type CustomerID = Int
type ReviewBody = String

data BookReview = BookReview BookInfo CustomerID ReviewBody

type BookRecord = (BookInfo, BookReview)

type CardNumber = String
type CardHolder = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
                    | CashOnDelivery
                    | Invoice CustomerID
                    deriving (Show)
myInfo = Book 12345 "Some Book" ["Author 1", "Author 2"]