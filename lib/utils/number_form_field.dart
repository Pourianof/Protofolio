import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum NumberType {
  positiveInt(decimal: 0, negative: 0, positive: 1),
  decimalNumber(decimal: 1, negative: 1, positive: 1);

  const NumberType({
    required this.decimal,
    required this.negative,
    required this.positive,
  });
  final int positive;
  final int negative;
  final int decimal;

  bool isMatch(String val) {
    RegExp regexp;
    switch (this) {
      case NumberType.decimalNumber:
        {
          regexp = RegExp(r'^\d+\.?\d*$');
        }

        break;
      case NumberType.positiveInt:
        {
          regexp = RegExp(r'^\d*$');
        }
        break;
    }

    return regexp.hasMatch(val);
  }
}

class NumberFormField extends StatefulWidget {
  final TextFormField Function(BuildContext ctx, _NumberFormFieldState state)
      _builder;

  final TextEditingController? controller;
  final NumberType numberType;
  final String? initialValue;
  NumberFormField({
    super.key,
    this.numberType = NumberType.positiveInt,
    this.controller,
    Object groupId = EditableText,
    this.initialValue,
    FocusNode? focusNode,
    String? forceErrorText,
    InputDecoration? decoration = const InputDecoration(),
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    @Deprecated(
      'Use `contextMenuBuilder` instead. '
      'This feature was deprecated after v3.3.0-0.5.pre.',
    )
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    void Function(String)? onChanged,
    GestureTapCallback? onTap,
    bool onTapAlwaysCalled = false,
    TapRegionCallback? onTapOutside,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    void Function(String?)? onSaved,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    bool? ignorePointers,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    Color? cursorErrorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool? enableInteractiveSelection,
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode? autovalidateMode,
    ScrollController? scrollController,
    String? restorationId,
    bool enableIMEPersonalizedLearning = true,
    MouseCursor? mouseCursor,
    EditableTextContextMenuBuilder? contextMenuBuilder,
    SpellCheckConfiguration? spellCheckConfiguration,
    TextMagnifierConfiguration? magnifierConfiguration,
    UndoHistoryController? undoController,
    AppPrivateCommandCallback? onAppPrivateCommand,
    bool? cursorOpacityAnimates,
    ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,
    ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ContentInsertionConfiguration? contentInsertionConfiguration,
    MaterialStatesController? statesController,
    Clip clipBehavior = Clip.hardEdge,
    bool scribbleEnabled = true,
    bool canRequestFocus = true,
  }) : _builder = ((ctx, state) {
          return TextFormField(
            autovalidateMode: autovalidateMode,
            decoration: decoration,
            forceErrorText: forceErrorText,
            onSaved: onSaved,
            validator: validator,
            groupId: groupId,
            restorationId: restorationId,
            controller: state._effectiveController,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            style: style,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textAlignVertical: textAlignVertical,
            textDirection: textDirection,
            textCapitalization: textCapitalization,
            autofocus: autofocus,
            statesController: statesController,
            toolbarOptions: toolbarOptions,
            readOnly: readOnly,
            showCursor: showCursor,
            obscuringCharacter: obscuringCharacter,
            obscureText: obscureText,
            autocorrect: autocorrect,
            smartDashesType: smartDashesType,
            smartQuotesType: smartQuotesType,
            enableSuggestions: enableSuggestions,
            maxLengthEnforcement: maxLengthEnforcement,
            maxLines: maxLines,
            minLines: minLines,
            expands: expands,
            maxLength: maxLength,
            onChanged: onChanged,
            onTap: onTap,
            onTapAlwaysCalled: onTapAlwaysCalled,
            onTapOutside: onTapOutside,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            inputFormatters: inputFormatters,
            enabled: enabled,
            ignorePointers: ignorePointers,
            cursorWidth: cursorWidth,
            cursorHeight: cursorHeight,
            cursorRadius: cursorRadius,
            cursorColor: cursorColor,
            cursorErrorColor: cursorErrorColor,
            scrollPadding: scrollPadding,
            scrollPhysics: scrollPhysics,
            keyboardAppearance: keyboardAppearance,
            enableInteractiveSelection: enableInteractiveSelection,
            selectionControls: selectionControls,
            buildCounter: buildCounter,
            autofillHints: autofillHints,
            scrollController: scrollController,
            enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
            mouseCursor: mouseCursor,
            contextMenuBuilder: contextMenuBuilder,
            spellCheckConfiguration: spellCheckConfiguration,
            magnifierConfiguration: magnifierConfiguration,
            undoController: undoController,
            onAppPrivateCommand: onAppPrivateCommand,
            cursorOpacityAnimates: cursorOpacityAnimates,
            selectionHeightStyle: selectionHeightStyle,
            selectionWidthStyle: selectionWidthStyle,
            dragStartBehavior: dragStartBehavior,
            contentInsertionConfiguration: contentInsertionConfiguration,
            clipBehavior: clipBehavior,
            scribbleEnabled: scribbleEnabled,
            canRequestFocus: canRequestFocus,
          );
        });

  @override
  State<NumberFormField> createState() => _NumberFormFieldState();
}

class _NumberFormFieldState extends State<NumberFormField> {
  TextEditingController? _controller;
  late String _lastValue;

  TextEditingController get _effectiveController {
    if (widget.controller != null &&
        widget.controller != _controller &&
        _controller != null) {
      _controller!.removeListener(_handleInputChange);
      _controller = widget.controller;
      return _controller!;
    }
    return _controller ??= TextEditingController();
  }

  _handleInputChange() {
    if (!widget.numberType.isMatch(_effectiveController.text)) {
      _effectiveController.text = _lastValue;
    } else {
      _lastValue = _effectiveController.text;
    }
  }

  @override
  void initState() {
    super.initState();

    _lastValue = _effectiveController.text = widget.initialValue ?? '';
    _effectiveController.addListener(_handleInputChange);
  }

  @override
  Widget build(BuildContext context) {
    return widget._builder(context, this);
  }

  @override
  void dispose() {
    _effectiveController.removeListener(_handleInputChange);
    super.dispose();
  }
}
