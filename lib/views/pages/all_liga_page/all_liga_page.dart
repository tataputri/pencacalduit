// import 'dart:ui';

// import 'package:audience_network/audience_network.dart'; 
// import 'package:firemax_football/bloc/home/home_bloc.dart';
// import 'package:firemax_football/bloc/liga/liga_bloc.dart';
// import 'package:firemax_football/bloc/validation/validation_bloc.dart';
// import 'package:firemax_football/constants/colors_style.dart';
// import 'package:firemax_football/constants/constant.dart';
// import 'package:firemax_football/constants/fonts_style.dart';
// import 'package:firemax_football/constants/space_style.dart';
// import 'package:firemax_football/models/model_route.dart'; 
// import 'package:firemax_football/routes/routes_ads.dart'; 
// import 'package:firemax_football/views/widgets/banner_ad_widget.dart';
// import 'package:firemax_football/views/widgets/banner_fan_widget.dart';
// import 'package:firemax_football/views/widgets/cache_img_widget.dart';
// import 'package:firemax_football/views/widgets/card_glass_effect.dart';
// import 'package:firemax_football/views/widgets/costum_show_native_ads_semua.dart';
// import 'package:firemax_football/views/widgets/loading_widget.dart'; 
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AllLigaPage extends StatefulWidget {
//   final ModelRoute? modelRoute;
//   const AllLigaPage({Key? key, this.modelRoute}) : super(key: key);

//   @override
//   State<AllLigaPage> createState() => _AllLigaPageState();
// }

// class _AllLigaPageState extends State<AllLigaPage> {
//   int lengthTab = 3;
//   int? selectedIndex;
//   late LigaBloc bloc;

//   @override
//   void initState() {
//     super.initState();
//     selectedIndex = widget.modelRoute!.index;
//     bloc = BlocProvider.of(context);
//     bloc.add(LoadLiga(namaLiga: widget.modelRoute!.data1));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Container(
//               margin: xSpaceOnly(left: 12, top: 15, bottom: 10),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     onTap: () => GoRoute.back(
//                       context: context,
//                       modelValidation: widget.modelRoute!.modelValidation!,
//                     ),
//                     child: const Icon(
//                       Icons.arrow_back_rounded,
//                       color: xColorSubMain,
//                       size: 25,
//                     ),
//                   ),
//                   const SizedBox(width: 15),
//                   Text("Todas as ligas", style: xFontH1),
//                 ],
//               ),
//             ),
//             BlocBuilder<HomeBloc, HomeState>(
//               builder: (context, state) {
//                 if (state is HomeLoaded) {
//                   return SizedBox(
//                     height: 58,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       physics: const ClampingScrollPhysics(),
//                       scrollDirection: Axis.horizontal,
//                       itemCount: state.dataLiga!.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         var data = state.dataLiga![index];
//                         return Container(
//                           margin: xSpaceSymetric(horizontal: 5, vertical: 10),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: BackdropFilter(
//                               filter: ImageFilter.blur(sigmaX: 5, sigmaY: 15),
//                               child: Container(
//                                 padding: xSpaceSymetric(
//                                     horizontal: 5, vertical: 0),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   border: Border.all(
//                                       color: selectedIndex == index
//                                           ? xColorSubVariant
//                                           : xColorVariant,
//                                       width: 1),
//                                   color: selectedIndex == index
//                                       ? xColorSubMain.withOpacity(0.8)
//                                       : xColorSubVariant,
//                                 ),
//                                 child: InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       selectedIndex = index;
//                                       bloc.add(LoadLiga(namaLiga: data));
//                                     });
//                                   },
//                                   child: Container(
//                                     padding: xSpaceSymetric(horizontal: 10),
//                                     child: Center(
//                                         child: Text(
//                                       data,
//                                       style: xFontP.copyWith(
//                                           color: selectedIndex == index
//                                               ? xColorPrimary
//                                               : xColorMain),
//                                     )),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 }
//                 return Container();
//               },
//             ),
//             BlocBuilder<LigaBloc, LigaState>(
//               builder: (context, state) {
//                 if (state is LigaWaiting) {
//                   return SizedBox(
//                     height: xHeight(context) * 0.75,
//                     child: const Center(
//                       child: CustomLoading(
//                         color: xColorSubMain,
//                         width: 30,
//                         height: 30,
//                       ),
//                     ),
//                   );
//                 }
//                 if (state is LigaError) {
//                   return SizedBox(
//                       height: xHeight(context) * 0.75,
//                       child: CustomCardGlassEffect(
//                         width: xWidth(context),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                                 height: 100,
//                                 child: widget.modelRoute!.modelValidation!
//                                             .ads!.activeAds ==
//                                         "admob"
//                                     ? CostumBannerAdmob(
//                                         unitId: widget
//                                             .modelRoute!
//                                             .modelValidation!
//                                             .ads!
//                                             .admob!
//                                             .admobBannerId!,
//                                         adSize: AdSize.largeBanner,
//                                       )
//                                     : CostumBannerFan(
//                                         placementId: widget
//                                             .modelRoute!
//                                             .modelValidation!
//                                             .ads!
//                                             .fan!
//                                             .fanBannerId,
//                                         bannerSize: BannerSize.LARGE,
//                                       )),
//                             const Spacer(),
//                             const Icon(Icons.error,
//                                 color: xColorSubMain, size: 38),
//                             Text(
//                               "Nenhum dado encontrado",
//                               style: xFontH2,
//                             ),
//                             const Spacer(),
//                           ],
//                         ),
//                       ));
//                 }
//                 if (state is LigaLoaded) {
//                   return Container(
//                     margin: xSpaceOnly(bottom: 10),
//                     child: ListView.separated(
//                       separatorBuilder: (context, index) {
//                         if (index % 3 == 0) {
//                           return const CostumShowNativeAdsSemua();
//                         } else {
//                           return Container();
//                         }
//                       },
//                       shrinkWrap: true,
//                       physics: const ClampingScrollPhysics(),
//                       itemCount: state.dataBolaByLiga.length <= 5
//                           ? state.dataBolaByLiga.length
//                           : 5,
//                       itemBuilder: (BuildContext context, int index) {
//                         var data = state.dataBolaByLiga[index];
//                         return BlocBuilder<ValidationBloc, ValidationState>(
//                           builder: (context, stateVal) {
//                             if (stateVal is ValidationLoaded) {
//                               return InkWell(
//                                 onTap: () => GoRoute.push(
//                                   context: context,
//                                   routeName: Constant.xScreenDetail,
//                                   modelValidation: stateVal.modelValidation,
//                                   data: data,
//                                 ),
//                                 child: CustomCardGlassEffect(
//                                   child: Container(
//                                       padding: xSpaceSymetric(horizontal: 0),
//                                       child: Column(
//                                         children: [
//                                           Align(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               data.leagueName!,
//                                               style: xFontSmall,
//                                             ),
//                                           ),
//                                           const SizedBox(height: 10),
//                                           Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               Expanded(
//                                                 flex: 5,
//                                                 child: Column(
//                                                   children: [
//                                                     ClipOval(
//                                                       child: CustomCacheImg(
//                                                         url: data.homeLogo!,
//                                                         height: 20,
//                                                         width: 20,
//                                                       ),
//                                                     ),
//                                                     const SizedBox(height: 5),
//                                                     Text(
//                                                       data.home!,
//                                                       style: xFontP,
//                                                       maxLines: 1,
//                                                       overflow: TextOverflow
//                                                           .ellipsis,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               const Spacer(),
//                                               Text(data.homeScore.toString(),
//                                                   style: xFontH1),
//                                               Padding(
//                                                 padding: xSpaceSymetric(
//                                                     horizontal: 5),
//                                                 child: Text(
//                                                   "VS",
//                                                   style: xFontSmall,
//                                                 ),
//                                               ),
//                                               Text(data.awayScore.toString(),
//                                                   style: xFontH1),
//                                               const Spacer(),
//                                               Expanded(
//                                                 flex: 5,
//                                                 child: Column(
//                                                   children: [
//                                                     ClipOval(
//                                                       child: CustomCacheImg(
//                                                         url: data.awayLogo!,
//                                                         height: 20,
//                                                         width: 20,
//                                                       ),
//                                                     ),
//                                                     const SizedBox(height: 5),
//                                                     Text(
//                                                       data.away!,
//                                                       style: xFontP,
//                                                       maxLines: 1,
//                                                       overflow: TextOverflow
//                                                           .ellipsis,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(height: 10),
//                                           data.isLive == "online"
//                                               ? Row(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment
//                                                           .center,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .center,
//                                                   children: [
//                                                     Container(
//                                                       width: 10,
//                                                       height: 10,
//                                                       margin: xSpaceOnly(
//                                                           right: 5),
//                                                       decoration:
//                                                           const BoxDecoration(
//                                                               color:
//                                                                   xColorAction,
//                                                               shape: BoxShape
//                                                                   .circle),
//                                                     ),
//                                                     Text(
//                                                       data.isLive!,
//                                                       style: xFontSmall,
//                                                     )
//                                                   ],
//                                                 )
//                                               : Align(
//                                                   alignment: Alignment.center,
//                                                   child: RichText(
//                                                     text: TextSpan(children: [
//                                                       TextSpan(
//                                                         text:
//                                                             "Hora da partida : ",
//                                                         style: xFontSmall,
//                                                       ),
//                                                       TextSpan(
//                                                         text: data.matchTime,
//                                                         style: xFontSmall,
//                                                       ),
//                                                     ]),
//                                                   ),
//                                                 )
//                                         ],
//                                       )),
//                                 ),
//                               );
//                             }
//                             return Container();
//                           },
//                         );
//                       },
//                     ),
//                   );
//                 }
//                 return Container();
//               },
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
