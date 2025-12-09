import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/app_entity.dart';

final scanRepositoryProvider = Provider<ScanRepository>((ref) {
  return MockScanRepository();
});

abstract class ScanRepository {
  Future<List<AppEntity>> scanInstalledApps();
}

class MockScanRepository implements ScanRepository {
  @override
  Future<List<AppEntity>> scanInstalledApps() async {
    // Simulate network/scanning delay
    await Future.delayed(const Duration(seconds: 2));

    return [
      const AppEntity(
        id: 'com.instagram.android',
        name: 'Instagram',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/2048px-Instagram_logo_2016.svg.png',
        dangerLevel: 3,
        category: 'Sosyal',
        usageLimit: Duration(minutes: 15),
      ),
      const AppEntity(
        id: 'com.tiktok.android',
        name: 'TikTok',
        iconUrl: 'https://sf-tb-sg.ibytedtos.com/obj/eden-sg/uhtyvueh7nulogpoguhm/tiktok-icon2.png',
        dangerLevel: 3,
        category: 'Eğlence',
        usageLimit: Duration(minutes: 15),
      ),
      const AppEntity(
        id: 'com.google.android.youtube',
        name: 'YouTube',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/1024px-YouTube_full-color_icon_%282017%29.svg.png',
        dangerLevel: 2,
        category: 'Video',
        usageLimit: Duration(minutes: 30),
      ),
      const AppEntity(
        id: 'com.whatsapp',
        name: 'WhatsApp',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/2044px-WhatsApp.svg.png',
        dangerLevel: 2,
        category: 'İletişim',
        usageLimit: Duration(minutes: 45),
      ),
      const AppEntity(
        id: 'com.snapchat.android',
        name: 'Snapchat',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/en/thumb/c/c4/Snapchat_logo.svg/1024px-Snapchat_logo.svg.png',
        dangerLevel: 3,
        category: 'Sosyal',
        usageLimit: Duration(minutes: 15),
      ),
      const AppEntity(
        id: 'com.twitter.android',
        name: 'X (Twitter)',
        iconUrl: '',
        dangerLevel: 3,
        category: 'Haberler & Dergiler',
        usageLimit: Duration(minutes: 30),
      ),
      const AppEntity(
        id: 'com.facebook.katana',
        name: 'Facebook',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png',
        dangerLevel: 3,
        category: 'Sosyal',
        usageLimit: Duration(minutes: 15),
      ),
      const AppEntity(
        id: 'com.pinterest',
        name: 'Pinterest',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/0/08/Pinterest-logo.png',
        dangerLevel: 1,
        category: 'Yaşam Tarzı',
        usageLimit: Duration(hours: 1),
      ),
      const AppEntity(
        id: 'com.reddit.frontpage',
        name: 'Reddit',
        iconUrl: '',
        dangerLevel: 2,
        category: 'Haberler & Dergiler',
        usageLimit: Duration(minutes: 40),
      ),
      const AppEntity(
        id: 'com.linkedin.android',
        name: 'LinkedIn',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/LinkedIn_logo_initials.png/600px-LinkedIn_logo_initials.png',
        dangerLevel: 1,
        category: 'İş',
        usageLimit: Duration(hours: 2),
      ),
      const AppEntity(
        id: 'com.netflix.mediaclient',
        name: 'Netflix',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Netflix_2015_logo.svg/2560px-Netflix_2015_logo.svg.png',
        dangerLevel: 2,
        category: 'Eğlence',
        usageLimit: Duration(hours: 1, minutes: 30),
      ),
      const AppEntity(
        id: 'com.spotify.music',
        name: 'Spotify',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Spotify_logo_without_text.svg/2048px-Spotify_logo_without_text.svg.png',
        dangerLevel: 1,
        category: 'Müzik',
        usageLimit: Duration(hours: 4),
      ),
      const AppEntity(
        id: 'com.discord',
        name: 'Discord',
        iconUrl: '',
        dangerLevel: 2,
        category: 'İletişim',
        usageLimit: Duration(minutes: 45),
      ),
      const AppEntity(
        id: 'org.telegram.messenger',
        name: 'Telegram',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Telegram_logo.svg/2048px-Telegram_logo.svg.png',
        dangerLevel: 2,
        category: 'İletişim',
        usageLimit: Duration(minutes: 45),
      ),
      const AppEntity(
        id: 'com.google.android.gm',
        name: 'Gmail',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Gmail_icon_%282020%29.svg/2560px-Gmail_icon_%282020%29.svg.png',
        dangerLevel: 1,
        category: 'Verimlilik',
        usageLimit: Duration(hours: 1),
      ),
      const AppEntity(
        id: 'com.google.android.apps.maps',
        name: 'Google Maps',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Google_Maps_icon_%282020%29.svg/2048px-Google_Maps_icon_%282020%29.svg.png',
        dangerLevel: 1,
        category: 'Seyahat',
        usageLimit: Duration(hours: 1),
      ),
      const AppEntity(
        id: 'com.ubercab',
        name: 'Uber',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Uber_logo_2018.png/1200px-Uber_logo_2018.png',
        dangerLevel: 1,
        category: 'Seyahat',
        usageLimit: Duration(hours: 1),
      ),
      const AppEntity(
        id: 'com.slack',
        name: 'Slack',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Slack_icon_2019.svg/2048px-Slack_icon_2019.svg.png',
        dangerLevel: 1,
        category: 'İş',
        usageLimit: Duration(hours: 3),
      ),
      const AppEntity(
        id: 'us.zoom.videomeetings',
        name: 'Zoom',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Zoom_Communications_Logo.svg/2560px-Zoom_Communications_Logo.svg.png',
        dangerLevel: 1,
        category: 'İş',
        usageLimit: Duration(hours: 3),
      ),
      const AppEntity(
        id: 'com.duolingo',
        name: 'Duolingo',
        iconUrl: '',
        dangerLevel: 1,
        category: 'Eğitim',
        usageLimit: Duration(hours: 1),
      ),
      const AppEntity(
        id: 'com.tinder',
        name: 'Tinder',
        iconUrl: '',
        dangerLevel: 3,
        category: 'Yaşam Tarzı',
        usageLimit: Duration(minutes: 20),
      ),
      const AppEntity(
        id: 'com.bumble.app',
        name: 'Bumble',
        iconUrl: '',
        dangerLevel: 2,
        category: 'Yaşam Tarzı',
        usageLimit: Duration(minutes: 35),
      ),
       const AppEntity(
        id: 'com.apple.calculator',
        name: 'Calculator',
        iconUrl: '',
        dangerLevel: 1,
        category: 'Araçlar',
        usageLimit: Duration(hours: 1),
      ),
    ];
  }
}
