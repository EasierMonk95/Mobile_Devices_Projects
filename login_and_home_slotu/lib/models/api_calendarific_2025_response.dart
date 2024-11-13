import 'dart:convert';
/// meta : {"code":200}
/// response : {"holidays":[{"name":"New Year's Day","description":"New Year’s Day is the first day of the year, or January 1, in the Gregorian calendar.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-01-01","datetime":{"year":2025,"month":1,"day":1}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/new-year-day","urlid":"colombia/new-year-day","locations":"All","states":"All"},{"name":"Epiphany","description":"Epiphany is a Christian holiday celebrated globally on January 6 each year. It commemorates two events recorded in the Bible: the three wise men’s visit to baby Jesus; and Jesus’ baptism.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-01-06","datetime":{"year":2025,"month":1,"day":6}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/the-three-wise-men-day","urlid":"colombia/the-three-wise-men-day","locations":"All","states":"All"},{"name":"Epiphany","description":"Epiphany is a Christian holiday celebrated globally on January 6 each year. It commemorates two events recorded in the Bible: the three wise men’s visit to baby Jesus; and Jesus’ baptism.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-01-06","datetime":{"year":2025,"month":1,"day":6}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/the-three-wise-men-day","urlid":"colombia/the-three-wise-men-day","locations":"All","states":"All"},{"name":"Women's Day","description":"Women's Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-03-08","datetime":{"year":2025,"month":3,"day":8}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/womens-day","urlid":"colombia/womens-day","locations":"All","states":"All"},{"name":"Saint Joseph's Day","description":"Saint Joseph's Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-03-19","datetime":{"year":2025,"month":3,"day":19}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/saint-josephs-day","urlid":"colombia/saint-josephs-day","locations":"All","states":"All"},{"name":"March Equinox","description":"March Equinox in Colombia (Bogota)","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-03-20T04:01:21-05:00","datetime":{"year":2025,"month":3,"day":20,"hour":4,"minute":1,"second":21},"timezone":{"offset":"-05:00","zoneabb":"COT","zoneoffset":-18000,"zonedst":0,"zonetotaloffset":-18000}},"type":["Season"],"primary_type":"Season","canonical_url":"https://calendarific.com/holiday/seasons/vernal-equinox","urlid":"seasons/vernal-equinox","locations":"All","states":"All"},{"name":"Saint Joseph's Day","description":"Saint Joseph's Day is a national holiday in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-03-24","datetime":{"year":2025,"month":3,"day":24}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/saint-josephs-day","urlid":"colombia/saint-josephs-day","locations":"All","states":"All"},{"name":"Palm Sunday","description":"Palm Sunday is a Christian feast that commemorates Jesus Christ’s entry into Jerusalem. It is also the start of Holy Week.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-13","datetime":{"year":2025,"month":4,"day":13}},"type":["Observance","Christian"],"primary_type":"Christian","canonical_url":"https://calendarific.com/holiday/colombia/palm-sunday","urlid":"colombia/palm-sunday","locations":"All","states":"All"},{"name":"Maundy Thursday","description":"Maundy Thursday is a Christian observance on the Thursday during Holy Week. It is the day before Good Friday.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-17","datetime":{"year":2025,"month":4,"day":17}},"type":["National holiday","Christian"],"primary_type":"Christian","canonical_url":"https://calendarific.com/holiday/colombia/maundy-thursday","urlid":"colombia/maundy-thursday","locations":"All","states":"All"},{"name":"Good Friday","description":"Good Friday is a global Christian observance two days before Easter Sunday.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-18","datetime":{"year":2025,"month":4,"day":18}},"type":["National holiday","Christian"],"primary_type":"Christian","canonical_url":"https://calendarific.com/holiday/colombia/good-friday","urlid":"colombia/good-friday","locations":"All","states":"All"},{"name":"Easter Sunday","description":"Easter Sunday commemorates Jesus Christ’s resurrection, according to Christian belief.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-20","datetime":{"year":2025,"month":4,"day":20}},"type":["Observance","Christian"],"primary_type":"Christian","canonical_url":"https://calendarific.com/holiday/colombia/easter-sunday","urlid":"colombia/easter-sunday","locations":"All","states":"All"},{"name":"Language Day","description":"Language Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-23","datetime":{"year":2025,"month":4,"day":23}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/lenguage-day","urlid":"colombia/lenguage-day","locations":"All","states":"All"},{"name":"Secretaries' Day","description":"Secretaries' Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-26","datetime":{"year":2025,"month":4,"day":26}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/secretarys-day","urlid":"colombia/secretarys-day","locations":"All","states":"All"},{"name":"Children's Day","description":"Children's Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-26","datetime":{"year":2025,"month":4,"day":26}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/childrens-day","urlid":"colombia/childrens-day","locations":"All","states":"All"},{"name":"Day of Trees","description":"Day of Trees is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-29","datetime":{"year":2025,"month":4,"day":29}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/trees-day","urlid":"colombia/trees-day","locations":"All","states":"All"},{"name":"Labor Day / May Day","description":"Labor Day, International Workers' Day, and May Day, is a day off for workers in many countries around the world.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-05-01","datetime":{"year":2025,"month":5,"day":1}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/labor-day","urlid":"colombia/labor-day","locations":"All","states":"All"},{"name":"Mothers' Day","description":"Mother’s Day celebrates the achievements and efforts of mothers and mother figures.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-05-11","datetime":{"year":2025,"month":5,"day":11}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/mothers-day","urlid":"colombia/mothers-day","locations":"All","states":"All"},{"name":"Teacher's Day","description":"Teacher's Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-05-15","datetime":{"year":2025,"month":5,"day":15}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/teachers-day","urlid":"colombia/teachers-day","locations":"All","states":"All"},{"name":"Ascension Day","description":"Ascension Day is the 40th day of Easter. It is a religious holiday that commemorates the ascension of Jesus Christ into heaven.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-02","datetime":{"year":2025,"month":6,"day":2}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/ascension-day","urlid":"colombia/ascension-day","locations":"All","states":"All"},{"name":"Fathers' Day","description":"Father’s Day celebrates fatherhood and male parenting on different dates worldwide.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-15","datetime":{"year":2025,"month":6,"day":15}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/fathers-day","urlid":"colombia/fathers-day","locations":"All","states":"All"},{"name":"Corpus Christi","description":"Corpus Christi is a Christian feast in honor of the Holy Eucharist.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-19","datetime":{"year":2025,"month":6,"day":19}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/corpus-christi","urlid":"colombia/corpus-christi","locations":"All","states":"All"},{"name":"June Solstice","description":"June Solstice in Colombia (Bogota)","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-20T21:42:15-05:00","datetime":{"year":2025,"month":6,"day":20,"hour":21,"minute":42,"second":15},"timezone":{"offset":"-05:00","zoneabb":"COT","zoneoffset":-18000,"zonedst":0,"zonetotaloffset":-18000}},"type":["Season"],"primary_type":"Season","canonical_url":"https://calendarific.com/holiday/seasons/june-solstice","urlid":"seasons/june-solstice","locations":"All","states":"All"},{"name":"Corpus Christi","description":"Corpus Christi is a Christian feast in honor of the Holy Eucharist.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-23","datetime":{"year":2025,"month":6,"day":23}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/corpus-christi","urlid":"colombia/corpus-christi","locations":"All","states":"All"},{"name":"Feast of Saint Peter and Saint Paul","description":"Feast of Saint Peter and Saint Paul is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-29","datetime":{"year":2025,"month":6,"day":29}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/saint-peter-and-saint-paul","urlid":"colombia/saint-peter-and-saint-paul","locations":"All","states":"All"},{"name":"Sacred Heart","description":"Corpus Christi is a Christian feast in honor of the Holy Eucharist.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-30","datetime":{"year":2025,"month":6,"day":30}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/sacred-heart","urlid":"colombia/sacred-heart","locations":"All","states":"All"},{"name":"Feast of Saint Peter and Saint Paul","description":"Feast of Saint Peter and Saint Paul is a national holiday in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-30","datetime":{"year":2025,"month":6,"day":30}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/saint-peter-and-saint-paul","urlid":"colombia/saint-peter-and-saint-paul","locations":"All","states":"All"},{"name":"Independence Day","description":"Independence Day is a national holiday in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-07-20","datetime":{"year":2025,"month":7,"day":20}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/independence-day","urlid":"colombia/independence-day","locations":"All","states":"All"},{"name":"Battle of Boyacá Day","description":"Battle of Boyacá Day is a national holiday in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-08-07","datetime":{"year":2025,"month":8,"day":7}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/battle-of-boyaca","urlid":"colombia/battle-of-boyaca","locations":"All","states":"All"},{"name":"Assumption of Mary","description":"The Christian feast of the Assumption of Mary is on or around Aug 15 in most countries. A few celebrate Assumption Day at other times of the year.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-08-15","datetime":{"year":2025,"month":8,"day":15}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/assumption-of-mary","urlid":"colombia/assumption-of-mary","locations":"All","states":"All"},{"name":"Assumption of Mary","description":"The Christian feast of the Assumption of Mary is on or around Aug 15 in most countries. A few celebrate Assumption Day at other times of the year.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-08-18","datetime":{"year":2025,"month":8,"day":18}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/assumption-of-mary","urlid":"colombia/assumption-of-mary","locations":"All","states":"All"},{"name":"Valentine's Day","description":"February 14 is Valentine's Day or Saint Valentine's Feast. The day of love owes its origins to ancient Roman and European Christian traditions.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-09-20","datetime":{"year":2025,"month":9,"day":20}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/saint-valentines-day","urlid":"colombia/saint-valentines-day","locations":"All","states":"All"},{"name":"September Equinox","description":"September Equinox in Colombia (Bogota)","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-09-22T13:19:22-05:00","datetime":{"year":2025,"month":9,"day":22,"hour":13,"minute":19,"second":22},"timezone":{"offset":"-05:00","zoneabb":"COT","zoneoffset":-18000,"zonedst":0,"zonetotaloffset":-18000}},"type":["Season"],"primary_type":"Season","canonical_url":"https://calendarific.com/holiday/seasons/autumnal-equniox","urlid":"seasons/autumnal-equniox","locations":"All","states":"All"},{"name":"Columbus Day","description":"Columbus Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-10-12","datetime":{"year":2025,"month":10,"day":12}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/columbus-day","urlid":"colombia/columbus-day","locations":"All","states":"All"},{"name":"Columbus Day","description":"Columbus Day is a national holiday in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-10-13","datetime":{"year":2025,"month":10,"day":13}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/columbus-day","urlid":"colombia/columbus-day","locations":"All","states":"All"},{"name":"Halloween","description":"Halloween is a festive occasion that is celebrated in many countries on October 31 each year.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-10-31","datetime":{"year":2025,"month":10,"day":31}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/halloween","urlid":"colombia/halloween","locations":"All","states":"All"},{"name":"All Saints' Day","description":"Many churches honor all their saints on All Saints' Day, also known as All Hallows' Day.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-11-01","datetime":{"year":2025,"month":11,"day":1}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/all-saints-day","urlid":"colombia/all-saints-day","locations":"All","states":"All"},{"name":"All Saints' Day","description":"Many churches honor all their saints on All Saints' Day, also known as All Hallows' Day.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-11-03","datetime":{"year":2025,"month":11,"day":3}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/all-saints-day","urlid":"colombia/all-saints-day","locations":"All","states":"All"},{"name":"Independence of Cartagena","description":"Independence of Cartagena is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-11-11","datetime":{"year":2025,"month":11,"day":11}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/independence-of-cartagena","urlid":"colombia/independence-of-cartagena","locations":"All","states":"All"},{"name":"Colombian Women's Day","description":"Colombian Women's Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-11-14","datetime":{"year":2025,"month":11,"day":14}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/colombian-woman-day","urlid":"colombia/colombian-woman-day","locations":"All","states":"All"},{"name":"Independence of Cartagena","description":"Independence of Cartagena is a national holiday in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-11-17","datetime":{"year":2025,"month":11,"day":17}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/independence-of-cartagena","urlid":"colombia/independence-of-cartagena","locations":"All","states":"All"},{"name":"Eve of the Feast of the Immaculate Conception","description":"Eve of the Feast of the Immaculate Conception is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-12-07","datetime":{"year":2025,"month":12,"day":7}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/immaculate-conception-eve","urlid":"colombia/immaculate-conception-eve","locations":"All","states":"All"},{"name":"Feast of the Immaculate Conception","description":"The Feast of the Immaculate Conception is a Christian observance on December 8 each year.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-12-08","datetime":{"year":2025,"month":12,"day":8}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/immaculate-conception","urlid":"colombia/immaculate-conception","locations":"All","states":"All"},{"name":"December Solstice","description":"December Solstice in Colombia (Bogota)","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-12-21T10:03:05-05:00","datetime":{"year":2025,"month":12,"day":21,"hour":10,"minute":3,"second":5},"timezone":{"offset":"-05:00","zoneabb":"COT","zoneoffset":-18000,"zonedst":0,"zonetotaloffset":-18000}},"type":["Season"],"primary_type":"Season","canonical_url":"https://calendarific.com/holiday/seasons/december-solstice","urlid":"seasons/december-solstice","locations":"All","states":"All"},{"name":"Christmas Eve","description":"Christmas Eve is the day before Christmas Day and falls on December 24 in the Gregorian calendar.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-12-24","datetime":{"year":2025,"month":12,"day":24}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/christmas-eve","urlid":"colombia/christmas-eve","locations":"All","states":"All"},{"name":"Christmas Day","description":"Christmas Day is one of the biggest Christian celebrations and falls on December 25 in the Gregorian calendar.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-12-25","datetime":{"year":2025,"month":12,"day":25}},"type":["National holiday","Christian"],"primary_type":"Christian","canonical_url":"https://calendarific.com/holiday/colombia/christmas-day","urlid":"colombia/christmas-day","locations":"All","states":"All"},{"name":"New Year's Eve","description":"New Year’s Eve is the last day of the year, December 31, in the Gregorian calendar.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-12-31","datetime":{"year":2025,"month":12,"day":31}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/new-years-eve","urlid":"colombia/new-years-eve","locations":"All","states":"All"}]}

ApiCalendarific2025Response apiCalendarific2025ResponseFromJson(String str) => ApiCalendarific2025Response.fromJson(json.decode(str));
String apiCalendarific2025ResponseToJson(ApiCalendarific2025Response data) => json.encode(data.toJson());
class ApiCalendarific2025Response {
  ApiCalendarific2025Response({
      Meta? meta, 
      Response? response,}){
    _meta = meta;
    _response = response;
}

  ApiCalendarific2025Response.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Meta? _meta;
  Response? _response;
ApiCalendarific2025Response copyWith({  Meta? meta,
  Response? response,
}) => ApiCalendarific2025Response(  meta: meta ?? _meta,
  response: response ?? _response,
);
  Meta? get meta => _meta;
  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

}

/// holidays : [{"name":"New Year's Day","description":"New Year’s Day is the first day of the year, or January 1, in the Gregorian calendar.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-01-01","datetime":{"year":2025,"month":1,"day":1}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/new-year-day","urlid":"colombia/new-year-day","locations":"All","states":"All"},{"name":"Epiphany","description":"Epiphany is a Christian holiday celebrated globally on January 6 each year. It commemorates two events recorded in the Bible: the three wise men’s visit to baby Jesus; and Jesus’ baptism.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-01-06","datetime":{"year":2025,"month":1,"day":6}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/the-three-wise-men-day","urlid":"colombia/the-three-wise-men-day","locations":"All","states":"All"},{"name":"Epiphany","description":"Epiphany is a Christian holiday celebrated globally on January 6 each year. It commemorates two events recorded in the Bible: the three wise men’s visit to baby Jesus; and Jesus’ baptism.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-01-06","datetime":{"year":2025,"month":1,"day":6}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/the-three-wise-men-day","urlid":"colombia/the-three-wise-men-day","locations":"All","states":"All"},{"name":"Women's Day","description":"Women's Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-03-08","datetime":{"year":2025,"month":3,"day":8}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/womens-day","urlid":"colombia/womens-day","locations":"All","states":"All"},{"name":"Saint Joseph's Day","description":"Saint Joseph's Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-03-19","datetime":{"year":2025,"month":3,"day":19}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/saint-josephs-day","urlid":"colombia/saint-josephs-day","locations":"All","states":"All"},{"name":"March Equinox","description":"March Equinox in Colombia (Bogota)","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-03-20T04:01:21-05:00","datetime":{"year":2025,"month":3,"day":20,"hour":4,"minute":1,"second":21},"timezone":{"offset":"-05:00","zoneabb":"COT","zoneoffset":-18000,"zonedst":0,"zonetotaloffset":-18000}},"type":["Season"],"primary_type":"Season","canonical_url":"https://calendarific.com/holiday/seasons/vernal-equinox","urlid":"seasons/vernal-equinox","locations":"All","states":"All"},{"name":"Saint Joseph's Day","description":"Saint Joseph's Day is a national holiday in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-03-24","datetime":{"year":2025,"month":3,"day":24}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/saint-josephs-day","urlid":"colombia/saint-josephs-day","locations":"All","states":"All"},{"name":"Palm Sunday","description":"Palm Sunday is a Christian feast that commemorates Jesus Christ’s entry into Jerusalem. It is also the start of Holy Week.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-13","datetime":{"year":2025,"month":4,"day":13}},"type":["Observance","Christian"],"primary_type":"Christian","canonical_url":"https://calendarific.com/holiday/colombia/palm-sunday","urlid":"colombia/palm-sunday","locations":"All","states":"All"},{"name":"Maundy Thursday","description":"Maundy Thursday is a Christian observance on the Thursday during Holy Week. It is the day before Good Friday.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-17","datetime":{"year":2025,"month":4,"day":17}},"type":["National holiday","Christian"],"primary_type":"Christian","canonical_url":"https://calendarific.com/holiday/colombia/maundy-thursday","urlid":"colombia/maundy-thursday","locations":"All","states":"All"},{"name":"Good Friday","description":"Good Friday is a global Christian observance two days before Easter Sunday.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-18","datetime":{"year":2025,"month":4,"day":18}},"type":["National holiday","Christian"],"primary_type":"Christian","canonical_url":"https://calendarific.com/holiday/colombia/good-friday","urlid":"colombia/good-friday","locations":"All","states":"All"},{"name":"Easter Sunday","description":"Easter Sunday commemorates Jesus Christ’s resurrection, according to Christian belief.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-20","datetime":{"year":2025,"month":4,"day":20}},"type":["Observance","Christian"],"primary_type":"Christian","canonical_url":"https://calendarific.com/holiday/colombia/easter-sunday","urlid":"colombia/easter-sunday","locations":"All","states":"All"},{"name":"Language Day","description":"Language Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-23","datetime":{"year":2025,"month":4,"day":23}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/lenguage-day","urlid":"colombia/lenguage-day","locations":"All","states":"All"},{"name":"Secretaries' Day","description":"Secretaries' Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-26","datetime":{"year":2025,"month":4,"day":26}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/secretarys-day","urlid":"colombia/secretarys-day","locations":"All","states":"All"},{"name":"Children's Day","description":"Children's Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-26","datetime":{"year":2025,"month":4,"day":26}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/childrens-day","urlid":"colombia/childrens-day","locations":"All","states":"All"},{"name":"Day of Trees","description":"Day of Trees is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-04-29","datetime":{"year":2025,"month":4,"day":29}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/trees-day","urlid":"colombia/trees-day","locations":"All","states":"All"},{"name":"Labor Day / May Day","description":"Labor Day, International Workers' Day, and May Day, is a day off for workers in many countries around the world.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-05-01","datetime":{"year":2025,"month":5,"day":1}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/labor-day","urlid":"colombia/labor-day","locations":"All","states":"All"},{"name":"Mothers' Day","description":"Mother’s Day celebrates the achievements and efforts of mothers and mother figures.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-05-11","datetime":{"year":2025,"month":5,"day":11}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/mothers-day","urlid":"colombia/mothers-day","locations":"All","states":"All"},{"name":"Teacher's Day","description":"Teacher's Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-05-15","datetime":{"year":2025,"month":5,"day":15}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/teachers-day","urlid":"colombia/teachers-day","locations":"All","states":"All"},{"name":"Ascension Day","description":"Ascension Day is the 40th day of Easter. It is a religious holiday that commemorates the ascension of Jesus Christ into heaven.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-02","datetime":{"year":2025,"month":6,"day":2}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/ascension-day","urlid":"colombia/ascension-day","locations":"All","states":"All"},{"name":"Fathers' Day","description":"Father’s Day celebrates fatherhood and male parenting on different dates worldwide.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-15","datetime":{"year":2025,"month":6,"day":15}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/fathers-day","urlid":"colombia/fathers-day","locations":"All","states":"All"},{"name":"Corpus Christi","description":"Corpus Christi is a Christian feast in honor of the Holy Eucharist.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-19","datetime":{"year":2025,"month":6,"day":19}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/corpus-christi","urlid":"colombia/corpus-christi","locations":"All","states":"All"},{"name":"June Solstice","description":"June Solstice in Colombia (Bogota)","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-20T21:42:15-05:00","datetime":{"year":2025,"month":6,"day":20,"hour":21,"minute":42,"second":15},"timezone":{"offset":"-05:00","zoneabb":"COT","zoneoffset":-18000,"zonedst":0,"zonetotaloffset":-18000}},"type":["Season"],"primary_type":"Season","canonical_url":"https://calendarific.com/holiday/seasons/june-solstice","urlid":"seasons/june-solstice","locations":"All","states":"All"},{"name":"Corpus Christi","description":"Corpus Christi is a Christian feast in honor of the Holy Eucharist.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-23","datetime":{"year":2025,"month":6,"day":23}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/corpus-christi","urlid":"colombia/corpus-christi","locations":"All","states":"All"},{"name":"Feast of Saint Peter and Saint Paul","description":"Feast of Saint Peter and Saint Paul is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-29","datetime":{"year":2025,"month":6,"day":29}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/saint-peter-and-saint-paul","urlid":"colombia/saint-peter-and-saint-paul","locations":"All","states":"All"},{"name":"Sacred Heart","description":"Corpus Christi is a Christian feast in honor of the Holy Eucharist.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-30","datetime":{"year":2025,"month":6,"day":30}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/sacred-heart","urlid":"colombia/sacred-heart","locations":"All","states":"All"},{"name":"Feast of Saint Peter and Saint Paul","description":"Feast of Saint Peter and Saint Paul is a national holiday in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-06-30","datetime":{"year":2025,"month":6,"day":30}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/saint-peter-and-saint-paul","urlid":"colombia/saint-peter-and-saint-paul","locations":"All","states":"All"},{"name":"Independence Day","description":"Independence Day is a national holiday in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-07-20","datetime":{"year":2025,"month":7,"day":20}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/independence-day","urlid":"colombia/independence-day","locations":"All","states":"All"},{"name":"Battle of Boyacá Day","description":"Battle of Boyacá Day is a national holiday in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-08-07","datetime":{"year":2025,"month":8,"day":7}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/battle-of-boyaca","urlid":"colombia/battle-of-boyaca","locations":"All","states":"All"},{"name":"Assumption of Mary","description":"The Christian feast of the Assumption of Mary is on or around Aug 15 in most countries. A few celebrate Assumption Day at other times of the year.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-08-15","datetime":{"year":2025,"month":8,"day":15}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/assumption-of-mary","urlid":"colombia/assumption-of-mary","locations":"All","states":"All"},{"name":"Assumption of Mary","description":"The Christian feast of the Assumption of Mary is on or around Aug 15 in most countries. A few celebrate Assumption Day at other times of the year.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-08-18","datetime":{"year":2025,"month":8,"day":18}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/assumption-of-mary","urlid":"colombia/assumption-of-mary","locations":"All","states":"All"},{"name":"Valentine's Day","description":"February 14 is Valentine's Day or Saint Valentine's Feast. The day of love owes its origins to ancient Roman and European Christian traditions.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-09-20","datetime":{"year":2025,"month":9,"day":20}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/saint-valentines-day","urlid":"colombia/saint-valentines-day","locations":"All","states":"All"},{"name":"September Equinox","description":"September Equinox in Colombia (Bogota)","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-09-22T13:19:22-05:00","datetime":{"year":2025,"month":9,"day":22,"hour":13,"minute":19,"second":22},"timezone":{"offset":"-05:00","zoneabb":"COT","zoneoffset":-18000,"zonedst":0,"zonetotaloffset":-18000}},"type":["Season"],"primary_type":"Season","canonical_url":"https://calendarific.com/holiday/seasons/autumnal-equniox","urlid":"seasons/autumnal-equniox","locations":"All","states":"All"},{"name":"Columbus Day","description":"Columbus Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-10-12","datetime":{"year":2025,"month":10,"day":12}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/columbus-day","urlid":"colombia/columbus-day","locations":"All","states":"All"},{"name":"Columbus Day","description":"Columbus Day is a national holiday in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-10-13","datetime":{"year":2025,"month":10,"day":13}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/columbus-day","urlid":"colombia/columbus-day","locations":"All","states":"All"},{"name":"Halloween","description":"Halloween is a festive occasion that is celebrated in many countries on October 31 each year.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-10-31","datetime":{"year":2025,"month":10,"day":31}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/halloween","urlid":"colombia/halloween","locations":"All","states":"All"},{"name":"All Saints' Day","description":"Many churches honor all their saints on All Saints' Day, also known as All Hallows' Day.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-11-01","datetime":{"year":2025,"month":11,"day":1}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/all-saints-day","urlid":"colombia/all-saints-day","locations":"All","states":"All"},{"name":"All Saints' Day","description":"Many churches honor all their saints on All Saints' Day, also known as All Hallows' Day.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-11-03","datetime":{"year":2025,"month":11,"day":3}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/all-saints-day","urlid":"colombia/all-saints-day","locations":"All","states":"All"},{"name":"Independence of Cartagena","description":"Independence of Cartagena is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-11-11","datetime":{"year":2025,"month":11,"day":11}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/independence-of-cartagena","urlid":"colombia/independence-of-cartagena","locations":"All","states":"All"},{"name":"Colombian Women's Day","description":"Colombian Women's Day is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-11-14","datetime":{"year":2025,"month":11,"day":14}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/colombian-woman-day","urlid":"colombia/colombian-woman-day","locations":"All","states":"All"},{"name":"Independence of Cartagena","description":"Independence of Cartagena is a national holiday in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-11-17","datetime":{"year":2025,"month":11,"day":17}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/independence-of-cartagena","urlid":"colombia/independence-of-cartagena","locations":"All","states":"All"},{"name":"Eve of the Feast of the Immaculate Conception","description":"Eve of the Feast of the Immaculate Conception is a observance in Colombia","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-12-07","datetime":{"year":2025,"month":12,"day":7}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/immaculate-conception-eve","urlid":"colombia/immaculate-conception-eve","locations":"All","states":"All"},{"name":"Feast of the Immaculate Conception","description":"The Feast of the Immaculate Conception is a Christian observance on December 8 each year.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-12-08","datetime":{"year":2025,"month":12,"day":8}},"type":["National holiday"],"primary_type":"National holiday","canonical_url":"https://calendarific.com/holiday/colombia/immaculate-conception","urlid":"colombia/immaculate-conception","locations":"All","states":"All"},{"name":"December Solstice","description":"December Solstice in Colombia (Bogota)","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-12-21T10:03:05-05:00","datetime":{"year":2025,"month":12,"day":21,"hour":10,"minute":3,"second":5},"timezone":{"offset":"-05:00","zoneabb":"COT","zoneoffset":-18000,"zonedst":0,"zonetotaloffset":-18000}},"type":["Season"],"primary_type":"Season","canonical_url":"https://calendarific.com/holiday/seasons/december-solstice","urlid":"seasons/december-solstice","locations":"All","states":"All"},{"name":"Christmas Eve","description":"Christmas Eve is the day before Christmas Day and falls on December 24 in the Gregorian calendar.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-12-24","datetime":{"year":2025,"month":12,"day":24}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/christmas-eve","urlid":"colombia/christmas-eve","locations":"All","states":"All"},{"name":"Christmas Day","description":"Christmas Day is one of the biggest Christian celebrations and falls on December 25 in the Gregorian calendar.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-12-25","datetime":{"year":2025,"month":12,"day":25}},"type":["National holiday","Christian"],"primary_type":"Christian","canonical_url":"https://calendarific.com/holiday/colombia/christmas-day","urlid":"colombia/christmas-day","locations":"All","states":"All"},{"name":"New Year's Eve","description":"New Year’s Eve is the last day of the year, December 31, in the Gregorian calendar.","country":{"id":"co","name":"Colombia"},"date":{"iso":"2025-12-31","datetime":{"year":2025,"month":12,"day":31}},"type":["Observance"],"primary_type":"Observance","canonical_url":"https://calendarific.com/holiday/colombia/new-years-eve","urlid":"colombia/new-years-eve","locations":"All","states":"All"}]

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      List<Holidays>? holidays,}){
    _holidays = holidays;
}

  Response.fromJson(dynamic json) {
    if (json['holidays'] != null) {
      _holidays = [];
      json['holidays'].forEach((v) {
        _holidays?.add(Holidays.fromJson(v));
      });
    }
  }
  List<Holidays>? _holidays;
Response copyWith({  List<Holidays>? holidays,
}) => Response(  holidays: holidays ?? _holidays,
);
  List<Holidays>? get holidays => _holidays;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_holidays != null) {
      map['holidays'] = _holidays?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "New Year's Day"
/// description : "New Year’s Day is the first day of the year, or January 1, in the Gregorian calendar."
/// country : {"id":"co","name":"Colombia"}
/// date : {"iso":"2025-01-01","datetime":{"year":2025,"month":1,"day":1}}
/// type : ["National holiday"]
/// primary_type : "National holiday"
/// canonical_url : "https://calendarific.com/holiday/colombia/new-year-day"
/// urlid : "colombia/new-year-day"
/// locations : "All"
/// states : "All"

Holidays holidaysFromJson(String str) => Holidays.fromJson(json.decode(str));
String holidaysToJson(Holidays data) => json.encode(data.toJson());
class Holidays {
  Holidays({
      String? name, 
      String? description, 
      Country? country, 
      Date? date, 
      List<String>? type, 
      String? primaryType, 
      String? canonicalUrl, 
      String? urlid, 
      String? locations, 
      String? states,}){
    _name = name;
    _description = description;
    _country = country;
    _date = date;
    _type = type;
    _primaryType = primaryType;
    _canonicalUrl = canonicalUrl;
    _urlid = urlid;
    _locations = locations;
    _states = states;
}

  Holidays.fromJson(dynamic json) {
    _name = json['name'];
    _description = json['description'];
    _country = json['country'] != null ? Country.fromJson(json['country']) : null;
    _date = json['date'] != null ? Date.fromJson(json['date']) : null;
    _type = json['type'] != null ? json['type'].cast<String>() : [];
    _primaryType = json['primary_type'];
    _canonicalUrl = json['canonical_url'];
    _urlid = json['urlid'];
    _locations = json['locations'];
    _states = json['states'];
  }
  String? _name;
  String? _description;
  Country? _country;
  Date? _date;
  List<String>? _type;
  String? _primaryType;
  String? _canonicalUrl;
  String? _urlid;
  String? _locations;
  String? _states;
Holidays copyWith({  String? name,
  String? description,
  Country? country,
  Date? date,
  List<String>? type,
  String? primaryType,
  String? canonicalUrl,
  String? urlid,
  String? locations,
  String? states,
}) => Holidays(  name: name ?? _name,
  description: description ?? _description,
  country: country ?? _country,
  date: date ?? _date,
  type: type ?? _type,
  primaryType: primaryType ?? _primaryType,
  canonicalUrl: canonicalUrl ?? _canonicalUrl,
  urlid: urlid ?? _urlid,
  locations: locations ?? _locations,
  states: states ?? _states,
);
  String? get name => _name;
  String? get description => _description;
  Country? get country => _country;
  Date? get date => _date;
  List<String>? get type => _type;
  String? get primaryType => _primaryType;
  String? get canonicalUrl => _canonicalUrl;
  String? get urlid => _urlid;
  String? get locations => _locations;
  String? get states => _states;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['description'] = _description;
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    if (_date != null) {
      map['date'] = _date?.toJson();
    }
    map['type'] = _type;
    map['primary_type'] = _primaryType;
    map['canonical_url'] = _canonicalUrl;
    map['urlid'] = _urlid;
    map['locations'] = _locations;
    map['states'] = _states;
    return map;
  }

}

/// iso : "2025-01-01"
/// datetime : {"year":2025,"month":1,"day":1}

Date dateFromJson(String str) => Date.fromJson(json.decode(str));
String dateToJson(Date data) => json.encode(data.toJson());
class Date {
  Date({
      String? iso, 
      Datetime? datetime,}){
    _iso = iso;
    _datetime = datetime;
}

  Date.fromJson(dynamic json) {
    _iso = json['iso'];
    _datetime = json['datetime'] != null ? Datetime.fromJson(json['datetime']) : null;
  }
  String? _iso;
  Datetime? _datetime;
Date copyWith({  String? iso,
  Datetime? datetime,
}) => Date(  iso: iso ?? _iso,
  datetime: datetime ?? _datetime,
);
  String? get iso => _iso;
  Datetime? get datetime => _datetime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso'] = _iso;
    if (_datetime != null) {
      map['datetime'] = _datetime?.toJson();
    }
    return map;
  }

}

/// year : 2025
/// month : 1
/// day : 1

Datetime datetimeFromJson(String str) => Datetime.fromJson(json.decode(str));
String datetimeToJson(Datetime data) => json.encode(data.toJson());
class Datetime {
  Datetime({
      num? year, 
      num? month, 
      num? day,}){
    _year = year;
    _month = month;
    _day = day;
}

  Datetime.fromJson(dynamic json) {
    _year = json['year'];
    _month = json['month'];
    _day = json['day'];
  }
  num? _year;
  num? _month;
  num? _day;
Datetime copyWith({  num? year,
  num? month,
  num? day,
}) => Datetime(  year: year ?? _year,
  month: month ?? _month,
  day: day ?? _day,
);
  num? get year => _year;
  num? get month => _month;
  num? get day => _day;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = _year;
    map['month'] = _month;
    map['day'] = _day;
    return map;
  }

}

/// id : "co"
/// name : "Colombia"

Country countryFromJson(String str) => Country.fromJson(json.decode(str));
String countryToJson(Country data) => json.encode(data.toJson());
class Country {
  Country({
      String? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Country.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;
Country copyWith({  String? id,
  String? name,
}) => Country(  id: id ?? _id,
  name: name ?? _name,
);
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

/// code : 200

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));
String metaToJson(Meta data) => json.encode(data.toJson());
class Meta {
  Meta({
      num? code,}){
    _code = code;
}

  Meta.fromJson(dynamic json) {
    _code = json['code'];
  }
  num? _code;
Meta copyWith({  num? code,
}) => Meta(  code: code ?? _code,
);
  num? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    return map;
  }

}