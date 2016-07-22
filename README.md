A example of a time enabled raster wms.  It contains VIIRS data and Modis data from 2015 to 2016-07-14T19:54:00

The basic workflow is like this:
* Make a list of the files to be included
* Sort the list by date, older first
* make a tile index using that list, keeping order
* add date to the index, in a form like 2016-07-14T19:54:00
.* Generally the easist way to do this is to convert to geojson, add a time field, and convert back to a shpefile.
.* It is also fairly simple just to add the time directly, just more work
.* Index needs to keep the proper date format, like 2016-07-14T19:54:00 .
* make map file for the index, like this:
```
  LAYER
    TILEINDEX "path"
    METADATA
        "ows_title"             "VIIRS Landcover" #name
        "wms_timedefault"       "2016-07-13 19:43:00" #default time
        "wms_timeitem"          "time" #time field in shapefile 
        "wms_timeextent"        "2007-08-07 15:53:00/2016-07-13 19:43:00/PT1H" #extent
    END # METADATA
    NAME "VIIRS Landcover" #name
    GROUP VIIRS #group
    
    include "includes/projections/3338.include.map" #projection definition

    FILTER ([time] = "2016-07-13 19:43:00")  #set to default time

    STATUS ON
    TYPE RASTER
  END # LAYER

```
* Then test via command line or qgis with time plug in.
.* Sample url would look something like this:
..* http://spam.gina.alaska.edu/cimes/example_time?TIME=2016-07-14T01:00:00/2016-07-15T01:00:00&SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&BBOX=-1005890.51145988353528082,489978.97281411895528436,1601965.55439768708311021,2622408.19556628772988915&CRS=EPSG:3338&WIDTH=1119&HEIGHT=915&LAYERS=VIIRS%20Landcover&STYLES=&FORMAT=image/png&DPI=72&MAP_RESOLUTION=72&FORMAT_OPTIONS=dpi:72&TRANSPARENT=TRUE

The active URL is *http://spam.gina.alaska.edu/cimes/example_time* . 

