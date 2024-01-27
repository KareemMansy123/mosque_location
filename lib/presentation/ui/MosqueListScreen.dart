import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../../core/getit/setupGetIt.dart';
import '../../data/services/LocationService.dart';
import 'MosqueMapScreen.dart';
import '../bloc/mosque_list/mosque_bloc.dart';

class MosqueListPage extends StatelessWidget {
  const MosqueListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nearby Mosques')),
      body: FutureBuilder<Position>(
        future: LocationService().getCurrentLocation(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No location data available.'));
          }

          final currentLocation = snapshot.data!;
          return BlocProvider(
            create: (context) => getIt<MosqueBloc>()
              // ..add(FetchMosques(currentLocation.latitude, currentLocation.longitude)),
            // for testing
            ..add(FetchMosques(12.3682265169693, 76.6509528432083)),
            child: BlocBuilder<MosqueBloc, MosqueState>(
              builder: (context, state) {
                if (state is MosqueLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MosqueLoaded) {
                  return ListView.builder(
                    itemCount: state.mosques.length,
                    itemBuilder: (context, index) {
                      final mosque = state.mosques[index];

                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading:
                          const Icon(Icons.location_on, color: Colors.blue),
                          title: Text(
                            mosque.masjidName ?? 'Unknown Mosque',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(mosque.masjidAddress?.street ?? 'No address'),
                              Text(mosque.masjidAddress?.locality ?? ''),
                              if (mosque.masjidTimings != null) ...[
                                const Divider(),
                                Text('Fajr: ${mosque.masjidTimings?.fajr ?? 'N/A'}'),
                                Text('Dhuhr: ${mosque.masjidTimings?.zuhr ?? 'N/A'}'),
                              ],
                            ],
                          ),
                          trailing: mosque.distance != null
                              ? Text('${mosque.distance} km')
                              : null,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MosqueMapScreen(
                                  mosques: [state.mosques[index]],
                                  // Pass only the selected mosque
                                  initialLocation: LatLng(
                                    state.mosques[index].masjidLocation!.coordinates![1],
                                    state.mosques[index].masjidLocation!.coordinates![0],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else if (state is MosqueError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text("Start searching for mosques"));
              },
            ),
          );
        },
      ),
    );
  }
}
