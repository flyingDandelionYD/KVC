//
//  ViewController10.m
//  KVC
//


#import "ViewController10.h"


@interface Person_10 : NSObject
//@property (nonatomic,strong)NSMutableArray  *namesArrM;
@end

@implementation Person_10
//--------------------------
//插入一个数组对象
-(void)insertNamesArrM:(NSArray *)array atIndexes:(NSIndexSet *)indexes{
    NSLog(@"insertNamesArrM");
}

//插入一个对象
-(void)insertObject:(NSString *)object inNamesArrMAtIndex:(NSUInteger)index{
    NSLog(@"insertObject");
}

//移除一个数组
-(void)removeNamesArrMAtIndexes:(NSIndexSet *)indexes{
    NSLog(@"removeNamesArrMAtIndexes");
}

//移除一个对象
-(void)removeObjectFromNamesArrMAtIndex:(NSUInteger)index{
    NSLog(@"removeObjectFromNamesArrMAtIndex");
}

//根据下标，替换数组
-(void)replaceNamesArrMAtIndexes:(NSIndexSet *)indexes withNamesArrM:(NSArray *)array{
    NSLog(@"replaceNamesArrMAtIndexes");
}

//根据下标替换一个对象
-(void)replaceObjectInNamesArrMAtIndex:(NSUInteger)index withObject:(id)object{
    NSLog(@"replaceObjectInNamesArrMAtIndex");
}
@end
//====================================================


@interface ViewController10 ()

@end

@implementation ViewController10

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person_10  *p = [[Person_10 alloc]init];
    NSLog(@"======111=====");
    //会调用：insertObject
    [[p mutableArrayValueForKey:@"namesArrM"] insertObject:@"1" atIndex:0];
    
    NSLog(@"======222=====");
    //会调用：insertNamesArrM
    [[p mutableArrayValueForKey:@"namesArrM"] insertObjects:@[@"q",@"w"] atIndexes:[NSIndexSet indexSetWithIndex:0]];
    
    NSLog(@"======333=====");
    //会调用：removeNamesArrMAtIndexes
    [[p mutableArrayValueForKey:@"namesArrM"] removeObjectsAtIndexes:[NSIndexSet indexSetWithIndex:0]];
    
    NSLog(@"======444=====");
    //会调用：removeObjectFromNamesArrMAtIndex
    [[p mutableArrayValueForKey:@"namesArrM"] removeObjectAtIndex:0];
    
    
    NSLog(@"======555=====");
    //会调用：replaceObjectInNamesArrMAtIndex
    [[p mutableArrayValueForKey:@"namesArrM"] replaceObjectAtIndex:0 withObject:@"1"];
    
    
    NSLog(@"======666=====");
    //会调用 ：replaceNamesArrMAtIndexes
    [[p mutableArrayValueForKey:@"namesArrM"] replaceObjectsAtIndexes:[NSIndexSet indexSetWithIndex:0] withObjects:@[@"1",@"2"]];
}

/*
 mutable有序索引访问器:  需实现
 -insertObject:in<Key>AtIndex:或者-insert<Key>:atIndexes:
 -removeObjectFrom<Key>AtIndex:或者-remove<Key>AtIndexes:
 -replaceObjectIn<Key>AtIndex:withObject:或者-replace<Key>AtIndexes:with<Key>:
 */
@end
