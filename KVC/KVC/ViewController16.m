//
//  ViewController16.m
//  KVC
//

//

#import "ViewController16.h"

@interface ViewController16 ()
//@property (nonatomic,strong)NSMutableOrderedSet  *orderedSetM;
@end

@implementation ViewController16

////插入单个对象
//-(void)insertObject:(NSString *)object inOrderedSetMAtIndex:(NSUInteger)index{
//     NSLog(@"insertObject");
//}
//插入多个对象
-(void)insertOrderedSetM:(NSArray *)array atIndexes:(NSIndexSet *)indexes{
    NSLog(@"insertOrderedSetM");
}

//替换单个对象
-(void)replaceObjectInOrderedSetMAtIndex:(NSUInteger)index withObject:(id)object{
    NSLog(@"replaceObjectInOrderedSetMAtIndex");
}

//替换多个对象（set）
-(void)replaceOrderedSetMAtIndexes:(NSIndexSet *)indexes withOrderedSetM:(NSArray *)array{
    NSLog(@"replaceOrderedSetMAtIndexes");
}


//移除单个对象
-(void)removeObjectFromOrderedSetMAtIndex:(NSUInteger)index{
    NSLog(@"removeObjectFromOrderedSetMAtIndex");
}
//移除多个对象
-(void)removeOrderedSetMAtIndexes:(NSIndexSet *)indexes{
    NSLog(@"removeOrderedSetMAtIndexes");
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSLog(@"====1111=====");
    [[self mutableOrderedSetValueForKey:@"orderedSetM"] insertObject:@"1" atIndex:0];
    
    NSLog(@"====2222=====");
    [[self mutableOrderedSetValueForKey:@"orderedSetM"] insertObjects:@[@"1",@"2"] atIndexes:[NSIndexSet  indexSetWithIndex:0]];
    
    NSLog(@"====3333=====");
    [[self mutableOrderedSetValueForKey:@"orderedSetM"] replaceObjectAtIndex:0 withObject:@"1"];
    
    NSLog(@"====4444=====");
    [[self mutableOrderedSetValueForKey:@"orderedSetM"] replaceObjectsAtIndexes:[NSIndexSet indexSetWithIndex:0] withObjects:@[@"1",@"2"]];
    
    NSLog(@"====5555=====");
    [[self mutableOrderedSetValueForKey:@"orderedSetM"] removeObjectAtIndex:0];
    
    NSLog(@"====6666=====");
    [[self mutableOrderedSetValueForKey:@"orderedSetM"] removeObjectsAtIndexes:[NSIndexSet  indexSetWithIndex:0]];
}
/*
 mutable有序的集合 需实现
 insertObject:in<Key>AtIndex:  或 insert<Key>:atIndexes:
 removeObjectFrom<Key>AtIndex: 或 remove<Key>AtIndexes:
 replaceObjectIn<Key>AtIndex:withObject: 或 replace<Key>AtIndexes:with<Key>:
 注意：可以实现多个对象的方法，当有对于多个对象的操作（需要实现多个处理的相应的方法）
 */
@end
