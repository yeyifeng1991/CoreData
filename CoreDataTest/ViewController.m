//
//  ViewController.m
//  CoreDataTest
//
//  Created by YeYiFeng on 2018/3/29.
//  Copyright © 2018年 叶子. All rights reserved.
//

#import "ViewController.h"
#import "Student+CoreDataClass.h"
#import "Student+CoreDataProperties.h"
#import "AppDelegate.h"
@interface ViewController ()
{
    AppDelegate * appDelegate;
}
@end

// 全局搜索CoreData结构，查询CoreData主要结构备注
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate; // 拿到AppDelegate
}
#pragma mark - 增加数据
- (IBAction)addData:(id)sender {
#pragma mark - CoreData结构 NSEntityDescription
    /*
     NSEntityDescription(实体描述):该对象代表了关于某个实体的描述信息，从某种程度来说，该对象相当于实体的抽象。实体描述定义了该实体的名字、实体的实现类，并用一个集合定义了该实体包含的所有属性。
     */
    //persistentContainer.viewContext等属性在我们创建NSManagedObject的时候会在AppDelegate中自动创建
    //1. 实例化
    Student *stu = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:appDelegate.persistentContainer.viewContext];
    //2.属性赋值
    stu.name = [NSString stringWithFormat:@"学生%d",arc4random()%5];
    stu.age = arc4random()%30;
    stu.sex = arc4random()%2 ==0?YES:NO;
    NSLog(@"增加了一个学生 名字是:%@ 性别是:%@ 年龄是:%hd",stu.name,stu.sex == YES ? @"男":@"女",stu.age);
    // 3.保存数据
    [appDelegate saveContext];
}
#pragma mark - 删除数据
- (IBAction)delData:(id)sender {
    
    // 1.读取实体
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:appDelegate.persistentContainer.viewContext];
    // 2. 创建查询请求
    NSFetchRequest * request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    // 3. 创建操作条件
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"sex=0"];
    [request setPredicate:predicate];
    // 4. 获取结果
    NSArray * resultArray = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:nil];
    // 5. 开始操作
    if (resultArray.count>0) {
        for (Student * stu in resultArray) {
            // 删除实体
            [appDelegate.persistentContainer.viewContext deleteObject:stu];
        }
        // 数据库操作之后需保存
        [appDelegate saveContext];
        NSLog(@"删除了学生中的女同学");
    }
    else
    {
        NSLog(@"没有符合的条件");
    }
    
}
#pragma mark - 编辑数据
- (IBAction)editData:(id)sender {
    
    //1.读取所有学生的实体
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student"
                                              inManagedObjectContext:appDelegate.persistentContainer.viewContext];
    //2.创建请求
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    //3.创建条件 年龄 < 10 的学生
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age<10"];
    [request setPredicate:predicate];
    
    ///获取符合条件的结果
    NSArray *resultArray = [appDelegate.persistentContainer.viewContext executeFetchRequest:request
                                                                                      error:nil];
    // 4. 操作
    if (resultArray.count>0) {
        for (Student *stu in resultArray) {
            ///把年龄 + 10岁
            stu.age = stu.age + 10;
            ///并且把名字添加一个修
            stu.name = [NSString stringWithFormat:@"%@修",stu.name];
        }
        ///保存结果并且打印
        [appDelegate saveContext];
        NSLog(@"修改学生信息完成");
    }else{
        NSLog(@"没有符合条件的结果");
    }
    
}
#pragma mark - 查询数据
- (IBAction)selectData:(id)sender {
    
    // 1.读取类
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:appDelegate.persistentContainer.viewContext];
#pragma mark - CoreData结构  NSFetchRequest
    /*
     抓取请求NSFetchRequest：该对象封装了查询实体的请求，包括程序需要查询哪些实体、查询条件、排序规则等。抓取请求定义了本次查询的实体的名字、抓取请求的查询条件，通过NSPredicate来表示，并用一个NSArray集合定义了所有的排序规则。
     */
    // 2.创建查询请求
    NSFetchRequest * request = [[NSFetchRequest alloc]init];
    // 3.设置请求的实体
    [request setEntity:entity];
    // 3.1 设置查询条件
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"sex=0"];
    [request setPredicate:predicate];
    // 4.获取查询结果
    NSArray * resultArray = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:nil];
    // 打印查询结果
    for (Student *stu in resultArray) {
        NSLog(@"查询到一个学生 名字是:%@ 性别是:%@ 年龄是:%hd",stu.name,stu.sex == YES ? @"男":@"女",stu.age);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
