import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class UserSection extends StatelessWidget {
  final IconData? iconName;
  final String sectionText;
  final VoidCallback? onTap;
  const UserSection({
    Key? key,
    this.iconName,
    required this.sectionText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          SizeConfig.blockSizeHorizontal! * 8,
          0,
          SizeConfig.blockSizeHorizontal! * 6,
          SizeConfig.blockSizeVertical! * 3,
        ),
        child: Row(
          children: [
            Icon(
              iconName,
              color: Colors.black54,
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 6,
            ),
            Text(
              sectionText,
              style: TextStyle(
                color: Colors.black54,
                fontSize: SizeConfig.blockSizeHorizontal! * 5,
              ),
            ),

            /// 16

            /// 32
          ],
        ),
      ),
    );
  }
}
