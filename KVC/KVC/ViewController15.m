//
//  ViewController15.m
//  KVC
//

//


//Using Collection Operators
//https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueCoding/CollectionOperators.html#//apple_ref/doc/uid/20002176-BAJEAIEE
#import "ViewController15.h"
//#import  <objc/runtime.h>


@interface Transaction : NSObject
@property (nonatomic) NSString* payee;   // To whom
@property (nonatomic) NSNumber* amount;  // How much
@property (nonatomic) NSDate* date;      // When
@end

@implementation Transaction
@end
//==========================


@interface ViewController15 ()
@property (nonatomic,strong)NSArray  *transactions;

@end

@implementation ViewController15

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    Transaction *t1 = [[Transaction alloc]init];
    t1.payee = @"Jack";
    t1.amount = @(100);
    t1.date = [formatter dateFromString:@"2018-12-01 01:23:10"];
    
    Transaction *t2 = [[Transaction alloc]init];
    t2.payee = @"Lucy";
    t2.amount = @(200);
    t2.date = [formatter dateFromString:@"2018-09-10 01:20:00"];
    
    Transaction *t3 = [[Transaction alloc]init];
    t3.payee = @"Lucy";
    t3.amount = @(300);
    t3.date = [formatter dateFromString:@"2018-10-10 09:20:00"];
    
    self.transactions = @[t1,t2,t3];
    
    //集合操作符（例子）
    //格式：keyPathToCollection.@collectionOperator.keypathTpProperty
    //集合的keypath.操作符.要操作的属性
    
    
    //1.Aggregation Operators(聚合运算符)
    NSNumber *transactionAverage = [self valueForKeyPath:@"transactions.@avg.amount"];
    NSLog(@"平均消费:%@",transactionAverage);//平均消费:200

    NSNumber *numberOfTransactions = [self.transactions valueForKeyPath:@"@count"];
    NSLog(@"消费者个数:%@",numberOfTransactions);//消费者个数:3
    
    
    NSDate *latestDate = [self.transactions valueForKeyPath:@"@max.date"];
    NSLog(@"最近消费的时间:%@",latestDate);//最近消费的时间:2018-11-30 17:23:10 +0000
    
    
    NSDate *earliestDate = [self.transactions valueForKeyPath:@"@min.date"];
    NSLog(@"最早消费的时间:%@",earliestDate);//最早消费的时间:2018-09-09 17:20:00 +0000
    
    NSNumber *amountSum = [self.transactions valueForKeyPath:@"@sum.amount"];
    NSLog(@"消费的总和:%@",amountSum);//消费的总和:600
    
    //2.Array Operators（集合操作符）
    //@distinctUnionOfObjects(返回操作对象内部的不同对象，返回值为数组)
    NSArray *distinctPayees = [self.transactions valueForKeyPath:@"@distinctUnionOfObjects.payee"];
    NSLog(@"消费者是：%@",distinctPayees);
    
    
    //@unionOfObjects（返回操作对象内部的所有对象）
    NSArray *payees = [self.transactions valueForKeyPath:@"@unionOfObjects.payee"];
    NSLog(@"所有消费记录上的消费者（或许有重复的）:%@",payees);
    
    
    //3.Nesting Operators(嵌套操作符)
    Transaction *t4 = [[Transaction alloc]init];
    t4.payee = @"Jack";
    t4.amount = @(1000);
    t4.date = [formatter dateFromString:@"2019-12-01 01:23:10"];
    NSArray* moreTransactions = @[t4];
    NSArray* arrayOfArrays = @[self.transactions, moreTransactions,self.transactions];
    
    //@distinctUnionOfArrays(返回操作对象（且操作对象内对象必须是数组/集合）中数组/集合的不同对象，返回值为数组->去重)
    NSArray *collectedDistinctPayees = [arrayOfArrays valueForKeyPath:@"@distinctUnionOfArrays.payee"];
    NSLog(@"消费者(去重):%@",collectedDistinctPayees);
    
    //@unionOfArrays（返回操作对象（且操作对象内对象必须是数组/集合）中数组/集合的所有对象，返回值为数组）
    NSArray *collectedPayees = [arrayOfArrays valueForKeyPath:@"@unionOfArrays.payee"];
    NSLog(@"所有消费记录上的消费者数组（或许有重复的)%@",collectedPayees);
    
    
    NSSet *setA = [NSSet setWithObjects:t1, t2, nil];
    NSSet *setB = [NSSet setWithObjects:t3, t4, nil];
    NSSet *set = [NSSet setWithObjects:setA, setB, nil];
    //@distinctUnionOfSets(返回操作对象（且操作对象内对象必须是数组/集合）中数组/集合的所有对象，返回值为集合)
    NSSet *payeesSet = [set valueForKeyPath:@"@distinctUnionOfSets.payee"];
    NSLog(@"所有消费记录上的消费者集合（没有重复的)%@",payeesSet);
    
}

@end

