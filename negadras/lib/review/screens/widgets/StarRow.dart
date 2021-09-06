// part of 'widgets.dart';

// Widget buildStar(context, )

// Widget _buildStar(BuildContext context, int index) {
//     Icon icon;
//     if (index >= rating) {
//       icon = Icon(
//         Icons.star_border,
//         color: Colors.blue,
//       );
//     } else if (index > rating - 1 && index < rating) {
//       icon = Icon(
//         Icons.star_half,
//         color: color ?? Theme.of(context).primaryColor,
//       );
//     } else {
//       icon = Icon(
//         Icons.star,
//         color: color ?? Theme.of(context).primaryColor,
//       );
//     }
//     return InkResponse(
//       onTap:
//           onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
//       child: icon,
//     );
//   }
