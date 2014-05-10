$(document).ready(function () {
    var t = new Trianglify({
//            x_gradient: ["#660000", "#800000", "#990000", "#B20000", "#CC0000", "#E60000", "FF0000", "#FF1919"] ,
//            y_gradient: ["#660000", "#800000", "#990000", "#B20000", "#CC0000", "#E60000", "FF0000", "#FF1919"],
            x_gradient: colorbrewer.Reds[9],
            y_gradient: colorbrewer.Reds[1],
            noiseIntensity: 0.1,
            cellpadding: 20,
            cellsize: 100}),
        header = ('.headingWrapper');
    var pattern = t.generate(document.body.clientWidth, document.body.clientHeight);
    $(header).attr('style', 'background-image: ' + pattern.dataUrl);

    $('.jcarousel').jcarousel({
        transitions: true,
        wrap: 'both'
    });
})