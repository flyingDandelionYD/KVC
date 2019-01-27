//
//  ViewController14.m
//  KVC
//

//

#import "ViewController14.h"

@interface ViewController14 ()
@property (nonatomic,assign)NSInteger  age;
@property (nonatomic,assign)BOOL sex;
@property (nonatomic,assign)CGRect  frame;
@end

@implementation ViewController14

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSNumber对应的基本数据类型(如)
    [self setValue:@"18" forKey:@"age"];
    NSLog(@"%@",[[self valueForKey:@"age"] class]);//__NSCFNumber
    
    [self setValue:@"0" forKey:@"sex"];
    NSLog(@"%@",[[self valueForKey:@"sex"] class]);//__NSCFBoolean
    
    
    //NSValue对应的结构体类型（如）
    NSValue *value = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
    [self setValue:value forKey:@"frame"];
    NSLog(@"%@",[[self valueForKey:@"frame"] class]);//NSConcreteValue
}

/*
 KVC对于基本数据类型和结构体在底层支持自动数据类型转换。根据相对的存取方法或者实例变量判端实际需要的值类型，选择NSNumber 或 NSValue 进行自动转换
 */

@end
