# rm-recorder

A series of classes that allows us to record the screen or camera without pain.

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


By default you should have a file called `video_recording.mov`. The output file name is changeable by passing the desired name to the initializer

    @tape = ScreenRecorder.new("zomg.mov")

## Contributing

1. Let's create a few of this to capture the screen, camaras, etc.
