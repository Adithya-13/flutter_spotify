import 'package:flutter_spotify/data/entities/entities.dart';

class DummyData {
  static RecentlyPlayedEntity getRecentlyPlayedList() =>
      RecentlyPlayedEntity(recentlyPlayedList: [
        PlaylistRecentlyPlayedItemEntity(
          imageSongs: [
            "https://upload.wikimedia.org/wikipedia/id/2/2f/Billie_Eilish_-_Don%27t_Smile_at_Me.png",
            "https://i.pinimg.com/originals/07/14/35/071435f19718a2d3c0a368f26c1fad6c.jpg",
            "https://images-na.ssl-images-amazon.com/images/I/61ArgJHOzOL._AC_SL1001_.jpg",
            "https://upload.wikimedia.org/wikipedia/en/4/45/Divide_cover.png",
          ],
          name: "U",
          ownerPlaylist: "Aditputrafirmansyah",
        ),
        PlaylistRecentlyPlayedItemEntity(
          imageSongs: [
            "https://upload.wikimedia.org/wikipedia/id/2/2f/Billie_Eilish_-_Don%27t_Smile_at_Me.png",
            "https://i.pinimg.com/originals/07/14/35/071435f19718a2d3c0a368f26c1fad6c.jpg",
            "https://images-na.ssl-images-amazon.com/images/I/61ArgJHOzOL._AC_SL1001_.jpg",
            "https://upload.wikimedia.org/wikipedia/en/4/45/Divide_cover.png",
          ],
          name: "SadBoy",
          ownerPlaylist: "Aditputrafirmansyah",
        ),
        ArtistRecentlyPlayedItemEntity(
          avatarImage:
              "https://matamatamusik.com/wp-content/uploads/2020/06/Billie-Eilish-nyengir.jpg",
          name: "Billie Ellish",
        ),
        SongRecentlyPlayedItemEntity(
          coverSongImage:
              "https://1.bp.blogspot.com/-8fjS6fZHutg/XoHHr60I5BI/AAAAAAAAA5Y/Oi9eO4ctyZsDL6Clidd0TsFFNXEtUS9KACLcBGAsYHQ/s200/PCCA-4822.jpg",
          name: "Pretender",
        ),
        SongRecentlyPlayedItemEntity(
          coverSongImage:
              "https://upload.wikimedia.org/wikipedia/en/3/3e/Powfu_-_Death_Bed.png",
          name: "death bed (coffee for your head)",
        ),
        PlaylistRecentlyPlayedItemEntity(
          imageSongs: [
            "https://upload.wikimedia.org/wikipedia/id/2/2f/Billie_Eilish_-_Don%27t_Smile_at_Me.png",
            "https://i.pinimg.com/originals/07/14/35/071435f19718a2d3c0a368f26c1fad6c.jpg",
            "https://images-na.ssl-images-amazon.com/images/I/61ArgJHOzOL._AC_SL1001_.jpg",
            "https://upload.wikimedia.org/wikipedia/en/4/45/Divide_cover.png",
          ],
          name: "West",
          ownerPlaylist: "xfaahrm",
        ),
        PlaylistRecentlyPlayedItemEntity(
          imageSongs: [
            "https://upload.wikimedia.org/wikipedia/id/2/2f/Billie_Eilish_-_Don%27t_Smile_at_Me.png",
            "https://i.pinimg.com/originals/07/14/35/071435f19718a2d3c0a368f26c1fad6c.jpg",
            "https://images-na.ssl-images-amazon.com/images/I/61ArgJHOzOL._AC_SL1001_.jpg",
            "https://upload.wikimedia.org/wikipedia/en/4/45/Divide_cover.png",
          ],
          name: "Yow",
          ownerPlaylist: "xfaahrm",
        ),
        PlaylistRecentlyPlayedItemEntity(
          imageSongs: [
            "https://upload.wikimedia.org/wikipedia/id/2/2f/Billie_Eilish_-_Don%27t_Smile_at_Me.png",
            "https://i.pinimg.com/originals/07/14/35/071435f19718a2d3c0a368f26c1fad6c.jpg",
            "https://images-na.ssl-images-amazon.com/images/I/61ArgJHOzOL._AC_SL1001_.jpg",
            "https://upload.wikimedia.org/wikipedia/en/4/45/Divide_cover.png",
          ],
          name: "Korean",
          ownerPlaylist: "xfaahrm",
        ),
        SongRecentlyPlayedItemEntity(
          coverSongImage:
              "https://i1.sndcdn.com/artworks-UZsQHqaNnKkDy891-4MU59w-t500x500.jpg",
          name: "eyes blue x heather - slowed",
        ),
      ]);

  static UserGenreEntity getUserGenreList() => UserGenreEntity(userGenreList: [
        GenreItemEntity(
          name: "Pop",
          coverAlbum:
              "https://i.pinimg.com/originals/4e/b4/f8/4eb4f8a7e04b57e74914fc46e013ac40.jpg",
        ),
        GenreItemEntity(
          name: "J-Tracks",
          coverAlbum:
              "https://upload.wikimedia.org/wikipedia/en/c/c2/Radwimps_Your_Name_Album_Cover.jpg",
        ),
        GenreItemEntity(
          name: "Hip Hop",
          coverAlbum:
              "https://i.pinimg.com/736x/9a/06/39/9a063997299f58d5efe4765af4c12891.jpg",
        ),
        GenreItemEntity(
          name: "Indie",
          coverAlbum:
              "https://i.pinimg.com/originals/18/1a/38/181a38b43dc62c9d091f657166a956e9.jpg",
        ),
      ]);

  static AllGenreEntity getAllGenreList() => AllGenreEntity(allGenreList: [
        GenreItemEntity(
          name: "Podcasts",
          coverAlbum: "https://i.pinimg.com/originals/18/1a/38/181a38b43dc62c9d091f657166a956e9.jpg",
        ),
        GenreItemEntity(
          name: "Made for you",
          coverAlbum: "https://i.pinimg.com/originals/dc/75/62/dc75620a85349b109b529e0f555897ca.jpg",
        ),
        GenreItemEntity(
          name: "At Home",
          coverAlbum: "https://i.pinimg.com/originals/e9/6b/0d/e96b0ddf71b7c802fae4eb00a4433ee3.jpg",
        ),
        GenreItemEntity(
          name: "Concerts",
          coverAlbum: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/artistic-desert-indie-album-song-cover-art-design-template-a82f1df5f64521d0a382c4d7f1bc491a_screen.jpg?ts=1597477501",
        ),
        GenreItemEntity(
          name: "Charts",
          coverAlbum: "https://www.nme.com/wp-content/uploads/2016/10/2014JoyDivision_UnknownPleasures_150414-3.jpg",
        ),
        GenreItemEntity(
          name: "Radio",
          coverAlbum: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/pop-art-album-cover-template-design-f239d8882deebb25c673a51c910bcb73_screen.jpg?ts=1590273355",
        ),
        GenreItemEntity(
          name: "New Releases",
          coverAlbum: "https://i.pinimg.com/originals/7b/6c/73/7b6c73b0bffdc0a3373d54f6584c4d72.jpg",
        ),
        GenreItemEntity(
          name: "Discover",
          coverAlbum: "https://i.pinimg.com/originals/3a/f0/e5/3af0e55ea66ea69e35145fb108b4a636.jpg",
        ),
        GenreItemEntity(
          name: "Ramadan",
          coverAlbum: "https://assets-2.placeit.net/smart_templates/5fddb703f1f6868cda66c4f774aaa34f/assets/preview_147a95e011eb1a6e38ec09fd97bb4c9a.jpg",
        ),
        GenreItemEntity(
          name: "Musik Indonesia",
          coverAlbum: "https://images-platform.99static.com/Ht3JYhmC_rXqTaKTmjlUqB3J7iQ=/3x3:2040x2040/500x500/top/smart/99designs-contests-attachments/89/89297/attachment_89297490",
        ),
        GenreItemEntity(
          name: "RADAR",
          coverAlbum: "https://www.nme.com/wp-content/uploads/2016/10/2014Nirvana_Nevermind_150414-2.jpg",
        ),
        GenreItemEntity(
          name: "K-Pop",
          coverAlbum: "https://cdn.shortpixel.ai/client/q_glossy,ret_img/https://creativesfeed.com/wp-content/uploads/2018/08/Aleixos-by-Vinicius-Gut.jpg",
        ),
        GenreItemEntity(
          name: "Stop Asian Hate",
          coverAlbum: "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/133065641/original/53f1733f44d2a0f42cf7640ce78477f4bf5d0077/create-amazing-custom-hiphop-and-indie-album-covers.png",
        ),
        GenreItemEntity(
          name: "Rock",
          coverAlbum: "https://cdn.dribbble.com/users/31348/screenshots/5383318/aid_vinyl_19_4x.jpg",
        ),
        GenreItemEntity(
          name: "Mood",
          coverAlbum: "https://cdn.shortpixel.ai/client/q_glossy,ret_img/https://creativesfeed.com/wp-content/uploads/2018/08/Art-vs-Science-by-Andrew-Fairclough.jpg",
        ),
        GenreItemEntity(
          name: "Higher Ground",
          coverAlbum: "https://i.pinimg.com/originals/42/d0/c0/42d0c0cdcaddb42a58ff369e9174d4cb.jpg",
        ),
        GenreItemEntity(
          name: "EQUAL",
          coverAlbum: "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/04199582915659.5d2c920de99c9.jpg",
        ),
        GenreItemEntity(
          name: "Dance / Electronic",
          coverAlbum: "https://i.redd.it/8hfteahorpx41.png",
        ),
        GenreItemEntity(
          name: "Romance",
          coverAlbum: "https://www.nme.com/wp-content/uploads/2016/10/08.pixies_doolittle__161013-5.jpg",
        ),
        GenreItemEntity(
          name: "Sleep",
          coverAlbum: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/cool-album-cover-image-design-template-62fca565fdcbb25ced8e900c54d61835_screen.jpg?ts=1561530580",
        ),
        GenreItemEntity(
          name: "R&B",
          coverAlbum: "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/134145054/original/24474b46a94d785e903527d74cf29d9bb3481c90/create-cd-album-cover-for-music-indie.png",
        ),
        GenreItemEntity(
          name: "Chill",
          coverAlbum: "https://www.nme.com/wp-content/uploads/2016/09/LouReedRockRollAnimal600.jpg",
        ),
        GenreItemEntity(
          name: "Trending",
          coverAlbum: "https://www.aimm.edu/hubfs/Blog%20Images/Top%2010%20Album%20Covers%20of%202017/Tyler%20the%20Creator-%20Flower%20boy.jpg",
        ),
        GenreItemEntity(
          name: "Jazz",
          coverAlbum: "https://butteryobread.files.wordpress.com/2011/12/db755fd9e2c84c92fcf323f6d61516051556f0e1.jpg?w=584",
        ),
        GenreItemEntity(
          name: "League of Legends",
          coverAlbum: "https://images.squarespace-cdn.com/content/v1/53b6eb62e4b06e0feb2d8e86/1607362705516-R5Q22H4FVIVPNMW8OWD7/ke17ZwdGBToddI8pDm48kOM0wi0zWgY49OChaGdbQod7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1Udq808UFTE3RUCYZpscC1JaI0xjbDb9OOCsv-L8MD1ND_7k-9-XsFQ9lvpTgv0wwCA/SamSpratt_KidCudi_ManOnTheMoon3_AlbumCover_Web.jpg?format=original",
        ),
        GenreItemEntity(
          name: "Punk",
          coverAlbum: "https://mysoundescape.files.wordpress.com/2015/10/life057_cover480.jpg",
        ),
        GenreItemEntity(
          name: "Anime",
          coverAlbum: "https://theorion.com/wp-content/uploads/2020/01/wolfparade-thinmind-cover-opt.jpg",
        ),
        GenreItemEntity(
          name: "Metal",
          coverAlbum: "https://i.redd.it/hdjcn0suv9b61.jpg",
        ),
        GenreItemEntity(
          name: "Karaoke",
          coverAlbum: "https://raito.ca/wp-content/uploads/2012/09/rockthewater.jpg",
        ),
        GenreItemEntity(
          name: "Wellness",
          coverAlbum: "https://imgix.ranker.com/node_img/62/1232929/original/in-the-aeroplane-over-the-sea-albums-photo-1?auto=format&q=60&fit=crop&fm=pjpg&w=375",
        ),
        GenreItemEntity(
          name: "Workout",
          coverAlbum: "https://dw0i2gv3d32l1.cloudfront.net/uploads/stage/stage_image/82810/optimized_large_thumb_stage.jpg",
        ),
        GenreItemEntity(
          name: "Alternative",
          coverAlbum: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-MtGZ_yjYIrB3M59v6IkPQ-bSvpMru0uegw&usqp=CAU",
        ),
        GenreItemEntity(
          name: "Classical",
          coverAlbum: "https://qodeinteractive.com/magazine/wp-content/uploads/2020/06/8-Tyler-the-Creator.jpg",
        ),
        GenreItemEntity(
          name: "Decades",
          coverAlbum: "https://www.indieisnotagenre.com/wp-content/uploads/Sam-Fender-Hypersonic-Missiles-album-cover-artwork-650x650.jpg",
        ),
      ]);
}
