# Change Log

## 3.9.0

### New Features

#### 1. ScreenCapture supports system WGC

Note: This feature requires Windows 10.18362 or above.

When the multi-source acquisition module performs screen capture, it supports system WGC, which also known as Windows Graphics Capture, and uses this mode by default, making the acquisition more efficient.

#### 2. ScreenCapture supports setting publishing-stream area

The multi-source collection module supports users to set independent preview and publishing-stream areas when performing screen capture.

For related API, please refer to [updatePublishRegion](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoScreenCaptureSource/updatePublishRegion.html)

#### 3. Added SEI callback with timestamp

For related API, please refer to [onPlayerRecvMediaSideInfo](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onPlayerRecvMediaSideInfo.html)

#### 4. The single-stream transcoding function supports playing stream by RTC

Note:

If you need to use this function, please contact ZEGOCLOUD technical support.

Transcoding will cause additional delays. It is not recommended if you use this function in your Live Streaming scenarios which playing stream by RTC.

When RTC plays streams, it supports triggering single-stream transcoding tasks through preset transcoding templates, and outputs transcoded streams with different resolutions.

This function can be used in scenarios such as live broadcasts. Viewers can choose streams of different resolutions to ensure smooth playback that based on network quality, terminal equipment, etc..

For related API, please refer to [ZegoPlayerConfig > codecTemplateID](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoPlayerConfig/codecTemplateID.html)

#### 5. Supports throwing [setDummyCaptureImagePath] exception callback

For related API, please refer to [onPublisherDummyCaptureImagePathError](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onPublisherDummyCaptureImagePathError.html)

#### 6. Direct-publish CDN supports updating the CDN address during publishing

For related API, please refer to [enablePublishDirectToCdn](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/enablePublishDirectToCDN.html)

#### 7. Supports AI-balanced noise reduction mode

Note: The current official SDK does not include this function. If necessary, please contact ZEGOCLOUD technical support for special packaging.

Support balanced AI noise reduction mode. Compared with the original mode, under the premise of the same human voice fidelity effect, the noise suppression effect is significantly improved, and can reach the level of clean and noise-free or non-disturbing; but the performance Consumption increased slightly. Suitable for noisy (low signal-to-noise ratio) outdoor environments such as streets, roads, markets, etc..

For related API, please refer to [ZegoANSModeAIBalanced](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoANSMode/ZegoANSModeAIBalanced.html)

### Enhancements

#### 1. Optimize [setLogConfig] interface

The life cycle of [setLogConfig] is expanded to the App life cycle, and its priority is higher than the configuration in [setEngineConfig].

For related API, please refer to [setLogConfig](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/setLogConfig.html), [setEngineConfig](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/setLogConfig.html)

#### 2. Optimize the retry rules when the App is dormant

Optimize the retry rules when the App is sleeping. During the loginRoom and publishing-playing process, the App Sleep Time is also included in the Maximum Allowed Retry Time.

### Bug Fixes

1. Fixed the problem that the audio external collection module would cause silence when switching audio sources.

2. Fixed the issue where no error message is thrown when the watermark path exceeds the maximum length set by [setPublishWatermark](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/setPublishWatermark.html).

3. Fixed the issue of a very small probability of failure when sending a new stream.

4. Fixed the issue of the sound effects player occasionally crashes.

5. Fixed the problem that when calling the [sendAudioSideInfo](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/sendAudioSideInfo.html) interface to send audio secondary messages, it takes about 10 seconds for the player to receive the message.

6. Fix the problem that the time spent on TCP disconnection of WS CDN in the case of direct publishing is fixed at 500 ms

## 3.8.1

### New Features

#### 1. Added support for Smart Cloud Proxy mode

Note: If you need to use this function, please contact ZEGOCLOUD technical support

After the developer sets the Smart Cloud Proxy mode, when publishing streams from RTC or L3, it will give priority to using the direct network mode to try. If the direct connection network is unavailable and it is currently a cellular network, continue to stay in the direct connection mode and try again; if the direct connection network is not available and it is currently a non-cellular network, then switch to the cloud proxy mode.

#### 2. Support returning low frame rate alarms for encoding and hardware decoding

Note: If you need to use this function, please contact ZEGOCLOUD technical support

Added a low frame rate alarm callback that supports throwing encoding and hardware decoding. In 1v1 chats, live broadcasts and other scenarios, developers can adjust the streaming resolution and trigger transcoding based on this callback.

For related API, please refer to [onPlayerLowFpsWarning](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onPlayerLowFpsWarning.html), [onPublisherLowFpsWarning](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onPublisherLowFpsWarning.html)

#### 3. Mediaplayer supports setting Http Headers of network resources

The mediaplayer supports setting the Http Headers of network resources. Based on this configuration, developers can customize and limit the access methods of network resources to strengthen the security protection of resources.

For related API, please refer to [setHttpHeader](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoMediaPlayer/setHttpHeader.html)

#### 4. The range voice supports configuring the attenuation range of the 3D sound effect distance and the sound range of a single stream

In the range voice scene:

- Support to set the attenuation range [min, max] of the 3D audio effect distance through the [setAudioReceiveRange](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoRangeAudio/setAudioReceiveRange.html) function，set the attenuation range [min, max] of the 3D audio effect interface. When the distance is less than min, the volume will not attenuate as the distance increases; when the distance is greater than max, the other party's voice will not be heard.
- Support setting the vocal range [min, max] of a single stream through the [setStreamVocalRange](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoRangeAudio/setStreamVocalRange.html) interface.

#### 5. Support callback related event activities by publish channel

The [onPublisherSendAudioFirstFrame](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onPublisherSendAudioFirstFrame.html) callback function adds a channel parameter, which supports multi-channel listening and streaming to send the first frame information.

For related API, please refer to [onPublisherSendAudioFirstFrame](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onPublisherSendAudioFirstFrame.html)

### Enhancements

#### 1. Optimize the noise performance of the low-light enhancement algorithm

#### 2. Optimize the URL length of resources loaded by mediaplayers, with a maximum support of 2048 bytes

#### 3. Optimize the callback synchronization of media player SEI information and corresponding frame data to ensure the consistency of SEI and screen

### Bug Fixes

#### 1. Fix the problem of hard unblocking of H.265 RTMP streams with B frames

#### 2. Fix the probelm that changing the userID after [createEngine] and before [destroyEngine] may cause publish-play stream failure when using Token authentication

### Deleted

#### 1. Abandoned some API interfaces

In version 3.8.1, deprecated changes were made to the following API interfaces.

- Abandoned the original `onPublisherSendAudioFirstFrame` callback interface and replaced it with the [onPublisherSendAudioFirstFrame](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onPublisherSendAudioFirstFrame.html) callback of the same name, and added a `channel` parameter to support callback-related event activities by publsih channel.

- The original member function of [ZegoRangeAudio](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoRangeAudio-class.html) class:

  - The original member function `setAudioReceiveRange` is discarded and replaced with the [setAudioReceiveRange](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoRangeAudio/setAudioReceiveRange.html) interface with the same name, and the parameter [ZegoReceiveRangeParam](/unique-api/express-video-sdk/en/dart_flutter/zego_express_engine/ZegoReceiveRangeParam-class.html) type is extended to support setting the audio receiving range of the range voice.
  - The original member function `setStreamVocalRange` is discarded and replaced with the [setStreamVocalRange](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoRangeAudio/setStreamVocalRange.html) interface with the same name, and the parameter [ZegoVocalRangeParam](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoVocalRangeParam-class.html) type is extended to support setting the voice range of a single stream of range voice.

There may be compatibility issues after the API interface changes, please refer to [Upgrade guide 3.8.1+](https://doc-en.zego.im/article/16425) for details.

## 3.7.0

### New Features

1. After enabling the encoding of H.264 DualStream, in addition to the video parameters for the big stream, it is now possible to set the video parameters for the small one.

    Note:

    Before using this function, you need to call the [setVideoConfig] interface to specify the video codecID as ZegoVideoCodecIDH264DualStream.

    The ratio of setting the resolution for the big stream and the small stream needs to be consistent, otherwise it will cause errors when calling the interface.

    When specifying the codecID as ZegoVideoCodecIDH264DualStream, you can separately set the resolution, frame rate, and bitrate for the big stream and the small stream.

    For related API, please refer to [setVideoConfig](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/setVideoConfig.html), [setPublishDualStreamConfig](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/setPublishDualStreamConfig.html)

2. Added a callback notification when the desktop screen capture area changes.

    The callback notification for when the desktop screen capture area changes is called [onRectChanged]. After starting the screen capture, when the capture area changes, the SDK will notify the developer through this callback. By listening to this callback, developers can modify the preview screen size and other configurations.

    For related API, please refer to [onRectChanged](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onRectChanged.html)

### Enhancements

1. Optimize the internal logic of the SDK and reduce the memory usage by 400KB ~ 600KB.

2. Optimize the SDK video capture strategy to improve image quality.

3. In the publish-play stream retry state caused by network disconnection, support callback for local network quality

    For related API, please refer to [onNetworkQuality](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onNetworkQuality.html)

4. Support generating log upload tasks after calling the [destroyEngine] interface.

    For related API, please refer to [submitLog](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/submitLog.html)

5. Optimize the internal logic of the SDK to improve the call experience in a weak network environment.

### Bug Fixes

1. Fixed the occasional stuck problem when rendering on the metal screen.

2. Fix the problem that after MediaRecorder and AudioObserver stop streaming, the local streaming is not resumed and the collection continues.

3. Fix the problem of multi-thread deadlock in NetMonitor module.

## 3.6.1

### Bug Fixes

1. Fix the problem that setRoomExtraInfo call fails.

## 3.6.0

### **💥 Breaking changes**

The applicationVolume and microphoneVolume fields in the [ZegoScreenCaptureConfig](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoScreenCaptureConfig-class.html) class become optional fields.

### New Features

1. Added support for background blur and virtual background functions.

    Note: The current official website SDK does not include this function. If necessary, please contact ZEGOCLOUD technical support.

    In real scene or greenscreen scenes, developers can use this function to blur the user's background, or replace it with a custom picture background.

    This function can be used in video conferences, 1v1 audio and video calls and other scenarios to help users better protect personal privacy and improve the fun of calls.

    For related API, please refer to [enableVideoObjectSegmentation](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/enableVideoObjectSegmentation.html)

2. The screen capture function supports the capture of system audio.

    The screen capture function adds the ability to capture system audio on the basis of only supporting image capture, so as to share the music being played while sharing the demo courseware screen. This function can be used in scenarios such as online teaching and game live broadcasting.

    For related API, please refer to [startScreenCapture](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoScreenCaptureSource/startScreenCapture.html)

3. Added Enhanced KTV reverb effect.

    Added an enhanced KTV reverb effect to achieve a more concentrated and brighter KTV vocal effect. Compared with the previous KTV reverb sound effect, the Enhanced KTV reverb effect shortens the reverb duration and improves the dry-wet ratio.

    The original KTV reverb effect is only suitable for users with obvious vocal defects, and the enhanced KTV reverb effect is suitable for most professional users and ordinary users.

    For related API, please refer to [setReverbPreset](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePreprocess/setReverbPreset.html)

4. Game voice function supports media player and audio player to use 3D sound effects.

    Developers can realize 3D sound effects of local audio and online audio resources by setting the position and orientation of media players and sound effect players. This function can be used to set the sound effect of the item in the virtual scene, as well as the background music of the specified location, etc.

    For related API, please refer to [ZegoMediaPlayer > updatePosition](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoMediaPlayer/updatePosition.html), ZegoAudioEffectPlayer > [updatePosition](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoAudioEffectPlayer/updatePosition.html)

5. The media player supports obtaining media stream video information

    For the video file being played by the media player, the developer can actively obtain information such as the resolution and frame rate of the video.

    For related API, please refer to [ZegoMediaPlayer > getMediaInfo](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoMediaPlayer/getMediaInfo.html).

6. Media player double speed function supports up to 4x

    The maximum speed of the media player has been increased to 4x. For example, when the user is playing an audio and video file, if it has been set to play at 2x, it can be accelerated to 4x when long pressing the screen.

    For related API, please refer to [ZegoMediaPlayer > setPlaySpeed](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoMediaPlayer/setPlaySpeed.html)

7. The media player supports functions such as downloading, retrieving data decryption, and playing at the same time.

    For copyright music protection in online players, the media player supports downloading while recalling unencrypted binary data, which is decrypted by the developer and then returned to the media player for playback. During the process, no files or cache files are generated.

    For related API, please refer to [ZegoMediaPlayer > enableBlockData](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoMediaPlayer/enableBlockData.html)

### Bug Fixes

1. Fixed an issue that could cause a memory leak when using the media player.

2. Fixed an issue that [enableCustomVideoCapture](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngineCustomVideoIO/enableCustomVideoCapture.html)/[enableCustomVideoProcessing](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngineCustomVideoIO/enableCustomVideoProcessing.html)/[enableCustomVideoRender](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngineCustomVideoIO/enableCustomVideoRender.html) not result called.

## 3.5.0

### **New Features**

1. Support the first frame callback for audio and video streaming.

    When publishing audio and video stream, monitor the release timing of the "first frame of audio" or "first frame of video" through [onPublisherSendAudioFirstFrame](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onPublisherSendAudioFirstFrame.html) and [onPublisherSendVideoFirstFrame](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onPublisherSendVideoFirstFrame.html) callbacks. This function can be used to count the time consumption of audio and video streaming, or update UI performance, etc.

    For related API, please refer to [onPublisherSendAudioFirstFrame](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onPublisherSendAudioFirstFrame.html), [onPublisherSendVideoFirstFrame](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onPublisherSendVideoFirstFrame.html)

2. The media player supports the first frame callback after the audio and video rendering is completed.

    When rendering audio and video through the media player, use the [onMediaPlayerFirstFrameEvent](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onMediaPlayerFirstFrameEvent.html) callback to monitor the release timing of the "first frame of audio" or "first frame of video" after rendering. This function can be used to count the time consumption of audio and video rendering, or update UI performance, etc.

    For related API, please refer to [onMediaPlayerFirstFrameEvent](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onMediaPlayerFirstFrameEvent.html)

3. External collection supports active offset NTP timestamps.

    Note: If you need to use this function, please contact ZEGOCLOUD technical support. 

    When using the external acquisition function, support actively offsetting the NTP timestamp through the experimental API interface. This function can be used in KTV chorus, accompaniment, lyrics alignment and other scenarios.

4. Support for fast switching rooms in multi-room mode.

    In the multi-room mode, the [switchRoom](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngineRoom/switchRoom.html) interface is supported to quickly and conveniently realize the function of switching rooms.

    For related API, please refer to [switchRoom](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngineRoom/switchRoom.html)

## **Enhancements**

1. Significantly reduce the time-consuming time spent on video hard decoding of Huawei models.

    Note: If you need to use this function, please contact ZEGO technical support. 

    For HUAWEI devices, the SDK supports relevant configurations to reduce the time spent on video hardware decoding by 80%.

2. Drastically reduces SDK memory consumption on iOS device.

    This optimization takes effect from version 3.5.0 and does not require additional interfaces.

## **Bug Fixes**

1. Fix the problem that the media player cannot make the playback progress jump to 0 through the seekTo interface in some m3u8 file formats.

2. Fix the occasional problem that the video on the streaming side freezes after re-pushing the stream.

3. Fix the problem that Android memory usage information is not updated.

4. Fix the occasional problem that when the iOS media player loads a file for the first time, there will be no picture for the first few seconds.

## 3.4.2

1. Support for Geofencing Function.

    Note:

    - To use this feature, please contact ZEGO technical support.

    - Please configure geofencing information before creating the engine.

    Restrict access to audio, video, and signaling data to a specific area to meet regional data privacy and security regulations, which restrict users' access to audio and video services in a specific area.

    For related API, please refer to [setGeoFence](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/setGeoFence.html)

2. The media player supports functions such as downloading, retrieving data decryption, and playing at the same time.

    For copyright music protection in online players, the media player supports downloading while recalling unencrypted binary data, which is decrypted by the developer and then returned to the media player for playback. During the process, no files or cache files are generated.

    For related API, please refer to [enableBlockData](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoMediaPlayer/enableBlockData.html)

3. Support dynamic switching of flow control strategies

    Supports dynamic switch flow control function, as well as setting flow control attributes.

    For related API, please refer to [enableTrafficControl](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/enableTrafficControl.html), [setMinVideoBitrateForTrafficControl](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/setMinVideoBitrateForTrafficControl.html), [setMinVideoFpsForTrafficControl](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/setMinVideoFpsForTrafficControl.html), [setMinVideoResolutionForTrafficControl](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/setMinVideoResolutionForTrafficControl.html)

4. Expand the acquired song resource information.

    Support acquiring the start and end time information of the "snatch singing segment" of the song corresponding to the songID through the requestResource interface. Other users can obtain the shared information through the getSharedResource interface.

    Note: This feature is only supported for use by some copyright holders. Please contact ZEGO technical support.

    For related API, please refer to [requestResource](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoCopyrightedMusic/requestResource.html), [getSharedResource](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoCopyrightedMusic/getSharedResource.html)

5. Copyrighted music adds a new billing model.

    A new billing model has been added, which charges monthly based on the host. Please contact ZEGO technical support.

6. The copyright content center has added song resources from music copyright holders.

    It is supported to pass different values of copyright holders in the parameter "vendorID" of the relevant interface to perform operations such as song request and obtaining lyrics.

    Note: Detailed information about the copyright holder. Please contact ZEGO technical support.

    For related API, please refer to [requestResource](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoCopyrightedMusic/requestResource.html), [getSharedResource](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoCopyrightedMusic/getSharedResource.html) 

7. Expand the range of supported song rating capabilities.

    Support the ability to rate and display pitch lines for multiple copyrighted songs, with detailed information.  Please contact ZEGO technical support.

8. Support the use of copyrighted music in multi-room mode.

    By adding the roomID parameter to the "request song" and "get shared resources" interfaces, the use of copyrighted music in multi-room mode is enabled.

    For related API, please refer to [requestResource](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoCopyrightedMusic/requestResource.html), [getSharedResource](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoCopyrightedMusic/getSharedResource.html) 

9. Copyrighted music support song aggregation search.

    Support searching and querying through multiple copyright music libraries by inputting keywords such as singer or song title. The search results can be filtered, sorted, and customized for display.

    For related API, please refer to [sendExtendedRequest](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoCopyrightedMusic/sendExtendedRequest.html)

## **Enhancements**

1. Optimize SDK memory usage

    Delete some unnecessary memory applications within the SDK and optimize the SDK's memory usage. Compared to the previous version, the memory usage has decreased by about 10%.

2. Optimize the rotation logic of iOS screen sharing to avoid crashes caused by memory usage exceeding the 50MB limit caused by rotation during the screen recording process.

3. Optimize error code prompts.

    Due to the expiration limit of song resources, the API for obtaining song resources has added a new error code 1008011, indicating that the song resource has expired.

    For related API, please refer to [loadCopyrightedMusicResourceWithPosition](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoMediaPlayer/loadCopyrightedMusicResourceWithPosition.html)

4. To add a new enumeration value for a music copyright holder.

    To add a new enumeration value for a music copyright holder. Please contact ZEGO technical support.

    For related API, please refer to [ZegoCopyrightedMusicVendorID](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoCopyrightedMusicVendorID.html)

## **Bug Fixes**

1. Fixed the issue of macOS platform screen sharing where the actual collection frame rate is lower than the set frame rate.

2. Fixed the problem of iOS blurred video picture caused by uncontrolled video hard coding rate when hard coding streaming is performed on iOS 16.4.1 devices.

3. Fixed the issue of abnormal listening of game voice in certain situations.

## **Deleted**

1. Starting from version 3.4.1, support for iOS 11.0 and below has been discontinued, and the iOS Deployment Target (minimum supported version) has been upgraded to iOS 11.0.
For specific instructions, Please refer to [App Store submission requirement starts April 25](https://developer.apple.com/news/?id=jd9wcyov) and [Xcode 14 Release Notes](https://developer.apple.com/documentation/xcode-release-notes/xcode-14-release-notes#Build-System).

2. Starting from version 3.4.1, the iOS SDK no longer supports the 32-bit armv7 architecture.
For specific instructions, Please refer to [Xcode 14 Release Notes](https://developer.apple.com/documentation/xcode-release-notes/xcode-14-release-notes#Build-System).

## 3.3.1

### **Bug Fixes**

1. Fixed the failure of Android hardware ear feedback in some scenarios.

2. Fixed H265 decoding failure in Android  some scenarios.

## 3.3.0

### **New Features**

1. Support for voice enhancement effect in external scenes.

    In the external scene, the microphone of the device is too close to the speaker, which may easily lead to blurred or dull voice. In this scenario, voice enhancement can effectively improve the clarity of voice and improve the sense of boredom. Therefore, it is recommended to enable this function in an external scenario.

    In order to achieve the voice enhancement effect in the external broadcast scene, the voice enhancement effect can be turned on and the enhancement level can be set. It can be used in the KTV external broadcast scene to fine control the voice effect. The recommended enhancement level is 4.

    For related API, please refer to [enableSpeechEnhance](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePreprocess/enableSpeechEnhance.html)

2. Game voice supports customized voice mode and listening mode.

    The game voice supports the customized setting of voice mode and listening mode, which can be used to shield the scene of the same team of players outside the range after joining the team.

    For related API, please refer to [setRangeAudioCustomMode](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoRangeAudio/setRangeAudioCustomMode.html)

3. Express SDK iOS streaming function supports picture-in-picture capability.

    Note: To use this function, please contact ZEGO technical support.

4. The single-stream transcoding function supports L3 or CDN streaming.

    Note: When pulling the transcoding stream through CDN, you must use the push CDN. To use this function, please contact ZEGO technical support.

    Single-stream transcoding refers to converting each original stream into transcoding streams with different encoding formats and different resolutions in the cloud. The transcoding template ID needs to be passed in to pull the transcoding stream. In live broadcast and other scenes, viewers can choose streams of different resolutions to watch based on the quality of the access network, terminal equipment, etc., to ensure the smoothness of playback.

5. The same mixed-stream task supports the output of multiple resolution video streams.

    Note:

    - At present, one mixing task can output up to four video streams with different resolutions, and only server mixing is supported.

    - To use this function, please contact ZEGO technical support.

    The same mixing task supports the output of multiple resolution video streams, which can be used to meet the transcoding requirements in the mixing scenario.

6. Mixed flow task supports input of super whiteboard information.

    In the mixed-stream function, the operation content in the whiteboard can be converted into real-time video, and the whiteboard configuration information can be set, for example, the whiteboard ID, the whiteboard aspect ratio, and whether dynamic PPT loading is supported.

    Note: Currently the super whiteboard flutter SDK is under development.

    For related API, please refer to [ZegoMixerTask](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoMixerTask-class.html), [startMixerTask](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngineMixer/startMixerTask.html)

7. Scenario-based audio and video configuration adds [ZegoScenario.StandardVoiceCall] standard voice call scenario.

    StandardVoiceCall standard voice call scenario is added for scenario-based audio and video configuration, which is applicable to 1v1 pure voice call scenario.

    For related API, please refer to [setRoomScenario](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/setRoomScenario.html)

8. Android support adaptive device acquisition rendering delay and echo cancellation (AEC) in customized audio acquisition and SDK internal rendering mode.

    Note: To use this function, please contact ZEGO technical support.

    In the customized audio acquisition and SDK internal rendering mode, the AUX adaptive alignment and AEC functions are supported, which can achieve better results when performing chorus in KTV scenes.

9. Added a new copyright content center, and some interfaces support the query of distinguishing copyright parties.

    According to the copyright owner, it supports ordering songs, obtaining line-by-line analysis of lyrics, and querying whether resources are cached.

    Note: For detailed information about the copyright owner, please contact ZEGO technical support for processing.

    For related API, please refer to [requestResource](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoCopyrightedMusic/requestResource.html), [getLrcLyric](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoCopyrightedMusic/getLrcLyric.html), [queryCache](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoCopyrightedMusic/queryCache.html), [getSharedResource](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoCopyrightedMusic/getSharedResource.html)

10. When sending an extended request, it is supported to obtain a list of tags, get songs based on tags, query song information in batches, and search for songs according to the copyright owner.

    For related API, please refer to [sendExtendedRequest](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoCopyrightedMusic/sendExtendedRequest.html)

### **Enhancements**

1. Optimize the supersection algorithm to greatly improve the coverage of aircraft models.

    Note:
    - [enableVideoSuperResolution] modifies the call time, and can only be called after [initVideoSuperResolution].
    - Video super resolution currently only supports Android and iOS

    For related API, please refer to [enableVideoSuperResolution](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePlayer/enableVideoSuperResolution.html), [initVideoSuperResolution](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePlayer/initVideoSuperResolution.html)

2. Optimize the over-division logic and add initialization and de-initialization interfaces.

    Note:
    - [enableVideoSuperResolution] modifies the call time, and can only be called after [initVideoSuperResolution].
    - Video super resolution currently only supports Android and iOS

    For related API, please refer to [initVideoSuperResolution](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePlayer/initVideoSuperResolution.html), [uninitVideoSuperResolution](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePlayer/uninitVideoSuperResolution.html)

3. Optimize the deep echo cancellation (AEC) effect of KTV scenes.

    The deep AEC optimization for KTV scenes has achieved:

    - The sound quality of the human voice in the external scene is greatly improved to make the human voice more fidelity.

    - While eliminating the echo, effectively avoid the occasional swallowing of words or the fluctuation of voice.

4. Optimize the inter-process communication performance of screen sharing on the iOS side of the Express SDK.

    In the application project, developers can start AppGroup configuration through the new [ZegoExpressEngine>setAppGroupID] and [ZegoReplayKitExt>setupWithDelegate:appGroup] interfaces to obtain better performance and stability.

    For related API, please refer to [setAppGroupID](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoScreenCaptureSource/setAppGroupID.html)

### **Bug Fixes**

1. Fixed the problem that the Android player has no sound after plugging the headset.

2. Fixed the problem of Android screen collection failure when the main process does not start the screen sharing service.

3. Fixed the problem that immediately getting the pitch line would fail when getting song accompaniment resources or climax clip resources

## 3.2.1

### **New Features**

1. Add screen capture stream function of web platform;

    Note: Firstly, getting screen capture instance by calling the [createScreenCaptureSource](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngineScreenCapture/createScreenCaptureSource.html).Sencondly, setting the video soure are "screen" by calling [setVideoSource](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/setVideoSource.html) function.Now, you can call [startCapture](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoScreenCaptureSource/startCapture.html) for the screen capture instance.

2. Add login multi-room function of web platform;

    Note: On the web platform, [setRoomMode](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/setRoomMode.html) now allows users to log into multiple rooms if they want.

3. Add basic beauty function of web platform;

    Note: On the web platform, support users to use the beauty function by calling [enableEffectsBeauty](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePreprocess/enableEffectsBeauty.html) and [setEffectsBeautyParam](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePreprocess/setEffectsBeautyParam.html) support .

### **Bug Fixes**

1. Fixed the problem that the customized audio acquisition and audio acquisition source need to be reset to take effect after logging in to the room again in some scenarios.

2. Fixed an exception caused by the [onRemoteSoundLevelUpdate](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onRemoteSoundLevelUpdate.html) callback.

3. Fixed an issue with setting SEIType for the [setSEIConfig](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/setSEIConfig.html) interface on iOS that did not work.

## 3.3.0-prerelease.1

### **New Features**

1. Add screen capture stream function of web platform;

    Note: Firstly, getting screen capture instance by calling the [createScreenCaptureSource](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngineScreenCapture/createScreenCaptureSource.html).Sencondly, setting the video soure are "screen" by calling [setVideoSource](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/setVideoSource.html) function.Now, you can call [startCapture](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoScreenCaptureSource/startCapture.html) for the screen capture instance.

2. Add login multi-room function of web platform;

    Note: On the web platform, [setRoomMode](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/setRoomMode.html) now allows users to log into multiple rooms if they want.

3. Add basic beauty function of web platform;

    Note: On the web platform, support users to use the beauty function by calling [enableEffectsBeauty](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePreprocess/enableEffectsBeauty.html) and [setEffectsBeautyParam](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePreprocess/setEffectsBeautyParam.html) support .

### **Bug Fixes**

1. Fixed an exception caused by the [onRemoteSoundLevelUpdate](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onRemoteSoundLevelUpdate.html) callback.

2. Fixed an issue with setting SEIType for the [setSEIConfig](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/setSEIConfig.html) interface on iOS that did not work.

## 3.2.0+1

### **Bug Fixes**

1. Fix the problem that the ZegoVideoSourceType value does not match the actual effect.

## 3.2.0

### **New Features**

1. Support video DualStream.

    When video streams are layered through video DualStream coding (H.264 DualStream), Compared to Layered Video Coding (H.264 SVC), Video DualStream encoding (H.264 DualStream) supports hardware encoding, that is, [ZegoVideoCodecID] adds [H264DualStream] field.

    For related API, please refer to [ZegoVideoCodecID.H264DualStream](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoVideoCodecID.html).

### **Enhancements**

1. CustomCommand configuration support extended to 4KB.

    Note: The default size of the CustomCommand configuration is 1KB, if it needs to be extended to 4KB, please contact ZEGO technical support for processing.

### **Bug Fixes**

1. Fix hardware coded access to null pointer crash.

2. Fix the problem that the network time module fails to retry.

## 3.1.0

### **New Features**

1. Support multi-source acquisition capability.

    For a variety of interactive scenarios of audio and video sources such as online KTV, watching movies together, watching competitions, video conferences, and online education, multi-source acquisition provides flexible and easy-to-use audio and video acquisition sources and channel management capabilities, greatly reducing developers' development and maintenance costs.

    Multi source acquisition capability shortens, optimizes and normalizes the implementation path of common capabilities such as screen sharing and mixing. After version 3.1.0, you can no longer implement the above complex capabilities through custom acquisition.

    The main capabilities and characteristics are as follows.

    1. Streaming channel supports setting or switching multiple audio and video sources.

    2. Common capabilities such as screen sharing and mixing are supported.

2. SDK supports setting cloud proxy.

    Note: If you need to use this function, please contact ZEGO technical support.

    By setting the cloud proxy interface of the SDK, all the traffic corresponding to the SDK is transferred through the cloud proxy server to achieve communication with the RTC.

    For related API, please refer to [setCloudProxyConfig](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/setCloudProxyConfig.html).

### **Enhancements**

1. Greatly improve the audio and video connectivity in extremely weak network areas, and reduce the connection time.

    The ZEGO self-developed dispatching system has been deeply optimized for areas with poor network quality.

### **Bug Fixes**

1. Fixed the problem that sending room [Logout] signaling may fail.

2. Fixed Android the occasional black screen problem caused by the camera authority occupation.

3. Fixed occasional crash of Android audio player.

4. Fixed iOS the occasional crash of null pointer in restart access after the video hardware failure.

5. Fixed Android the problem of device restart in low latency mode.

## 3.0.3

### **💥 Breaking changes**

This version contains breaking changes, please refer to [v3.0.3 Upgrade Guide](./doc/v3.0.0+_upgrade_guide.md) for details.

### **New Features**

1. New video super-resolution capability

    Note: If you need to use this function, please contact ZEGO technical support. This feature currently only supports IOS and Android platforms.

    The new [enableVideoSuperResolution] interface supports super-resolution processing of a video stream to achieve better image quality. Super resolution, referred to as super resolution, is a technology that the client multiplies the width and height of the pulled video stream in real time. For example, from 640x360 to 1280x720.

    For related API, please refer to [enableVideoSuperResolution](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePlayer/enableVideoSuperResolution.html), [onPlayerVideoSuperResolutionUpdate](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onPlayerVideoSuperResolutionUpdate.html)

2. Scene AI noise reduction adds the ability to reduce noise in music scenes

    Note: If you need to use this function, please contact ZEGO technical support. This feature currently only supports IOS，Android，mac and window platforms.

    The scene AI noise reduction function, based on the previous noise reduction for all non human voices, supports the noise reduction capability in the music scene, and restores the music sound quality by identifying music and intelligently adjusting the noise reduction effect. The SDK will perform music detection on the microphone input in real time, and automatically adjust the noise reduction level in sound card, playing and singing or near field music scenes to ensure the high fidelity sound quality of music.

3. Scenario of adding room dimensions

    In order to facilitate the rapid access of developers and reduce the access threshold for developers, the SDK provides a variety of preset scenarios. Developers can select the corresponding room mode [ZegoScenario](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoScenario.html) according to the desired scenario, and the SDK will automatically apply audio and video codecs, audio and video parameters, flow control strategies and other configurations suitable for the scenario, so as to quickly achieve the best effect in the scenario.

    Currently supported scenarios include live show, KTV, standard 1v1 audio and video calls, high quality 1v1 audio and video calls, standard chat rooms, and high quality chat rooms.

    For related API, please refer to [setRoomScenario](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/setRoomScenario.html)

4. Support for obtaining the codec capability of the specified video codec of the current device

    Note: The interface adds an optional parameter codecBackend. The return value is changed to an int type; 0 means not supported, and this encoding format cannot be used for streaming; 1 means supported, and this encoding format can be used for streaming; 2 means not confirmed, and it is recommended to call this interface later.This feature currently only supports IOS，Android，mac and window platforms.

    The SDK supports obtaining the support of the codec mode of the video codec specified by the current device, so as to better help developers choose the encoder and codec mode to use and obtain better results.

    The hardware or software encoding support of the current encoder can be obtained through the [isVideoEncoderSupported] interface.

    Through the [isVideoDecoderSupported] interface. The hardware or software decoding support of the current decoder can be obtained. The above two interfaces contain three enumerated values:support hardware or software, support hardware, and support software.

    For example, ZegoExpressEngine.instance.isVideoEncoderSupported(ZegoVideoCodecID.H265, codecBackend: ZegoVideoCodecBackend.Hardware)means to check whether the current device supports H265 hardcoding. If yes, return 1.

    For related API, please refer to [isVideoEncoderSupported](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePublisher/isVideoEncoderSupported.html), [isVideoDecoderSupported](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePlayer/isVideoDecoderSupported.html)

5. Added switch interface for acquiring GPS information

    Note: This function is enabled by default. If you need to disable this function, please contact ZEGO technical support.  n If the app has access to the geographical location, the developer can choose whether to allow the ZEGO SDK to obtain the GPS information cached by the system, which is obtained by default. When developers want to disable this function, they need to contact ZEGO technical support to set it.This feature currently only supports IOS ， Android，mac and window platforms.

6. New video first frame callback based on camera opening

    Support callback after SDK pulls the stream and renders the first frame of remote camera video data each time the remote camera is turned on. Developers can use this callback to calculate the first frame time consumption, or update the UI components of the playback stream.This feature currently only supports IOS，Android，mac and window platforms.

    For related API, please refer to [onPlayerRenderCameraVideoFirstFrame](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEngine/onPlayerRenderCameraVideoFirstFrame.html)

7. Add the CDN Plus playing configuration to the startPlayingStream interface on the web platform.

    Note: If you want to control the stream-playing mode from the cloud by more criteria such as region and user, please contact ZEGO technical support for related configuration.

    In the past, the web did not support playing CDN plus.Now, we can play CDN plus on the IOS，Android，mac, window and web platforms.The [startPlayingStream] interface adds CDN_PLUS as a new ZegoResourceType on the web platform. interface. You can enable CDN_PLUS to play stream by yourself based on to the stream critirion. The CDN Plus stream-playing is a cost-effective method, because its quality is higher than CDN stream-playing with similar price.

    For related API, please refer to [startPlayingStream](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePlayer/startPlayingStream.html)

### **Enhancements**

1. Optimized for 1v1 pure RTC call scenarios

    Note: If you need to use this function, please contact ZEGO technical support.

    It is optimized for 1v1 call scenarios and is applicable to pure RTC scenarios.

2. Optimize space audio function

    The space audio capability is optimized, so that users can distinguish the front and rear audio sources, so as to achieve a better sense of immersion.

3. Optimize the situation of broken sound caused by excessive collection volume

    The AGC automatic gain control algorithm is optimized. When the acquisition volume is too large, it will not cause broken sound.

4. Optimize the audio and video experience in extremely weak networks

    The SDK optimizes the internal strategy. In the audio and video scenarios, it supports a minimum downlink of 50 kbps without congestion, ensuring a better experience in extremely weak networks.

### **Bug Fixes**

1. Fixed the problem that under some system versions of Mac M1 chip computers, the Web side enabled hardware encoding streaming, and used multiple SPS (Sequence Parameter Set) and PPS (Picture Parameter Set) output forms.

2. Fixed the problem that the logs currently being uploaded may crash when the network status is switched from having a network to having no network.

3. Fixed GetCallbackController non thread safety issue.

4. Fixed the problem that the SDK did not trigger [onPlayerRenderVideoFirstFrame] without a View.

5. Fixed the SDK crash caused by repeatedly starting and stopping the camera under Android system.

6. Fixed the problem of abnormal screen scaling when iOS, macOS, and windows use texture mode to render the screen.

7. Fixed the problem of iOS hardware decoding failure.

    For related API, please refer to [enableHardwareDecoder](https://pub.dev/documentation/zego_express_engine/latest/zego_express_engine/ZegoExpressEnginePlayer/enableHardwareDecoder.html)

8. Fixed the problem that when streaming is stopped in the multi room mode, other people in the room cannot receive stream deletion notifications.

9. Fixed the possible crash of hardware decoding on iOS, macOS and Windows platforms.

10. Fixed the Android issue that [onNetworkQuality] not calling back

### **Deleted**

1. Three old versions of [ZegoScenario] scenarios have been abandoned
Discard [General], [Communication] and [Live] three scenarios in the [ZegoScenario] scenario enumeration.

2. [setDebugVerbose],[setPlayStreamVideoLayer],[setBuiltInSpeakerOn],[onDeviceError],[loginMultiRoom]  are deleted.
