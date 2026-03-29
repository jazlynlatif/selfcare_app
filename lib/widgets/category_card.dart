import 'package:flutter/material.dart';
import 'package:selfcare_app/models/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category item;
  final int length;
  const CategoryWidget({
    super.key,
    required this.item,
    required this.length
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: screenHeight * 0.04,
              child: Image.asset(
                item.image_path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              item.title,
              style: theme.textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:selfcare_app/data/category-data.dart';

// class CategoryWidget extends StatelessWidget {
//   final int index;
//   final int length;
//   const CategoryWidget({
//     super.key,
//     required this.index,
//     required this.length
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final containerSize = screenWidth/(length+1);
//     final Gap = (((screenWidth - (containerSize * length))/(length+1))/2);
//     print(Gap);
//     return Container(
//       width: containerSize,
//       padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
//       margin: EdgeInsets.symmetric(vertical: 5, horizontal: Gap),
//       decoration: BoxDecoration(
//         color: theme.colorScheme.primary,
//         borderRadius: BorderRadius.circular(10)
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(9.0),
//             child: SizedBox(
//               height: screenHeight * 0.038,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.asset(
//                   category_data[index].image_path,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           FittedBox(
//             fit: BoxFit.scaleDown,
//             child: Text(
//               category_data[index].title,
//               style: theme.textTheme.labelSmall,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }