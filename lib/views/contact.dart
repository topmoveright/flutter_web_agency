import 'package:agency/constants/content.dart';
import 'package:agency/constants/custom_size.dart';
import 'package:agency/views/components/section.dart';
import 'package:agency/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx/webviewx.dart';

class Contact extends GetResponsiveView {
  Contact({Key? key}) : super(key: key);

  @override
  Widget? builder() {
    return Layout(
      child: Column(
        children: [
          const SizedBox(
            height: 500,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(35.159, 126.8523),
                zoom: 14.4746,
              ),
            ),
          ),
          Section(
            child: SizedBox(
              width: CustomSize.defaultScreenWidth,
              child: buildDesc(),
            ),
          ),
        ],
      ),
    );
  }

  /*Column buildForm() {
    return Column(
      children: [
        Builder(builder: (context) {
          switch (screen.screenType) {
            case ScreenType.Watch:
            case ScreenType.Phone:
            case ScreenType.Tablet:
              return Column(
                children: const [
                  TextField(
                    decoration: InputDecoration(
                      hintText: MockData.title,
                      border: CustomForm.inputBorder,
                      enabledBorder: CustomForm.inputBorder,
                    ),
                  ),
                  SizedBox(height: CustomSize.x),
                  TextField(
                    decoration: InputDecoration(
                      hintText: MockData.title,
                      border: CustomForm.inputBorder,
                      enabledBorder: CustomForm.inputBorder,
                    ),
                  ),
                ],
              );
            case ScreenType.Desktop:
              return Row(
                children: const [
                  Flexible(
                    flex: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: MockData.title,
                        border: CustomForm.inputBorder,
                        enabledBorder: CustomForm.inputBorder,
                      ),
                    ),
                  ),
                  SizedBox(width: CustomSize.x),
                  Flexible(
                    flex: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: MockData.title,
                        border: CustomForm.inputBorder,
                        enabledBorder: CustomForm.inputBorder,
                      ),
                    ),
                  ),
                ],
              );
          }
        }),
        const SizedBox(height: CustomSize.x),
        const TextField(
          decoration: InputDecoration(
            hintText: MockData.title,
            border: CustomForm.inputBorder,
            enabledBorder: CustomForm.inputBorder,
          ),
        ),
        const SizedBox(height: CustomSize.x),
        const TextField(
          maxLines: 10,
          decoration: InputDecoration(
            hintText: MockData.title,
            border: CustomForm.inputBorder,
            enabledBorder: CustomForm.inputBorder,
          ),
        ),
        const SizedBox(height: CustomSize.xx),
        ButtonBar(
          children: [
            TextButton(
              style: CustomTheme.textButton2.style,
              onPressed: () {},
              child: const Text(MockData.title),
            ),
          ],
        ),
      ],
    );
  }*/

  Column buildDesc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            buildLabel('HOME'),
            const Expanded(
              child: Text(
                'Gwangju',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: CustomSize.xx),
        Row(
          children: [
            buildLabel('EMAIL'),
            Expanded(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () =>
                      launchUrl(Uri.parse('mailto:${Content.mailAddress}')),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          Content.mailAddress,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ),
                      SizedBox(width: CustomSize.x),
                      Icon(Icons.send, size: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: CustomSize.xx),
        Row(
          children: [
            buildLabel('Github'),
            Expanded(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => launchUrl(Uri.parse(Content.gitHubUrl)),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          Content.gitHubUrl,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ),
                      SizedBox(width: CustomSize.x),
                      Icon(Icons.link, size: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildLabel(String title, {Icon? icon}) {
    return Opacity(
      opacity: 0.5,
      child: SizedBox(
        width: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: CustomSize.x),
              child: icon ?? const SizedBox.shrink(),
            ),
            Text(title, style: Get.textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  WebViewXController? webViewController;

  @override
  Widget build(BuildContext context) {
    var height = 500.0;

    void _loadMap(
      WebViewXController controller,
      double width,
      double height,
    ) {
      controller.loadContent('''
<div id="daumRoughmapContainer1651663346985" class="root_daum_roughmap root_daum_roughmap_landing"></div>
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1651663346985",
		"key" : "2a5zu",
		"mapWidth" : "${width - 20}",
		"mapHeight" : "${height - 50}"
	}).render();
</script>
          ''', SourceType.html);
    }

    return LayoutBuilder(
      builder: (context, constraint) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (webViewController != null) {
            _loadMap(webViewController!, constraint.maxWidth, height);
          }
        });

        return WebViewX(
          height: height,
          width: constraint.maxWidth,
          initialContent: '''
<div id="daumRoughmapContainer1651663346985" class="root_daum_roughmap root_daum_roughmap_landing"></div>
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1651663346985",
		"key" : "2a5zu",
		"mapWidth" : "${constraint.maxWidth - 20}",
		"mapHeight" : "${height - 50}"
	}).render();
</script>
          ''',
          initialSourceType: SourceType.html,
          onWebViewCreated: (controller) => webViewController = controller,
        );
      },
    );
  }
}
