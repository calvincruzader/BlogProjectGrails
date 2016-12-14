package myawesomeblog

class YouTubeVideosTagLib {
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def video={attrs->
        def videoKey = attrs['videoKey']
        def vd = {
            object(width: attrs['width'] ?: "640", height:attrs['height'] ?: "385") {
                param(
                    name: "movie",
                    value: "http://www.youtube.com/v/=${videoKey}?fs=1&amp;amp;hl=en_US")
                param(name: "allowFullScreen", value:"true")
                param(name: "allowscriptaccess", value:"always")
                embed(src: "http://www.youtube.com/v/${videoKey}?fs=1&amp;amp;hl=en_US",
                    type: "application/x-shockwave-flash",allowscriptaccess:"always",allowfullscreen:"true",
                    width: "${attrs['width']?:'800'}", height:"${attrs['height']?:'500'}")
           }
         }

         def xml = new groovy.xml.StreamingMarkupBuilder().bind(vd)
         out << xml
    }
}
