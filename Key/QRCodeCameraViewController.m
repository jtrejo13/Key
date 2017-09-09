//
//  ViewController.m
//  Key
//
//  Created by Juan Trejo on 8/28/17.
//  Copyright © 2017 Key. All rights reserved.
//

#import "QRCodeCameraViewController.h"

@interface QRCodeCameraViewController ()
@property (nonatomic) BOOL isReading;

@property UIView *viewScanner;
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

- (BOOL)startReading;
- (void)stopReading;
- (void)loadBeepSound;

@end

@implementation QRCodeCameraViewController


- (void)viewWillDisappear:(BOOL)animated
{
    _isReading = NO;
    [self startStopReading];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    _isReading = YES;
    _captureSession = nil;
    
    //Adding camera view
    _viewScanner = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _viewScanner.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_viewScanner];
    
    [self startStopReading];
    [self loadBeepSound];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startStopReading
{
    if (!_isReading) {
        if ([self startReading]) {
            NSLog(@"Successfully started reading");
        }
    }
    else{
        [self stopReading];
    }
    
    _isReading = !_isReading;
}

- (BOOL)startReading
{
    NSError *error;
    
    //Setting caputure device to video
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    
    if (!input) {
        NSLog(@"No capture device input");
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    
    _captureSession = [[AVCaptureSession alloc] init];
    [_captureSession addInput:input];
    
    AVCaptureMetadataOutput *metaDataOutput = [[AVCaptureMetadataOutput alloc] init];
    [_captureSession addOutput:metaDataOutput];
    
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("My Queue", NULL);
    [metaDataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [metaDataOutput setMetadataObjectTypes:[NSArray arrayWithObject: AVMetadataObjectTypeQRCode]];
    
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    [_videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_videoPreviewLayer setFrame:[_viewScanner bounds]];
    [_viewScanner.layer addSublayer:_videoPreviewLayer];
    
    [_captureSession startRunning];
    
    return YES;
}

- (void)stopReading
{
    [_captureSession stopRunning];
    _captureSession = nil;
    
    [_videoPreviewLayer removeFromSuperlayer];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects && [metadataObjects count] > 0) {
        AVMetadataMachineReadableCodeObject *metadataObject = [metadataObjects objectAtIndex:0];
        if ([[metadataObject type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            NSLog(@"%@" , [metadataObject stringValue]);
            
            if (_audioPlayer) {
                [_audioPlayer play];
            }
        }
    }
    
}

- (void)loadBeepSound
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"beep" ofType:@"m4r"];
    NSURL *fileURL = [NSURL URLWithString:filePath];
    NSError *error;
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
    
    if (error) {
        NSLog(@"Could not load beep sound");
        NSLog(@"%@", [error localizedDescription]);
    }
    else{
        [_audioPlayer prepareToPlay];
    }
}

@end
