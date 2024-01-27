

class Mosque {
  final String? id;
  final String? masjidId;
  final String? masjidName;
  final MasjidAddress? masjidAddress;
  final MasjidLocation? masjidLocation;
  final MasjidTimings? masjidTimings;
  final String? masjidCreatedby;
  final String? masjidModifiedby;
  final String? masjidCreatedon;
  final String? masjidModifiedon;
  final String? masjidPic;
  final String? distance;
  final bool? notMasjid;

  Mosque({
    this.id,
    this.masjidId,
    this.masjidName,
    this.masjidAddress,
    this.masjidLocation,
    this.masjidTimings,
    this.masjidCreatedby,
    this.masjidModifiedby,
    this.masjidCreatedon,
    this.masjidModifiedon,
    this.masjidPic,
    this.distance,
    this.notMasjid,
  });

  factory Mosque.fromJson(Map<String, dynamic> json) {
    return Mosque(
      id: json['_id'],
      masjidId: json['masjidId'],
      masjidName: json['masjidName'],
      masjidAddress: json['masjidAddress'] != null ? MasjidAddress.fromJson(json['masjidAddress']) : null,
      masjidLocation: json['masjidLocation'] != null ? MasjidLocation.fromJson(json['masjidLocation']) : null,
      masjidTimings: json['masjidTimings'] != null ? MasjidTimings.fromJson(json['masjidTimings']) : null,
      masjidCreatedby: json['masjidCreatedby'],
      masjidModifiedby: json['masjidModifiedby'],
      masjidCreatedon: json['masjidCreatedon'],
      masjidModifiedon: json['masjidModifiedon'],
      masjidPic: json['masjidPic'],
      distance: json['Distance'],
      notMasjid: json['notMasjid'],
    );
  }
}

class MasjidAddress {
  final String? description;
  final String? street;
  final String? zipcode;
  final String? country;
  final String? state;
  final String? city;
  final String? locality;
  final String? phone;
  final String? googlePlaceId;

  MasjidAddress({
    this.description,
    this.street,
    this.zipcode,
    this.country,
    this.state,
    this.city,
    this.locality,
    this.phone,
    this.googlePlaceId,
  });

  factory MasjidAddress.fromJson(Map<String, dynamic> json) {
    return MasjidAddress(
      description: json['description'],
      street: json['street'],
      zipcode: json['zipcode'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      locality: json['locality'],
      phone: json['phone'],
      googlePlaceId: json['googlePlaceId'],
    );
  }
}

class MasjidLocation {
  final String? type;
  final List<double>? coordinates;

  MasjidLocation({this.type, this.coordinates});

  factory MasjidLocation.fromJson(Map<String, dynamic> json) {
    return MasjidLocation(
      type: json['type'],
      coordinates: json['coordinates'] != null ? List<double>.from(json['coordinates'].map((x) => x.toDouble())) : null,
    );
  }
}

class MasjidTimings {
  final String? fajr;
  final String? zuhr;
  final String? asr;
  final String? maghrib;
  final String? isha;
  final String? jumah;

  MasjidTimings({
    this.fajr,
    this.zuhr,
    this.asr,
    this.maghrib,
    this.isha,
    this.jumah,
  });

  factory MasjidTimings.fromJson(Map<String, dynamic> json) {
    return MasjidTimings(
      fajr: json['fajr'],
      zuhr: json['zuhr'],
      asr: json['asr'],
      maghrib: json['maghrib'],
      isha: json['isha'],
      jumah: json['jumah'],
    );
  }
}
