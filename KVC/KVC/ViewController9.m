//
//  ViewController9.m
//  KVC
//


#import "ViewController9.h"


@interface Person_9 : NSObject
//@property (nonatomic,strong)NSSet  *namesSet;
@end

@implementation Person_9
/**
 返回set的个数
 */
-(NSUInteger)countOfNamesSet{
    NSLog(@"countOfNamesSet");
    return 5;
}

/**
 是否包含对象
 */
-(NSString *)memberOfNamesSet:(NSString *)object{
    NSLog(@"memberOfNamesSet");
    return object;
}

/**
 返回 遍历器
 */
-(NSEnumerator *)enumeratorOfNamesSet{
    NSLog(@"enumeratorOfNamesSet");
    return [[[NSSet alloc]init]  objectEnumerator];
}
@end
//====================

@interface ViewController9 ()

@end

@implementation ViewController9

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person_9  *p = [[Person_9 alloc]init];
    
    NSLog(@"=======111========");
    NSLog(@"%lu",[[p valueForKey:@"namesSet"] count]);//调用countOfNamesSet
    
    NSLog(@"=======222========");
    NSLog(@"%@",[[p valueForKey:@"namesSet"] member:@"AAA"]);//调用memberOfNamesSet
    
    NSLog(@"=======333========");
    NSLog(@"%d",[[p valueForKey:@"namesSet"] containsObject:@"BBB"]);//调用memberOfNamesSet
    
    NSLog(@"=======444========");//调用enumeratorOfNamesSet
    [[p valueForKey:@"namesSet"] objectEnumerator];
    
    NSLog(@"=======555========");
    
}

/*
 无序访问器： 针对 NSSet样的无序集合
 getter无序访问器其实现如下：
    - countOf<Key>
    - enumeratorOf<Key>
    - memberOf<Key>:
 */
@end
