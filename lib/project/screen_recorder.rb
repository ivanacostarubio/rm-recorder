class ScreenRecorder
  # USAGE:
  # @tape = ScreenRecorder.new
  # # start a recording with
  # @tape.record
  # # stop it:
  # @tape.stop

  attr_accessor :video_path

  def initialize(video_path="video_recording.mov")
    setup_video
    setup_recording
    @video_path = NSURL.fileURLWithPath(video_path)
  end

  def record
    @captureMovieFileOutput.startRecordingToOutputFileURL(video_path, recordingDelegate:self)
  end

  def stop
    @captureMovieFileOutput.stopRecording
  end

  def setup_video
    @session = AVCaptureSession.alloc.init
    @session.sessionPreset = AVCaptureSessionPresetHigh
    device = AVCaptureScreenInput.alloc.initWithDisplayID(CGMainDisplayID())
    @session.addInput(device)
    @session.startRunning()
  end

  def setup_recording
    @captureMovieFileOutput = AVCaptureMovieFileOutput.alloc.init
    @captureMovieFileOutput.setDelegate(self)
    if @session.canAddOutput(@captureMovieFileOutput)
      @session.addOutput(@captureMovieFileOutput)
    end
  end
end
