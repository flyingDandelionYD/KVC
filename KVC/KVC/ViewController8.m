//
//  ViewController8.m
//  KVC
//


#import "ViewController8.h"

@interface Person_8 : NSObject
@property (nonatomic,strong)NSString  *name;
@end

@implementation Person_8
@end

@interface Students_8 : NSObject
//@property (nonatomic,strong)NSArray<Person_8*> *personArr;
@end

@implementation Students_8
/**
 返回数组的个数
 */
-(NSInteger)countOfPersonArr{
    NSLog(@"countOfPersonArr");
    return  5;
}


/**
 传入需要取的 indexes下标，返回一个数组
 */
-(NSArray *)personArrAtIndexes:(NSIndexSet *)indexes{
    NSLog(@"personArrAtIndexes---");
    return @[@"a",@"b",@"c",@"d",@"e"];
}


/**
 传入一个 index 返回数组内的 index下标对应的值
 */
-(id)objectInPersonArrAtIndex:(NSUInteger)index{
    NSLog(@"objectInPersonArrAtIndex");
    return @"*_*";
}

-(void)getPersonArr:(Person_8 **)buffer range:(NSRange)inRange{
    NSLog(@"getPersonArr-buffer-inRange");
}
@end
//===================================

@interface ViewController8 ()

@end

@implementation ViewController8

- (void)viewDidLoad {
    [super viewDidLoad];
    Students_8 *stu = [Students_8 new];
    
    //调用了countOfPersonArr、getPersonArr-buffer-inRange
    NSLog(@"%@",[stu valueForKey:@"personArr"]);
    NSLog(@"=========11111========");
    
    //调用了countOfPersonArr
    NSLog(@"%lu",[[stu  valueForKey:@"personArr"] count]);
    NSLog(@"=========22222========");
    
    //调用了objectInPersonArrAtIndex
    NSLog(@"%@",[[stu  valueForKey:@"personArr"] objectAtIndex:0]);
    NSLog(@"=========33333========");
    
    //调用personArrAtIndexes
    NSLog(@"%@",[[stu  valueForKey:@"personArr"] objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)]]);
    NSLog(@"=========44444========");
   
}

/*
 * 索引访问器(index accessor)  针对NSArray这样的有序集合
 * getter索引访问器:(需实现的方法)
    - countOf<Key>
    - objectIn<Key>AtIndex: 或者 -<Key>AtIndexes:
    - get<Key>:range:
 */
@end
