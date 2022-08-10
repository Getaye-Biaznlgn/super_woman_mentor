import 'package:flutter/material.dart';
import 'package:super_woman_user/models/role_model_detail.dart';
import 'package:super_woman_user/utils/constants.dart';
import 'package:flutter_html/flutter_html.dart';

class RoleModelContent extends StatelessWidget {
  static const String routeName = '/route-name';
  const RoleModelContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoleModelDetail roleModel =
        ModalRoute.of(context)!.settings.arguments as RoleModelDetail;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(roleModel.title),
        ),
        body:
            // PagingText(roleModel.content)
            ContentView(roleModel: roleModel));
  }
}

class ContentView extends StatefulWidget {
  const ContentView({
    Key? key,
    required this.roleModel,
  }) : super(key: key);

  final RoleModelDetail roleModel;

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  List<String> _pagesContent = [];
  int _currentIndex = 0;

  _paginateContent() {
    int perPageSize = 1000;
    for (int i = 0; i < widget.roleModel.content.length; i += perPageSize) {
      if (widget.roleModel.content.length < i + perPageSize) {
        _pagesContent.add(widget.roleModel.content
            .substring(i, widget.roleModel.content.length - 1));
      } else {
        _pagesContent
            .add(widget.roleModel.content.substring(i, i + perPageSize));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _paginateContent();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Html(data: _pagesContent[_currentIndex]),
        )),
      ),
      Card(
          color: Colors.transparent,
          elevation: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.first_page),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.navigate_before),
                onPressed: _currentIndex == 0
                    ? null
                    : () {
                        setState(() {
                          _currentIndex--;
                        });
                      },
              ),
              Text('${_currentIndex + 1} of ${_pagesContent.length} pages'),
              IconButton(
                icon: const Icon(Icons.navigate_next),
                onPressed: _currentIndex == _pagesContent.length - 1
                    ? null
                    : () {
                        setState(() {
                          _currentIndex++;
                        });
                      },
              ),
              IconButton(
                icon: const Icon(Icons.last_page),
                onPressed: () {
                  setState(() {
                    _currentIndex = _pagesContent.length - 1;
                  });
                },
              )
            ],
          ))
    ]);
  }
}
