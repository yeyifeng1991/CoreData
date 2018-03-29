//
//  Student+CoreDataClass.h
//  CoreDataTest
//
//  Created by YeYiFeng on 2018/3/29.
//  Copyright © 2018年 叶子. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN
#pragma mark - CoreData结构
/*
 一个是NSManagedObjectContext管理的模型部分，管理着所有CoreData的托管对象。里面存储的是一个个的 MO 对象
 
 一个是SQLite实现的本地持久化部分，负责和SQL数据库进行数据交互，主要由NSPersistentStore类操作。
 */
@interface Student : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "Student+CoreDataProperties.h"
