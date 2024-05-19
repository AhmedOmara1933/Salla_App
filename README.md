import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../models/3.home_model.dart';

// ignore: must_be_immutable
class BuildGridProduct extends StatelessWidget {
Products products;

BuildGridProduct({super.key, required this.products});

@override
Widget build(BuildContext context) {
return Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(15.0),
color: Colors.white,
),
child: Column(
children: [
Stack(
alignment: Alignment.topLeft,
children: [
Container(
padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
height: 200,
width: double.infinity,
child: CachedNetworkImage(
imageUrl: '${products.image}',
progressIndicatorBuilder: (context, url, progress) =>
const Center(
child: CircularProgressIndicator(
color: Colors.blue,
),
),
errorWidget: (context, url, error) =>
Center(child: const CircularProgressIndicator()),
),
),
if (products.discount != 0)
Container(
decoration: BoxDecoration(
color: Colors.red,
borderRadius: BorderRadius.only(
topLeft: Radius.circular(15.0),
bottomRight: Radius.circular(15.0),
)),
padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 7.0),
child: Text(
'discount'.toUpperCase(),
style: TextStyle(color: Colors.white, fontSize: 12.0),
),
),
],
),
Expanded(
child: Padding(
padding: const EdgeInsets.all(10.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
'${products.name}',
maxLines: 2,
overflow: TextOverflow.ellipsis,
style: const TextStyle(
fontSize: 14.0,
height: 1.3,
fontWeight: FontWeight.bold),
),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Row(
children: [
Text(
'${products.price.round()}\$',
maxLines: 2,
overflow: TextOverflow.ellipsis,
style: const TextStyle(
fontSize: 15.0, color: Colors.blue),
),
const SizedBox(
width: 5.0,
),
if (products.discount != 0)
Text(
'${products.oldPrice.round()}\$',
maxLines: 2,
overflow: TextOverflow.ellipsis,
style: TextStyle(
fontSize: 13.0,
color: Colors.grey[700],
decoration: TextDecoration.lineThrough),
),
],
),
GestureDetector(
onTap: (){},
child: CircleAvatar(
backgroundColor: Colors.grey[300],
radius:17.0,
child: Icon(Icons.favorite,size: 23.0,color: Colors.white,)
),
),
],
),
],
),
),
),
],
),
);
}
}



//appbar
appBar: AppBar(
toolbarHeight: 65.0,
systemOverlayStyle: const SystemUiOverlayStyle(
statusBarColor: Color(0xff333333),
statusBarIconBrightness: Brightness.light),
backgroundColor: const Color(0xff282828),
leading: const Padding(
padding: EdgeInsets.only(left: 12.0),
child: Icon(
Icons.shopping_cart_outlined,
color: Colors.white,
size: 35.0,
),
),
title: const DefaultTextFormField(
contentPadding: true,
margin: 0.0,
hintText: 'Search in Salla.eg',
textColor: Color(0xff89898b),
prefixIcon: Icons.search,
iconColor: Colors.black,
),
),


الكيبورد في حاله ال register بتعلق
ال null الي بيظهر في حاله التسجيل  ظهور ال products
ازاي ال token مختلف في حاله login عن register
اللعبه الي بلعبها قبل main لو حذفت التطبيق ونزلته تاني error عشان token و onBoarding ب null
ليه التطبيق ساعت لما اطلع منه واجي اخش عليه ميخشش ويعلق التليفون فاضطر الي run من جديد
ليه ف حاله ال register مبيعملشCircularProgressIndicator علي اما يجيب ال data زي login
ايه الفرق بين null و Null
في مشكله في  update user login و register
ليه لو اشتغلت بال favoritesModel في حاله ال forEach مبتشتغلش لازم ال homeModel
في حاله ال login الخطا لا تطلع في رساله error
في حاله اضافه favorites بتبقي بطيئه في الاضافه  والازاله
في حاله favorites لو ال list  فاضيه من favorites لازم تعرض حاجه ع الاقل text
