import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/home/controllers/home_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ChartTotalPelatihanSertifDosen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  ChartTotalPelatihanSertifDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Teks Penjelasan
            const Text(
              'Pelatihan dan Sertifikasi Dosen',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10), // Memberi jarak sebelum grafik

            Container(
              height: 150,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white70,
              ),
              child: Obx(() => SfRadialGauge(
                    axes: [
                      // Radial Axis untuk Pelatihan (Layer terluar)
                      RadialAxis(
                        minimum: 0,
                        maximum: controller.getTotalPelatihanDosen().toDouble() +
                            10, // sedikit margin
                        radiusFactor:
                            0.95, // Mengurangi ukuran untuk memberikan ruang
                        startAngle: 90,  // Mengatur titik awal di kiri bawah
                        endAngle: 390,    // Mengatur titik akhir di kiri bawah
                        showLabels: false, // Hilangkan angka tengah
                        showTicks: false, // Hilangkan garis tengah
                        axisLineStyle: const AxisLineStyle(
                          cornerStyle: CornerStyle.bothCurve,
                        ),
                        pointers: [
                          RangePointer(
                            value: controller.getTotalPelatihanDosen().toDouble(),
                            width: 10,
                            cornerStyle: CornerStyle.bothCurve,
                            color: Colors.redAccent,
                          ),
                        ],
                      ),
                      // Radial Axis untuk Sertifikasi (Layer dalam)
                      RadialAxis(
                        minimum: 0,
                        maximum: controller.getTotalSertifikasiDosen().toDouble() +
                            10, // sedikit margin
                        radiusFactor:
                            0.7, // Radius lebih kecil agar berada di dalam Pelatihan
                        startAngle: 90,  // Mengatur titik awal di kiri bawah
                        endAngle: 390,    // Mengatur titik akhir di kiri bawah
                        showLabels: false, // Hilangkan angka tengah
                        showTicks: false, // Hilangkan garis tengah
                        axisLineStyle: const AxisLineStyle(
                          cornerStyle: CornerStyle.bothCurve,
                        ),
                        pointers: [
                          RangePointer(
                            value: controller.getTotalSertifikasiDosen().toDouble(),
                            width: 10,
                            cornerStyle: CornerStyle.bothCurve,
                            color: Colors.blueGrey,
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            // Menambahkan Legenda di bawah grafik
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LegendItem(
                  color: Colors.redAccent,
                  text: 'Pelatihan',
                  count: controller.getTotalPelatihanDosen().toString(),
                ),
                LegendItem(
                  color: Colors.blueGrey,
                  text: 'Sertifikasi',
                  count: controller.getTotalSertifikasiDosen().toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk Legend Item dengan jumlah
class LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  final String count;

  const LegendItem(
      {super.key,
      required this.color,
      required this.text,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '$text ($count)',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
