//
//  ViewController5.m
//  KVC
//


//https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueCoding/BasicPrinciples.html#//apple_ref/doc/uid/20002170-BAJEAIEE


#import "ViewController5.h"

@interface CardModel:NSObject
@property (nonatomic,strong)NSString  *cardNumber;
@end
@implementation CardModel
@end

@interface MyPerson:NSObject
@property (nonatomic,strong)NSString  *name;
@end
@implementation MyPerson
@end

@interface BankAccount:NSObject
@property (nonatomic,strong)NSNumber  *currentBalance;
@property (nonatomic,strong)MyPerson  *owner;
@property (nonatomic,strong)NSArray<CardModel* >* cardModels;
@end

@implementation BankAccount
@end
//====================================END=============================================//



@interface ViewController5 ()
@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    //我们分析一个BankAccount实例对象
    //里面有直接属性（Attributes）
    //一对一的 包含另外一个对象的属性（To-one relationships）
    //一对多的 包含另外一个对象的集合的属性（To-many relationships）(“集合”)
    
    CardModel *card1 = [[CardModel alloc]init];
    card1.cardNumber = @"123";
    CardModel *card2 = [[CardModel alloc]init];
    card2.cardNumber = @"123";
    
    MyPerson *p = [[MyPerson alloc]init];
    p.name = @"Jack";
    
    BankAccount *bankAccount = [[BankAccount alloc]init];
    bankAccount.currentBalance = @(0);
    bankAccount.owner = p;
    bankAccount.cardModels = @[card1,card2];
    
    
    //KVC的使用
    [bankAccount setValue:@(100.0) forKey:@"currentBalance"]; //[bankAccount setCurrentBalance:@(100.0)];
    NSLog(@"%@",bankAccount.currentBalance);
    NSLog(@"%@",[bankAccount valueForKey:@"currentBalance"]);
    
    [bankAccount setValue:@"Lucy" forKeyPath:@"owner.name"];
    NSLog(@"%@",bankAccount.owner.name);
    NSLog(@"%@",[bankAccount valueForKeyPath:@"owner.name"]);
    
    MyPerson *p2 = [[MyPerson alloc]init];
    p2.name = @"Kitty";
    NSDictionary *dict =@{
                          @"owner":p2,
                          @"currentBalance":@(1000.0)
                          };
    //该方法只能用于一级（比如owner.name不行的哟）
    [bankAccount setValuesForKeysWithDictionary:dict];
    NSLog(@"%@",bankAccount.currentBalance);
    NSLog(@"%@",bankAccount.owner.name);
    NSLog(@"%@",[bankAccount dictionaryWithValuesForKeys:@[@"owner",@"currentBalance"]]);
   
}

@end
