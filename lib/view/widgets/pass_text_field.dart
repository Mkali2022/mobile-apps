import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PassTextFild extends StatefulWidget {
  final String? hintText;

  // final formKey;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Color? fillColor;
  final int? maxLines;
  final bool? isPassword;
  final bool? isCountryPicker;
  final bool? isShowBorder;
  final bool isRepass;
  final bool? isIcon;
  final bool? isShowSuffixIcon;
  final bool? isShowPrefixIcon;
  final VoidCallback? onSuffixTap;
  final String? suffixIconUrl;
  final bool? autoValidate;
  final String originalPass;
  final String? rePass;
  final ValueChanged<String>? onChanged;
  final String? prefixIconUrl;
  final Function? onSubmit;
  final FormFieldValidator<String>? validator;
  final bool? isEnabled;
  final TextCapitalization? capitalization;
  final int? maxLength;

  PassTextFild({
    this.hintText = 'Write something...',
    this.controller,
    this.focusNode,
    // this.formKey,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.maxLength,
    this.rePass,
    this.onSuffixTap,
    this.fillColor,
    this.onSubmit,
    this.capitalization = TextCapitalization.none,
    this.isCountryPicker = false,
    this.isShowBorder = false,
    this.isShowSuffixIcon = false,
    this.isShowPrefixIcon = false,
    this.isIcon = false,
    this.isPassword = false,
    this.suffixIconUrl,
    this.prefixIconUrl,
    this.isRepass = false,
    this.originalPass = '',
    this.autoValidate = true,
    this.validator, this.onChanged,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<PassTextFild> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        validator: widget.validator != null
            ? (value) => widget.validator!(value)
            : (value) {
                RegExp regExpCapital =
                    RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?!.*[&%$]).{8,}$');
                return regExpCapital.hasMatch(value!) ? null : 'passRegex'.tr;
              },
        onChanged:widget.onChanged,
        maxLines: widget.maxLines,
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLength: widget.maxLength,
        style: const TextStyle(
          fontSize: 16,
        ),

        textInputAction: widget.inputAction,
        keyboardType: widget.inputType,
        cursorColor: Theme.of(context).primaryColor,
        // autovalidateMode:widget.isRepass? AutovalidateMode.always:AutovalidateMode.disabled,
        enabled: widget.isEnabled,
        // onFieldSubmitted: (value) {
        //   widget.formKey!.currentState!.validate();
        // },
        autofocus: false,
        //onChanged: widget.isSearch ? widget.languageProvider.searchLanguage : null,
        obscureText: widget.isPassword! ? _obscureText : false,
        inputFormatters: widget.inputType == TextInputType.phone
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
              ]
            : null,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 4,
                  color: Colors.grey.shade300)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 4,
                  color: Colors.grey.shade300)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 4,
                  color: Colors.grey.shade300)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 4,
                  color: Colors.grey.shade300)),
          isDense: true,
          counterText: '',
          hintText: widget.hintText,
          errorMaxLines: 2,
          fillColor: widget.fillColor ?? Colors.white,
          hintStyle: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontSize: 14, color: Colors.grey),
          filled: true,
          prefixIcon: widget.isShowPrefixIcon!
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Image.asset(widget.prefixIconUrl!),
                )
              : const SizedBox.shrink(),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 23, maxHeight: 20),
          suffixIcon: widget.isShowSuffixIcon!
              ? widget.isPassword!
                  ? IconButton(
                      icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).hintColor.withOpacity(0.3)),
                      onPressed: _toggle)
                  : widget.isIcon!
                      ? IconButton(
                          onPressed: widget.onSuffixTap,
                          icon: Image.asset(
                            widget.suffixIconUrl!,
                            width: 15,
                            height: 15,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        )
                      : null
              : null,
        ),

        // onSubmitted: (text) => widget.nextFocus != null
        //     ? FocusScope.of(context).requestFocus(widget.nextFocus)
        //     : widget.onSubmit != null
        //     ? widget.onSubmit!(text)
        //     : null,
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
