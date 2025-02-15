import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ecommerce_product_detail_widget.dart' show EcommerceProductDetailWidget;
import 'package:flutter/material.dart';

class EcommerceProductDetailModel
    extends FlutterFlowModel<EcommerceProductDetailWidget> {
  ///  Local state fields for this page.

  bool wishlistBtn = false;

  List<dynamic> emptyjson = [];
  void addToEmptyjson(dynamic item) => emptyjson.add(item);
  void removeFromEmptyjson(dynamic item) => emptyjson.remove(item);
  void removeAtIndexFromEmptyjson(int index) => emptyjson.removeAt(index);
  void insertAtIndexInEmptyjson(int index, dynamic item) =>
      emptyjson.insert(index, item);
  void updateEmptyjsonAtIndex(int index, Function(dynamic) updateFn) =>
      emptyjson[index] = updateFn(emptyjson[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (wishlist)] action in ecommerceProductDetail widget.
  ApiCallResponse? apiWishlistResult;
  // Stores action output result for [Backend Call - API (addToWishlist)] action in IconButton widget.
  ApiCallResponse? apiAddTWResult;
  // Stores action output result for [Backend Call - API (deleteFromWishlist)] action in IconButton widget.
  ApiCallResponse? apiDeleteFWResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
