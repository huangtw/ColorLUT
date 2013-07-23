//
//  ColorLUTViewController.m
//  ColorLUT
//
//  Created by d71941 on 6/19/13.
//  Copyright (c) 2013 huangtw. All rights reserved.
//

#import "ColorLUTViewController.h"
#import "CIFilter+ColorLUT.h"

@interface ColorLUTViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imageView1;
@property (nonatomic, weak) IBOutlet UIImageView *imageView2;
@end

@implementation ColorLUTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImage *image = [UIImage imageNamed:@"sunflower.jpg"];
    
    CIFilter *colorCube = [CIFilter colorCubeWithColrLUTImageNamed:@"colorLUTProcessed.png" dimension:64];
    CIImage *inputImage = [[CIImage alloc] initWithImage: image];
    [colorCube setValue:inputImage forKey:@"inputImage"];
    CIImage *outputImage = [colorCube outputImage];

    CIContext *context = [CIContext contextWithOptions:[NSDictionary dictionaryWithObject:(__bridge id)(CGColorSpaceCreateDeviceRGB()) forKey:kCIContextWorkingColorSpace]];
    UIImage *newImage = [UIImage imageWithCGImage:[context createCGImage:outputImage fromRect:outputImage.extent]];


    [self.imageView1 setImage:image];
    [self.imageView2 setImage:newImage];
}

@end
