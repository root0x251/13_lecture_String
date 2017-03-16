//
//  AppDelegate.m
//  14_lecture_String
//
//  Created by Slava on 16.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString *string1 = @"Hello ";
    NSString *string2 = @"World";
    
    NSArray *array = [[NSArray alloc] initWithObjects:string1, string2, nil];
    
    for (NSString *obj in array) {
        if ([obj isEqualToString:@"string 2"]) {
//            NSLog(@"index = %d", [array indexOfObject:obj]);
        }
    }
    
    
    
    
    // объединение строк
    NSString *string3 = [string1 stringByAppendingString:string2];
    NSLog(@"%@ = %@%@", string3, string1, string2);
    
    
    
    
    
    // поиск в строке
    NSString *stringSearch = @"Hello World world";
    NSRange range = [stringSearch rangeOfString:@"World" options:NSCaseInsensitiveSearch | NSBackwardsSearch];
//    NSCaseInsensitiveSearch - не чувствителен к CamelCase
//    NSBackwardsSearch       - поиск с конца

    if (range.location != NSNotFound) {
//        NSLog(@"%@", NSStringFromRange(range));
    } else {
//        NSLog(@"not found");
    }
    
    
    
    NSString *text = @"I’ve contributed code to a number of projects, often as a drive-by bug fix in a GitHub pull request. And, usually, I’ll try to do as the Romans do and follow the local naming and coding conventions. But, sometimes, I’ll fall back to my personal conventions and get dinged in the code review. For what it’s worth, those personal conventions look something like this:variable_names_in_snake_case : Variable, a mutable thing. All lower case, words separated by underscores. CONSTANTS_IN_ALL_CAPS : Constant, an immutable thing. All upper case, words separated by underscores. functionAndMethodNames : Functions and methods, immutable and callable things. Mixed camel case, first letter always lower case. StructAndClassNames : Structs and classes, immutable and instantiatable things. Mixed camel case, first letter always upper case. Of course, given the features of any particular language, these rules yield subtleties. For instance, in JavaScript a variable can be assigned a callable thing, a declared function can be replaced by assignment, and classes & methods are themselves mainly just suggestions. These conventions are more about my intentions than anything literally baked into syntax. I’ve been using some variant of the above rules for close to 20 years, across probably a dozen languages. On JavaScript projects, I end up with snake_case in undesirable places. On Python projects, I’ll use CamelCase where it’s not wanted. On the Python side, I know there’s PEP 8. That’s something to point at and claim uniformity, and it has tooling support. On the JavaScript side, I seem to be missing some recent consensus amongst the current wave of browser and nodejs enthusiasts. That, or I’m just contributing to more projects than my own these days (thanks to GitHub) and only running into this now. But, here’s what always leaves me mildly rankled: Why just one or the other? Why discard the semantic shading available through mixing snake_case and CamelCase, at least by way of consistent rules? I know there’s a such thing as syntax highlighting, but combining that with these conventions has often helped me with highlighting is unavailable. Belt and suspenders, and all that. Of course, I prefer my rules, because they’re a deeply ingrained habit. I know this is my peeve. But, what I’ve never quite been able to get is a satisfying answer as to why one style is preferred to the exclusion of another. Usually I get responses like “That’s just the way it’s done”, or “The other way is ugly”. So, it’s down to personal whim, project momentum, or cargo cult.";
    
//    text = [text substringToIndex:15];  // вырезать до индекса 15
//    text = [text substringFromIndex:15];  // вырезать c индекса 15
//    text = [text substringWithRange:NSMakeRange(11, 22)];  // вырезать c (location = 11) длиной в (длина range = 18)
//    NSLog(@"%@", text);
    
    
    
    
    
    
    
    // ПОИСК ПО ФРАЗЕ
//    NSRange range2 = [text rangeOfString:@"On the Python side"];
//    if (range2.location != NSNotFound) {
//        text = [text substringToIndex:range2.location];
//        NSLog(@"%@", text);
//    } else {
//        NSLog(@"not found");
//    }
    
    
    
    
    
    
    // ПОДСЧЕТ ОДИНАКОВЫХ СЛОВ
    NSRange searchRange = NSMakeRange(0, [text length]); // длина искомого слова от нуля и до длены текста
    NSInteger count = 0;
    while (YES) {
        NSRange rangeString = [text rangeOfString:@"Python" options:0 range:searchRange];
        if (rangeString.location != NSNotFound) {
            NSInteger index = rangeString.location + rangeString.length;    // делаем поиск за искомым слово
            searchRange.location = index;
            searchRange.length = [text length] - index;
            count++;
//            NSLog(@"%@", NSStringFromRange(rangeString));   // координаты
        } else {
            break;
        }
    }
//    NSLog(@"%d", count);

    
    
    // ЗАМЕНА СЛОВ
    text = [text stringByReplacingOccurrencesOfString:@"Python" withString:@"OBJECTIVE - C"];
//    NSLog(@"%@", text);
    
    text = [text uppercaseString];  // весь текст заглывными буквами
    text = [text lowercaseString];  // прописные быуквы
    text = [text capitalizedString];    // каждое слово с заглавное буквы
    
    
    
    
    
    
    NSLog(@"%d", [@"987654" integerValue]); // ПРИ СОХРАНЕНИИ ЦИФР В СТРОКЕ
    
    
    
    
    
    
    
    text = [text stringByReplacingOccurrencesOfString:@"." withString:@""];    // замена символа на пробел
    text = [text stringByReplacingOccurrencesOfString:@"," withString:@""];    // замена символа на
    NSArray *array2 = [text componentsSeparatedByString:@" "];    // массив из текста, который разделен пробелом
//    NSLog(@"%@", array2);
    
    
    
    
    text = [array2 componentsJoinedByString:@"+_+"];
//    NSLog(@"%@", text);
    
    
    
    
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
