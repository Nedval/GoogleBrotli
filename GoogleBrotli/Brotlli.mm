//
//  Brotli.m
//  Brotli
//
//  Created by Jrting on 5/15/16.
//  Copyright © 2016 Modern Wizard Studio. All rights reserved.
//

#include "decode.h"
#include "encode.h"
#include "streams.h"

#import <Foundation/Foundation.h>
#import "Brotli.h"

@implementation Brotli : NSObject

+ (NSData*) compress:(NSData*)data {

    return [Brotli compress:data mode:unknown quality:BROTLI_DEFAULT_QUALITY];

}

+ (NSData*) compress:(NSData*)data mode:(EncoderMode)mode quality:(int)quality {

    size_t input_size = data.length;

    uint8_t* input_buffer = (uint8_t*)data.bytes;

    size_t encoded_size = 0;

    uint8_t* encoded_buffer = (uint8_t*)malloc(input_size * sizeof(uint8_t));
    
    BrotliEncoderMode brotli_encoder_mode;
    
    switch (mode) {
        case unknown:
            brotli_encoder_mode = BROTLI_MODE_GENERIC;
            break;
        case utf8:
            brotli_encoder_mode = BROTLI_MODE_TEXT;
        case woff2:
            brotli_encoder_mode = BROTLI_MODE_FONT;
            break;
    }
    
    if ( !BrotliEncoderCompress(quality, BROTLI_DEFAULT_WINDOW, brotli_encoder_mode, input_size, input_buffer, &encoded_size, encoded_buffer) ) {

        return nil;

    }

    NSData* compressed_data = [NSData dataWithBytes:encoded_buffer length:encoded_size];

    free(encoded_buffer);

    return compressed_data;
    
}

+ (NSData*) decompress:(NSData*)data {

    size_t encoded_size = data.length;

    uint8_t* encoded_buffer = (uint8_t*)data.bytes;

    size_t decoded_size = 0;

    if ( !BrotliDecompressedSize(encoded_size, encoded_buffer, &decoded_size) ) {

        return nil;

    }

    uint8_t* decoded_buffer = (uint8_t*)malloc(decoded_size * sizeof(uint8_t));

    if ( !BrotliDecompressBuffer(encoded_size, encoded_buffer, &decoded_size, decoded_buffer) ) {

        return nil;

    }

    NSData* decompressed_data = [NSData dataWithBytes:decoded_buffer length:decoded_size];

    free(decoded_buffer);

    return decompressed_data;
    
}

@end
