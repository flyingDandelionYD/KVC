//
//  ViewController6.m
//  KVC
//


#import "ViewController6.h"

@interface MyStudentSuperClass:NSObject
@property (nonatomic,strong) NSString *name1;
@end
@implementation MyStudentSuperClass{
@public
    NSString *_name;
    NSString *_isName;
    NSString *name;
    NSString *isName;
}
@end


@interface MyStudentSubClass:MyStudentSuperClass{
//    @public
//    NSString *_name;
//    NSString *_isName;
//    NSString *name;
//    NSString *isName;
}
@end
@implementation MyStudentSubClass
//是否可以直接访问成员变量
+(BOOL)accessInstanceVariablesDirectly{
    return YES;
}

//-(void)setName:(NSString *)name{
//    NSLog(@"%s",__FUNCTION__);
//}

//-(void)_setName:(NSString*)_name{
//    NSLog(@"%s",__FUNCTION__);
//}

//-(void)setIsName:(NSString*)isName{
//    NSLog(@"%s",__FUNCTION__);
//}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"没找到key:%@哟",key);
}
@end
//==============================================


@interface ViewController6 ()
@end

@implementation ViewController6
- (void)viewDidLoad {
    [super viewDidLoad];
    MyStudentSubClass *superC = [[MyStudentSubClass alloc]init];
    

    //KVC设置值
    [superC setValue:@"设置name值" forKey:@"name"];
    
    //setter方法会按照setKey、_setKey、setIsKey的优先级进行调用，还没有
    //(是否可以访问成员属性)，
    //1.可以  则按_key、_isKey、key、isKey查找成员变量 ，找不到 forUndefinedKey
    //2.不可以 则：forUndefinedKey
    NSLog(@"_name%@",superC->_name);
    NSLog(@"_isName%@",superC->_isName);
    NSLog(@"name%@",superC->name);
    NSLog(@"isName%@",superC->isName);
}
@end
