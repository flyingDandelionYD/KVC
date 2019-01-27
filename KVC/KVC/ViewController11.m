//
//  ViewController11.m
//  KVC
//

//

#import "ViewController11.h"

@interface Person_11 : NSObject
//@property (nonatomic,strong)NSMutableSet  *namesSetM;
@end

@implementation Person_11
//添加多个对象、并集
-(void)addNamesSetM:(NSSet *)objects{
    NSLog(@"addNamesSetM");
}

//添加单个对象
-(void)addNamesSetMObject:(NSString *)object{
    NSLog(@"addNamesSetMObject");
}

//移除多个对象
-(void)removeNamesSetM:(NSSet *)objects{
    NSLog(@"removeNamesSetM");
}
//移除单个对象
-(void)removeNamesSetMObject:(NSString *)object{
    NSLog(@"removeNamesSetMObject");
}

//交集
-(void)intersectNamesSetM:(NSSet *)objects{
    NSLog(@"intersectNamesSetM");
}
@end


@interface ViewController11 ()

@end

@implementation ViewController11

- (void)viewDidLoad {
    [super viewDidLoad];
    Person_11 *p = [[Person_11 alloc]init];
    
    NSLog(@"=====1111======");
    //调用：addNamesSetMObject
    [[p mutableSetValueForKey:@"namesSetM"] addObject:@"111"];
    
    NSLog(@"=====2222======");
    //调用：addNamesSetM
    [[p mutableSetValueForKey:@"namesSetM"] unionSet:[NSSet setWithObjects:@"1",@"2",nil]];//并集

    NSLog(@"=====3333======");
    //调用：removeNamesSetMObject
    [[p mutableSetValueForKey:@"namesSetM"] removeObject:@"1"];
    
    NSLog(@"=====4444======");
    //调用：removeNamesSetM
    [[p mutableSetValueForKey:@"namesSetM"] minusSet:[NSSet setWithObjects:@"1", nil]];//删除前者中与后者相同的元素
    
    NSLog(@"=====5555======");
    //调用：intersectNamesSetM
    [[p mutableSetValueForKey:@"namesSetM"] intersectSet:[NSSet setWithObjects:@"1",@"2",nil]]; //交集
    
}

/*
 mutable无序访问器实现如下方法：
 - add<Key>Object:或者-add<Key>:
 - remove<Key>Object:或者-remove<Key>:
 - intersect<Key>:
 */
@end
