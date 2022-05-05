import 'package:moment/services.dart' as services;
import 'package:cached_network_image/cached_network_image.dart';

CachedNetworkImage serverImage(String imageUrl) {
  return CachedNetworkImage(imageUrl: services.baseURL + '/' + imageUrl);
}

CachedNetworkImageProvider serverImageProvider(String imageUrl) {
  return CachedNetworkImageProvider(services.baseURL + '/' + imageUrl);
}
