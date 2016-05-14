//
//  Brotli.h
//  GoogleBrotli
//
//  Created by Jrting on 5/15/16.
//  Copyright © 2016 Modern Wizard Studio. All rights reserved.
//

#ifndef Brotli_h
#define Brotli_h

@interface Brotli : NSObject

+ (nullable NSData*) compress:(nonnull NSData*)data;

+ (nullable NSData*) compress:(nonnull NSData*)data quality:(NSUInteger)quality;

+ (nullable NSData*) decompress:(nonnull NSData*)data;

@end

#endif /* Brotli_h */
