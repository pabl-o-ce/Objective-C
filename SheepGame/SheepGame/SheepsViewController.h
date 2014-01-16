//
//  SheepsViewController.h
//  SheepGame
//
//  Created by Pablo Roberto Carrera Estrada on 12/8/13.
//  Copyright (c) 2013 Pablo Roberto Carrera Estrada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface SheepsViewController : UIViewController<UIApplicationDelegate, AVAudioPlayerDelegate>{
    AVAudioPlayer *song;

}
@end
