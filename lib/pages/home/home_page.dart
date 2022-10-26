import 'package:flutter/material.dart';
import 'package:halal_scan/utility/halal_status.dart';
import 'package:halal_scan/widgets/appbar.dart';
import 'package:halal_scan/widgets/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Halal-Scan'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Product(
              halalStatus: HalalStatus.halal,
              title: 'Dr. Gerard',
              scanned: 'Aalambek',
              reviewed: 'Kurmanbek',
              dateTime: DateTime.parse('2022-10-20 03:04:05'),
              url:
                  'https://amico.market/cache/images/zoom/2019/img_g_cron_2341987-5f9d3cedd1ae06.43272449.jpg',
            ),
            Product(
              halalStatus: HalalStatus.haram,
              title: 'Mirinda',
              scanned: 'Turar',
              reviewed: 'Alinur',
              dateTime: DateTime.parse('2022-10-24 12:40:05'),
              url:
                  'https://sklep.spolemkielce.pl/wp-content/uploads/2020/09/mirinda-11.png',
            ),
            Product(
              halalStatus: HalalStatus.mushbooh,
              title: 'Mullermilch',
              scanned: 'Ulan',
              reviewed: 'Uson',
              dateTime: DateTime.parse('2022-10-25 09:54:05'),
              url:
                  'https://www.konsum-leipzig.de/media/image/c8/1e/3f/DV019_42114321_VOR1bt8wmOBQXmGC.png',
            ),
            Product(
              halalStatus: HalalStatus.halal,
              title: 'Iron True',
              scanned: 'Iskhak',
              reviewed: 'Iskhak',
              url:
                  'https://firebasestorage.googleapis.com/v0/b/halal-scan-91706.appspot.com/o/photo_2022-10-25_14-00-07.jpg?alt=media&token=f4031b4c-0c24-42fd-8a30-095df14cc8c9',
              dateTime: DateTime.parse('2022-10-25 14:01:05'),
            ),
            Product(
              halalStatus: HalalStatus.halal,
              title: 'Dr. Gerard',
              scanned: 'Aalambek',
              reviewed: 'Kurmanbek',
              dateTime: DateTime.parse('2022-10-20 03:04:05'),
              url:
                  'https://amico.market/cache/images/zoom/2019/img_g_cron_2341987-5f9d3cedd1ae06.43272449.jpg',
            ),
            Product(
              halalStatus: HalalStatus.haram,
              title: 'Mirinda',
              scanned: 'Turar',
              reviewed: 'Alinur',
              dateTime: DateTime.parse('2022-10-24 12:40:05'),
              url:
                  'https://sklep.spolemkielce.pl/wp-content/uploads/2020/09/mirinda-11.png',
            ),
            Product(
              halalStatus: HalalStatus.mushbooh,
              title: 'Mullermilch',
              scanned: 'Ulan',
              reviewed: 'Uson',
              dateTime: DateTime.parse('2022-10-25 09:54:05'),
              url:
                  'https://www.konsum-leipzig.de/media/image/c8/1e/3f/DV019_42114321_VOR1bt8wmOBQXmGC.png',
            ),
            Product(
              halalStatus: HalalStatus.halal,
              title: 'Iron True',
              scanned: 'Iskhak',
              reviewed: 'Iskhak',
              url:
                  'https://firebasestorage.googleapis.com/v0/b/halal-scan-91706.appspot.com/o/photo_2022-10-25_14-00-07.jpg?alt=media&token=f4031b4c-0c24-42fd-8a30-095df14cc8c9',
              dateTime: DateTime.parse('2022-10-25 14:01:05'),
            ),
            Product(
              halalStatus: HalalStatus.halal,
              title: 'Dr. Gerard',
              scanned: 'Aalambek',
              reviewed: 'Kurmanbek',
              dateTime: DateTime.parse('2022-10-20 03:04:05'),
              url:
                  'https://amico.market/cache/images/zoom/2019/img_g_cron_2341987-5f9d3cedd1ae06.43272449.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
