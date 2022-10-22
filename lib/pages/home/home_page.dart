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
      body: ListView(
        children: [
          Product(
            halalStatus: HalalStatus.halal,
            title: 'Dr. Gerard',
            scanned: 'Aalambek',
            reviewed: 'Kurmanbek',
            url:
                'https://amico.market/cache/images/zoom/2019/img_g_cron_2341987-5f9d3cedd1ae06.43272449.jpg',
          ),
          Product(
            halalStatus: HalalStatus.haram,
            title: 'Mirinda',
            scanned: 'Turar',
            reviewed: 'Alinur',
            url:
                'https://sklep.spolemkielce.pl/wp-content/uploads/2020/09/mirinda-11.png',
          ),
          Product(
            halalStatus: HalalStatus.mushbooh,
            title: 'Mullermilch',
            scanned: 'Ulan',
            reviewed: 'Uson',
            url:
                'https://www.konsum-leipzig.de/media/image/c8/1e/3f/DV019_42114321_VOR1bt8wmOBQXmGC.png',
          ),
        ],
      ),
    );
  }
}
