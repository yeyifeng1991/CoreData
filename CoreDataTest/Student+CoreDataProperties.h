//
//  Student+CoreDataProperties.h
//  CoreDataTest
//
//  Created by YeYiFeng on 2018/3/29.
//  Copyright © 2018年 叶子. All rights reserved.
//
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nonatomic) int16_t age;
@property (nonatomic) BOOL sex;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
