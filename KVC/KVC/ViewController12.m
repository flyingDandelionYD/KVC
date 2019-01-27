//
//  ViewController12.m
//  KVC
//

//

#import "ViewController12.h"
@interface Person_12 : NSObject
@end

@implementation Person_12
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"name"]){
        NSLog(@"setValue-forUndefinedKey--key:%@",key);
    }
}
-(id)valueForUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"name"]){
        NSLog(@"valueForUndefinedKey--key:%@",key);
        return nil;
    }
    return @"1";
}
@end


@interface Student_12 : NSObject
@property (nonatomic,strong)Person_12  *p;
@property (nonatomic,assign)NSInteger  age;
@end

@implementation Student_12
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"name"]){
        NSLog(@"setValue-forUndefinedKey--key:%@",key);
    }
}
-(id)valueForUndefinedKey:(NSString *)key{
    if([key isEqualToString:@"name"]){
        NSLog(@"valueForUndefinedKey--key:%@",key);
        return nil;
    }
    return @"1";
}

-(void)setNilValueForKey:(NSString *)key{
    if([key isEqualToString:@"age"]){
        NSLog(@"setNilValueForKey--key:%@",key);
        [self setValue:@(18) forKey:@"age"];
    }else{
        [super setNilValueForKey:key];
    }
}
@end


@interface ViewController12 ()

@end

@implementation ViewController12

- (void)viewDidLoad {
    [super viewDidLoad];
    Student_12 *stu = [[Student_12 alloc]init];
    
    NSLog(@"======111========");
    [stu setValue:@"1" forKey:@"name"];//setValue-forUndefinedKey--key:name
    
    NSLog(@"======222========");
    [stu valueForKey:@"name"];//valueForUndefinedKey--key:name
  
    
    NSLog(@"======333========");
    [stu setValue:@"2" forKeyPath:@"p.name"];//发现它只会 拦截stu里面是否有p属性 对于之后的 米有触发
    
    NSLog(@"======444========");
    [stu valueForKeyPath:@"p.name"];//发现它只会 拦截stu里面是否有p属性 对于之后的 米有触发
    
    NSLog(@"=======555=======");
    [stu setValue:nil forKey:@"age"];//有key，但是 给非对象的属性  设置nil时
    
}

/*
 方法setValue:forKey:寻找不到指定Key或者KeyPath匹配的方法或变量名称会自动调用setValue:forUndefinedKey: 抛出NSUndefinedKeyException异常
 方法valueForKey:寻找不到指定Key或者KeyPath匹配的方法或变量名称会自动调用valueForUndefinedKey: 抛出NSUndefinedKeyException异常
 对非对象类型的属性设置nil空值，底层调用setNilValueForKey:，然后抛出NSInvalidArgumentException异常
 */
@end
