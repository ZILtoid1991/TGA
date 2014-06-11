module tga.model.types;

struct Image {
    Header  header;
    ubyte[] id;
    Pixel[] colorMap;
    Pixel[] pixels;
}


struct Pixel {
    ubyte[4] bytes;  // BGRA

    @property ref auto r() inout { return bytes[2]; }
    @property ref auto g() inout { return bytes[1]; }
    @property ref auto b() inout { return bytes[0]; }
    @property ref auto a() inout { return bytes[3]; }
}


struct Header {
    ubyte           idLength;
    ColorMapType    colorMapType;
    ImageType       imageType;
    ushort          colorMapOffset;     // index of first color map entry
    ushort          colorMapLength;     // number of color map entries
    ubyte           colorMapDepth;      // bits per pixel (entry)
    ushort          xOrigin;
    ushort          yOrigin;
    ushort          width;
    ushort          height;
    ubyte           pixelDepth;         // bits per pixel
    ubyte           imageDescriptor;
}


enum ColorMapType : ubyte { 
    NOT_PRESENT = 0,
    PRESENT     = 1
};


enum ImageType : ubyte {
    NO_DATA                 = 0,
    UNCOMPRESSED_MAPPED     = 1,
    UNCOMPRESSED_TRUE_COLOR = 2,
    UNCOMPRESSED_GRAYSCALE  = 3,
    COMPRESSED_MAPPED       = 9,
    COMPRESSED_TRUE_COLOR   = 10,
    COMPRESSED_GRAYSCALE    = 11
};

enum ImageOrigin { 
    BOTTOM_LEFT = 0,
    TOP_LEFT    = 1
};

enum PixelOrder { 
    LEFT_TO_RIGHT = 0,
    RIGHT_TO_LEFT = 1 
};
