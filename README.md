# rm-recorder

A series of classes that allow us to record the screen or camara without pain.

## Installation

Add this line to your application's Gemfile:

    gem 'rm-recorder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rm-recorder

## Usage

    @tape = ScreenRecorder.new
    # # start a recording with
    @tape.record
    # # stop it: 
    @tape.stop 


You should have af ile called video_recording.mov. Change thename of the output file by passing the name to the initializer

    @tape = ScreenRecorder.new("zomg.mov")

## Contributing

1. Let's create a few of this to capture the screen, camaras, etc.
