module IOSVideoBackground

  attr_accessor :captureManager, :videoButton, :stillButton, :videoPreviewView, :captureVideoPreviewLayer

  def viewWillAppear(animated)
    super
#    @captureManager.session.startRunning if @captureManager.session.isInterrupted
  end

  def dealloc
    Logger.info("CamViewController dealloc")
    self.removeObserver(self, forKeyPath:'captureManager.videoInput.device.focusMode')
    super
  end



  def viewDidLoad
    super
    unless @captureManager
      @captureManager = CaptureManager.alloc.init
      @captureManager.delegate = self

      if @captureManager.setupSession
        # Create video preview layer and add it to the UI
        @videoPreviewView = UIView.alloc.initWithFrame([[0,0],[App.frame.size.width, 480]])
        @captureVideoPreviewLayer = AVCaptureVideoPreviewLayer.alloc.initWithSession(@captureManager.session)

        @videoPreviewView.alpha = 0.1

        viewLayer = @videoPreviewView.layer
        viewLayer.masksToBounds = true
        @captureVideoPreviewLayer.frame = @videoPreviewView.bounds
        if @captureVideoPreviewLayer.connection.isVideoOrientationSupported
          @captureVideoPreviewLayer.connection.videoOrientation = AVCaptureVideoOrientationPortrait
        end

        @captureVideoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        @captureManager.session.sessionPreset = AVCaptureSessionPresetHigh if @captureManager.session.canSetSessionPreset(AVCaptureSessionPresetHigh)

        viewLayer.addSublayer(@captureVideoPreviewLayer)

        Dispatch::Queue.main.async do
          @captureManager.session.startRunning
        end

        self.view.addSubview(@videoPreviewView)
      end
    end
  end
end
