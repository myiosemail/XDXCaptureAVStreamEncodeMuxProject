//
//  ViewController.m
//  XDXCaptureAVStreamEncodeMuxProject
//
//  Created by 小东邪 on 2019/7/7.
//  Copyright © 2019 小东邪. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "XDXCameraModel.h"
#import "XDXCameraHandler.h"
#import "XDXAudioCaptureManager.h"

@interface ViewController ()<XDXCameraHandlerDelegate, XDXAudioCaptureDelegate>

@property (nonatomic, strong) XDXCameraHandler              *cameraCaptureHandler;
@property (nonatomic, strong) XDXAudioCaptureManager        *audioCaptureHandler;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureCamera];
    [self configureAudioCapture];
}

- (void)configureCamera {
    XDXCameraModel *model = [[XDXCameraModel alloc] initWithPreviewView:self.view
                                                                 preset:AVCaptureSessionPreset1280x720
                                                              frameRate:30
                                                       resolutionHeight:720
                                                            videoFormat:kCVPixelFormatType_420YpCbCr8BiPlanarFullRange
                                                              torchMode:AVCaptureTorchModeOff
                                                              focusMode:AVCaptureFocusModeContinuousAutoFocus
                                                           exposureMode:AVCaptureExposureModeContinuousAutoExposure
                                                              flashMode:AVCaptureFlashModeAuto
                                                       whiteBalanceMode:AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance
                                                               position:AVCaptureDevicePositionBack
                                                           videoGravity:AVLayerVideoGravityResizeAspect
                                                       videoOrientation:AVCaptureVideoOrientationLandscapeRight
                                             isEnableVideoStabilization:YES];
    
    XDXCameraHandler *handler   = [[XDXCameraHandler alloc] init];
    self.cameraCaptureHandler   = handler;
    handler.delegate            = self;
    [handler configureCameraWithModel:model];
    [handler startRunning];
}

- (void)configureAudioCapture {
    XDXAudioCaptureManager *handler = [XDXAudioCaptureManager getInstance];
    handler.delegate = self;
    [handler startAudioCapture];
    self.audioCaptureHandler = handler;
}

#pragma mark - Delegate

#pragma mark Camera Capture
- (void)xdxCaptureOutput:(AVCaptureOutput *)output didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
}

- (void)xdxCaptureOutput:(AVCaptureOutput *)output didDropSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    
}

#pragma mark Audio Capture
- (void)receiveAudioDataByDevice:(XDXCaptureAudioDataRef)audioDataRef {
    
}

@end
