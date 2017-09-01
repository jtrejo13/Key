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

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

- (BOOL)startReading;
- (void)stopReading;

- (void)loadBeepSound;

@end

@implementation QRCodeCameraViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _isReading = NO;
    _captureSession = nil;
    
    [self loadBeepSound];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startStopReading:(UIBarButtonItem *)sender
{
    if (!_isReading) {
        if ([self startReading]) {
            [_bbitemStart setTitle:@"Stop"];
            [_lblStatus setText:@"Scanning for QR Code"];
        }
    }
    else{
        [self stopReading];
        [_bbitemStart setTitle:@"Start"];
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
            [_lblStatus performSelectorOnMainThread:@selector(setText:) withObject:[metadataObject stringValue] waitUntilDone:NO];
            [self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:NO];
            [_bbitemStart performSelectorOnMainThread:@selector(setTitle:) withObject:@"Start!" waitUntilDone:NO];
            _isReading = NO;
            
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
