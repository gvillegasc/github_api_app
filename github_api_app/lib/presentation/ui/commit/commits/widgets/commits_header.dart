import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_api_app/core/app_strings.dart';
import 'package:github_api_app/core/responsive.dart';
import 'package:github_api_app/presentation/ui/widgets/text_title.dart';

class CommitsHeader extends StatelessWidget {
  const CommitsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final appTheme = Theme.of(context);
    const imageUrl = 'https://avatars.githubusercontent.com/u/40042359?v=4';
    const separator = SizedBox(height: 15);
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.widthR(5),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(7)),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                separator,
                TextTitleRegular(
                  text: AppStrings.textRepoAuthor,
                  color: appTheme.primaryColor.withOpacity(.8),
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            separator,
            TextTitleBig(
              text: AppStrings.textRepoName,
              color: appTheme.primaryColor,
              fontWeight: FontWeight.w700,
            ),
            separator,
            TextTitleRegular(
              text: AppStrings.textCommits,
              color: appTheme.primaryColor.withOpacity(.7),
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
