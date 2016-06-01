//
//  SLPlaySound.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/30.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "SLPlaySound.h"
#import "SLPlaySound.h"
@implementation SLPlaySound
-(id)initForPlayingVibrate
{

   self = [super init];
        if (self) {
 
         soundID = kSystemSoundID_Vibrate;
     
           }
 
       return self;
}

-(id)initForPlayingSystemSoundEffectWith:(NSString *)resourceName ofType:(NSString *)type
 {
    
         self = [super init];
 
        if (self) {
        
               NSString *path = [[NSBundle bundleWithIdentifier:@"com.apple.UIKit"] pathForResource:resourceName ofType:type];
      
              if (path) {
            
                        SystemSoundID theSoundID;
           
                         OSStatus error =  AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &theSoundID);
            
                        if (error == kAudioServicesNoError) {
                
                                 soundID = theSoundID;
                             }else {
                    
                                   NSLog(@"Failed to create sound ");
                    
                               }
          
                 }
     
            
       
            }
        return self;
 }

-(id)initForPlayingSoundEffectWith:(NSString *)filename
{
  
     self = [super init];
 
    if (self) {
        
                NSURL *fileURL = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        
                if (fileURL != nil)
          
                   {
              
                           SystemSoundID theSoundID;
               
                          OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileURL, &theSoundID);
            
                            if (error == kAudioServicesNoError){
                   
                                   soundID = theSoundID;
                   
                              }else {
                                       NSLog(@"Failed to create sound ");
                       
                                   }
               
                     }
     
            }
   
        return self;
 
}

-(void)play
 {
  
       AudioServicesPlaySystemSound(soundID);
}

-(void)dealloc
{
 
        AudioServicesDisposeSystemSoundID(soundID);
}


@end
