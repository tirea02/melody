const player = new Plyr('#plyr-audio', {
    controls: ['play', 'progress', 'current-time', 'duration', 'mute', 'volume', 'fullscreen'],
    seekTime: 10,
    volume: 0.5,
    muted: false,
});

// Customize play button with Font Awesome icon
const playButton = player.elements.buttons.play;
playButton.innerHTML = '<i class="fas fa-play fa-xl"></i>';

// Add event listeners for Plyr events
player.on('ready', event => {
    // Your customizations here
});