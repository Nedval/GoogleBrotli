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

typedef enum EncoderMode {
    unknown = 0, //BROTLI_MODE_GENERIC
    utf8 = 1, //BROTLI_MODE_TEXT
    woff2 = 2 //BROTLI_MODE_FONT
} EncoderMode;

+ (nullable NSData*) compress:(nonnull NSData*)data;

+ (nullable NSData*) compress:(nonnull NSData*)data mode:(EncoderMode)mode quality:(int)quality;

+ (nullable NSData*) decompress:(nonnull NSData*)data;

@end

#endif /* Brotli_h */
