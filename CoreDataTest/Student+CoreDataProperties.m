//
//  Student+CoreDataProperties.m
//  CoreDataTest
//
//  Created by YeYiFeng on 2018/3/29.
//  Copyright © 2018年 叶子. All rights reserved.
//
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic age;
@dynamic sex;
@dynamic name;

@end
