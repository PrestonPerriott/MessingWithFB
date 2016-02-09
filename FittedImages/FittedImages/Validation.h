//
//  Validation.h
//  FittedImages
//
//  Created by Preston Perriott on 12/15/15.
//  Copyright © 2015 Preston Perriott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validation : NSObject{
    
    
}

- (BOOL)emailRegEx: (NSString *) string;
- (BOOL)passwordMinLength: (NSInteger *)length password:(NSString *)string;

@end
