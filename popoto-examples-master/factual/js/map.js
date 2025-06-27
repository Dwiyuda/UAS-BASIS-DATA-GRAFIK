// This will let you use the .remove() function later on
if (!('remove' in Element.prototype)) {
    Element.prototype.remove = function () {
        if (this.parentNode) {
            this.parentNode.removeChild(this);
        }
    };
}

function flyToStore(currentFeature) {
    map.flyTo({
        center: currentFeature.geometry.coordinates,
        zoom: 15.5
    });
}

function flyToResult(result) {
    map.flyTo({
        center: [result.attributes.longitude, result.attributes.latitude],
        zoom: 20
    });
}

function createPopUp(currentFeature) {
    var popUps = document.getElementsByClassName('mapboxgl-popup');
    if (popUps[0]) popUps[0].remove();

    var popup = new mapboxgl.Popup({ closeOnClick: false })
        .setLngLat(currentFeature.geometry.coordinates)
        .setHTML('<h3>' + currentFeature.properties.nama + '</h3>' +
                 '<h4>' + currentFeature.properties.alamat + '</h4>' +
                 '<div><b>Tempat Tidur:</b> ' + currentFeature.properties.total_tempat_tidur + '</div>' +
                 '<div><b>Layanan:</b> ' + currentFeature.properties.total_layanan + '</div>' +
                 '<div><b>Tenaga Kerja:</b> ' + currentFeature.properties.total_tenaga_kerja + '</div>')
        .addTo(map);
}



function computeBounds(geojson) {
    // Geographic coordinates of the LineString
    var coordinates = geojson.features.map(function (feature) {
        return feature.geometry.coordinates;
    });
    // Pass the first coordinates in the LineString to `lngLatBounds` &
    // wrap each coordinate pair in `extend` to include them in the bounds
    // result. A variation of this technique could be applied to zooming
    // to the bounds of multiple Points or Polygon geometries - it just
    // requires wrapping all the coordinates with the extend method.
    return coordinates.reduce(function (bounds, coord) {
        return bounds.extend(coord);
    }, new mapboxgl.LngLatBounds(coordinates[0], coordinates[0]));
}
