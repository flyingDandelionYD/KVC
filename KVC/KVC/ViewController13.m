//
//  ViewController13.m
//  KVC
//

//

#import "ViewController13.h"

@interface Person_13 : NSObject
@property (nonatomic,strong)NSString  *name;
@end

@implementation Person_13
@end


@interface Student_13 : NSObject
@property (nonatomic,strong)Person_13  *p;
@property (nonatomic,strong)NSString  *number;

@property (nonatomic,strong)NSString  *desStr;
@end

@implementation Student_13
-(BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKey:(NSString *)inKey error:(out NSError * _Nullable __autoreleasing *)outError{
    NSLog(@"%s--value:%@,inKey:%@",__FUNCTION__,*ioValue,inKey);
    if([inKey isEqualToString:@"number"]||[inKey isEqualToString:@"p"]){
        [self setValue:@"有值啦A" forKey:@"desStr"];
        return YES;
    }
    *outError = [[NSError alloc]initWithDomain:@"不是p或者number属性" code:0 userInfo:nil];
    return NO;
}
-(BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKeyPath:(NSString *)inKeyPath error:(out NSError * _Nullable __autoreleasing *)outError{
    NSLog(@"%s--value:%@,inKeyPath:%@",__FUNCTION__,*ioValue,inKeyPath);
    if([inKeyPath isEqualToString:@"p.name"]){
        [self setValue:@"有值啦B" forKey:@"desStr"];
        return YES;
    }
    *outError = [[NSError alloc]initWithDomain:@"不是p的name属性" code:0 userInfo:nil];
    return NO;
}
@end


//================================================

@interface ViewController13 ()

@end

@implementation ViewController13

- (void)viewDidLoad {
    [super viewDidLoad];
    Student_13 *stu = [[Student_13 alloc]init];
    
    NSLog(@"=====111======");
    NSError *error = nil;
    NSString *value = @"1";
    [stu validateValue:&value forKey:@"number1" error:&error];
    NSLog(@"error1:%@",error);
    NSLog(@"%@",[stu valueForKey:@"desStr"]);
    
    NSLog(@"=====222======");
    NSString *name = @"jack";
    [stu validateValue:&name forKeyPath:@"p.name" error:&error];
    NSLog(@"error2:%@",error);
    NSLog(@"%@",[stu valueForKey:@"desStr"]);
    
}

/*
 KVC提供一套API使得属性值生效。使得对象有机会接受值、提供默认值、拒绝新值、抛出错误原因。KVC不会自动调用，需要手动调用。默认实现过程：
 1、调用validateValue:forKey:error:
 2、在对象的方法列表中匹配validate<Key>:error:
 3、如果找到则执行并返回结果
 4、如果未找到则返回YES，并赋值
 注意：set方法中禁止调用
 */

@end

