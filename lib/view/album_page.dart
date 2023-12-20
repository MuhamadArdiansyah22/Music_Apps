import 'package:flutter/material.dart';
import 'package:music_apps/constants/colors.dart';
import 'package:music_apps/json/songs_json.dart';
import 'package:music_apps/view/play_music_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotify/spotify.dart' as spotify;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:spotify/spotify.dart';

void main() async {
  String clientId = '08fc44330af8433db0cf9ee8d9ee7984';
  String clientSecret = 'b5f7dde5b3ca4bd0ad2e65a6e9f5cda2';
  final credentials = SpotifyApiCredentials(clientId, clientSecret);
  final spotify = SpotifyApi(credentials);
  final artist = await spotify.artists.get('0OdUWJ0sBjDrqHygGUXeCF');
}
// const token =
//     'BQDsn-1V_4XGTTMNHQxhfniM-a2DD8ZX3eovaKqmYJxWIMSDMhiy9U_0fOH_pc3ugj0KA-9xoKc6j0BUr-e-bcib_JdJZHYhABEIYxtTts16UXDYTk1RF6sv1Hda50JH0DrnO2lIdhX404uRJ5BNWTRjJs4qOu4cRy1NCEJ_BtZHgIrN9YS9-s4CJEvmAJkxmy-IhdewalsetdSLTW51coJ17L4e_PfgkWiLCoIL-I-xG86IkEqeejG_zqH4NjeRaG3_gDhr7bI6iq7uhoGgO9l6';

// Future<Map<String, dynamic>> fetchWebApi(
//     String endpoint, String method, dynamic body) async {
//   final res = await http.post(
//     Uri.parse('https://api.spotify.com/$endpoint'),
//     headers: {
//       'Authorization': 'Bearer $token',
//     },
//     body: jsonEncode(body),
//   );
//   return jsonDecode(res.body);
// }

// final tracksUri = [
//   'spotify:track:1g8hAGS8LJJQxMbtiz3AXU',
//   'spotify:track:4VrWlk8IQxevMvERoX08iC',
//   'spotify:track:1oew3nFNY3vMacJAsvry0S',
//   'spotify:track:7fe8Off9JgOBJYTxCGQQTZ',
//   'spotify:track:3x3gpprjqh4kJ37sHFQWtV',
//   'spotify:track:7DQygUzU3ah8qyOY5Y0XsN',
//   'spotify:track:3RPluDmYBZz16fzJdLxezy',
//   'spotify:track:3BPogo8LQS0IbKCdqvmHJH',
//   'spotify:track:27xvsEVJolDpEDy5PtD0hq',
//   'spotify:track:1zbRIIyVkMB8GeDieYx7xR'
// ];

// Future<Map<String, dynamic>> createPlaylist(List<String> tracksUri) async {
//   final userResponse = await fetchWebApi('v1/me', 'GET', null);
//   final user_id = userResponse['id'];

//   final playlist = await fetchWebApi('v1/users/$user_id/playlists', 'POST', {
//     "name": "My recommendation playlist",
//     "description": "Playlist created by the tutorial on developer.spotify.com",
//     "public": false
//   });

//   await fetchWebApi(
//       'v1/playlists/${playlist['id']}/tracks?uris=${tracksUri.join(',')}',
//       'POST',
//       null);

//   return playlist;
// }

// void main() async {
//   final createdPlaylist = await createPlaylist(tracksUri);
//   print('${createdPlaylist['name']}, ${createdPlaylist['id']}');
// }

// void main() async {
//   final clientId = '08fc44330af8433db0cf9ee8d9ee7984';
//   final clientSecret = 'b5f7dde5b3ca4bd0ad2e65a6e9f5cda2';
//   final credentials = base64.encode(utf8.encode('$clientId:$clientSecret'));

//   // Mendapatkan access token dari Spotify
//   final tokenResponse = await http.post(
//     Uri.parse('https://accounts.spotify.com/api/token'),
//     headers: {
//       HttpHeaders.authorizationHeader: 'Basic $credentials',
//       HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
//     },
//     body: {
//       'grant_type': 'client_credentials',
//     },
//   );

//   if (tokenResponse.statusCode == 200) {
//     final tokenJson = json.decode(tokenResponse.body);
//     final accessToken = tokenJson['access_token'];

//     // Menggunakan access token untuk mengakses data dari API Spotify
//     final response = await http.get(
//       Uri.parse('https://api.spotify.com/v1/albums/4aawyAB9vmqN3uQ7FjRGTy'),
//       headers: {
//         HttpHeaders.authorizationHeader: 'Bearer $accessToken',
//       },
//     );

//     if (response.statusCode == 200) {
//       // Permintaan berhasil, lakukan sesuatu dengan data yang diterima
//       print(response.body);
//     } else {
//       // Permintaan gagal, tangani kesalahan
//       print('Error: ${response.statusCode}');
//     }
//   } else {
//     // Gagal mendapatkan access token, tangani kesalahan
//     print('Error: ${tokenResponse.statusCode}');
//   }
// }

class AlbumPage extends StatefulWidget {
  final dynamic song;
  const AlbumPage({super.key, this.song});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  getBody() {
    var size = MediaQuery.of(context).size;
    List songAlbums = widget.song['songs'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.song['img']),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.song['title'],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        child: Text(
                          'Subscribe',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: List.generate(songs.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: MusicPage(
                                      title: songs[index]['title'],
                                      color: songs[index]['color'],
                                      description: songs[index]['description'],
                                      img: songs[index]['img'],
                                      songUrl: songs[index]['song_url'],
                                    ),
                                    type: PageTransitionType.scale));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(songs[index]['img']),
                                        fit: BoxFit.cover),
                                    color: ColorConstants.primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                songs[index]['title'],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                  width: size.width - 210,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        songs[index]['song_count'],
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        songs[index]['date'],
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: List.generate(songAlbums.length, (index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                alignment: Alignment.bottomCenter,
                                child: MusicPage(
                                  title: widget.song['title'],
                                  color: widget.song['color'],
                                  description: widget.song['description'],
                                  img: widget.song['img'],
                                  songUrl: widget.song['song_url'],
                                ),
                                type: PageTransitionType.scale));
                      },
                      child: Row(
                        children: [
                          Container(
                            width: (size.width - 60) * 0.77,
                            child: Text(
                              "${index + 1} " + songAlbums[index]['title'],
                              style: TextStyle(
                                color: ColorConstants.starterWhite,
                              ),
                            ),
                          ),
                          Container(
                            width: (size.width - 60) * 0.23,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  songAlbums[index]['duration'],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.withOpacity(0.8),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: ColorConstants.starterWhite,
                                      size: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
