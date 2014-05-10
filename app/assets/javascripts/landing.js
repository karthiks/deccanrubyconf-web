$(document).ready(function () {
    var t = new Trianglify({
            x_gradient: colorbrewer.Reds[Math.floor(Math.random() * 9) + 1],
            y_gradient: colorbrewer.Reds[Math.floor(Math.random() * 9) + 1],
            noiseIntensity: 0.1,
            cellpadding: 10,
            cellsize: 100}),
        header = ('.headingWrapper');
    var pattern = t.generate(document.body.clientWidth, document.body.clientHeight);
    $(header).attr('style', 'background-image: ' + pattern.dataUrl);
    $('.jcarousel').jcarousel({
        transitions: true,
        wrap: 'both'
    });
})