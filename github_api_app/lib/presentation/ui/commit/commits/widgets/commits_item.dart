import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_api_app/core/app_strings.dart';
import 'package:github_api_app/core/responsive.dart';
import 'package:github_api_app/domain/models/commit.dart';
import 'package:github_api_app/presentation/ui/widgets/text_paragraph.dart';
import 'package:url_launcher/url_launcher.dart';

class CommitsItem extends StatelessWidget {
  const CommitsItem({
    Key? key,
    required this.commit,
  }) : super(key: key);

  final Commit commit;

  String _commitDate(DateTime commitDate) {
    try {
      final different = DateTime.now().difference(commitDate);
      final differentHours = different.inHours;
      if (different.inMinutes <= 0) {
        return '${different.inSeconds} ${AppStrings.textAbbrevationSecond}}';
      } else if (differentHours <= 0) {
        return '${different.inMinutes} ${AppStrings.textAbbrevationMinute}';
      } else if (differentHours <= 24) {
        return '${different.inHours} ${AppStrings.textAbbrevationHour}';
      } else {
        return '${different.inDays} ${AppStrings.textAbbrevationDay}';
      }
    } catch (e) {
      return '';
    }
  }

  void _onDetailCommit() async {
    await canLaunch(commit.htmlUrl)
        ? await launch(commit.htmlUrl)
        : throw 'Could not launch ${commit.htmlUrl}';
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final appTheme = Theme.of(context);
    return FadeIn(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          focusColor: appTheme.primaryColor,
          hoverColor: appTheme.primaryColor,
          highlightColor: appTheme.primaryColor.withOpacity(.2),
          onTap: _onDetailCommit,
          child: Container(
            padding: EdgeInsets.only(
              left: responsive.widthR(5),
              right: responsive.widthR(5),
              top: 10,
            ),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: responsive.widthR(70),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextParagraphBig(
                            text: commit.commit.message,
                            color: appTheme.primaryColor,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: commit.committer.avatarUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              TextParagraphRegular(
                                text: commit.committer.login,
                                color: appTheme.primaryColor,
                              ),
                              TextParagraphRegular(
                                text: ' ${AppStrings.textAuthor}',
                                color: appTheme.colorScheme.secondary,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: responsive.widthR(20),
                      alignment: Alignment.centerRight,
                      child: TextParagraphRegular(
                        text: _commitDate(commit.commit.committer.date),
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: appTheme.primaryColor.withOpacity(.7),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  color: appTheme.primaryColor.withOpacity(.2),
                  height: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
