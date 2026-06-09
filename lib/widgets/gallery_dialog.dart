import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GalleryDialog extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const GalleryDialog({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<GalleryDialog> createState() => _GalleryDialogState();
}

class _GalleryDialogState extends State<GalleryDialog> {
  late int _current;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _current = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _go(int delta) {
    final next = (_current + delta).clamp(0, widget.images.length - 1);
    if (next == _current) return;
    _pageController.animateToPage(
      next,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode()..requestFocus(),
      autofocus: true,
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft) _go(-1);
          if (event.logicalKey == LogicalKeyboardKey.arrowRight) _go(1);
          if (event.logicalKey == LogicalKeyboardKey.escape) Navigator.of(context).pop();
        }
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.92,
            maxHeight: MediaQuery.of(context).size.height * 0.92,
          ),
          child: Stack(
            children: [
              // Main image pager
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: const Color(0xFF1a1918),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.images.length,
                    onPageChanged: (i) => setState(() => _current = i),
                    itemBuilder: (context, index) {
                      return InteractiveViewer(
                        minScale: 1.0,
                        maxScale: 4.0,
                        child: Center(
                          child: Image.asset(
                            widget.images[index],
                            fit: BoxFit.contain,
                            errorBuilder: (_, _, _) => Center(
                              child: Icon(Icons.broken_image_outlined,
                                  color: Colors.white30, size: 64),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Close button
              Positioned(
                top: 12,
                right: 12,
                child: _CircleIconButton(
                  icon: Icons.close,
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),

              // Counter
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_current + 1} / ${widget.images.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              ),

              // Left arrow
              if (widget.images.length > 1)
                Positioned(
                  left: 8,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: _CircleIconButton(
                      icon: Icons.chevron_left,
                      size: 32,
                      enabled: _current > 0,
                      onTap: () => _go(-1),
                    ),
                  ),
                ),

              // Right arrow
              if (widget.images.length > 1)
                Positioned(
                  right: 8,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: _CircleIconButton(
                      icon: Icons.chevron_right,
                      size: 32,
                      enabled: _current < widget.images.length - 1,
                      onTap: () => _go(1),
                    ),
                  ),
                ),

              // Dot indicators
              if (widget.images.length > 1)
                Positioned(
                  bottom: 14,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.images.length, (i) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: i == _current ? 18 : 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: i == _current
                              ? Colors.white
                              : Colors.white.withAlpha(80),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool enabled;
  final double size;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
    this.enabled = true,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: size + 16,
        height: size + 16,
        decoration: BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: enabled ? Colors.white : Colors.white30,
          size: size,
        ),
      ),
    );
  }
}

void showGallery(BuildContext context, List<String> images, int initialIndex) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withAlpha(210),
    builder: (_) => GalleryDialog(images: images, initialIndex: initialIndex),
  );
}
