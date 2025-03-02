import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/gemini/gemini.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_api_key_dialog/add_api_key_dialog_widget.dart';
import '/components/chat_bubble/chat_bubble_widget.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/top_header/top_header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'gemini_chat_page_model.dart';
export 'gemini_chat_page_model.dart';

class GeminiChatPageWidget extends StatefulWidget {
  const GeminiChatPageWidget({super.key});

  static String routeName = 'GeminiChatPage';
  static String routePath = '/geminiChatPage';

  @override
  State<GeminiChatPageWidget> createState() => _GeminiChatPageWidgetState();
}

class _GeminiChatPageWidgetState extends State<GeminiChatPageWidget> {
  late GeminiChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeminiChatPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().geminiApiKey == 'NOT_SET') {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: AddApiKeyDialogWidget(),
              ),
            );
          },
        );
      }
    });

    _model.promptTextFieldTextController ??= TextEditingController();
    _model.promptTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                VerticalDivider(
                  width: 1.0,
                  thickness: 0.5,
                  color: FlutterFlowTheme.of(context).divider,
                ),
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.topHeaderModel,
                          updateCallback: () => safeSetState(() {}),
                          child: TopHeaderWidget(
                            hideOptionalMenuItems: false,
                            hasBackNav: true,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final message =
                                          FFAppState().chat.toList();
                                      if (message.isEmpty) {
                                        return Center(
                                          child: Container(
                                            width: 150.0,
                                            height: 150.0,
                                            child: EmptyStateWidget(),
                                          ),
                                        );
                                      }

                                      return ListView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width <
                                                    kBreakpointSmall
                                                ? 105.0
                                                : 150.0,
                                            150.0,
                                          ),
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: message.length,
                                        itemBuilder: (context, messageIndex) {
                                          final messageItem =
                                              message[messageIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1.0, 0.0, 0.0, 0.0),
                                            child: ChatBubbleWidget(
                                              key: Key(
                                                  'Keyr3n_${messageIndex}_of_${message.length}'),
                                              message: messageItem,
                                            ),
                                          );
                                        },
                                        controller:
                                            _model.chatListviewScrollable,
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 3.0,
                                        sigmaY: 3.0,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .backgroundAlpha,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              child: Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: 850.0,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      30.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 222.0,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .promptTextFieldTextController,
                                                              focusNode: _model
                                                                  .promptTextFieldFocusNode,
                                                              onFieldSubmitted:
                                                                  (_) async {
                                                                FFAppState()
                                                                        .prompt =
                                                                    _model
                                                                        .promptTextFieldTextController
                                                                        .text;
                                                                FFAppState()
                                                                    .addToChat(
                                                                        MessageStruct(
                                                                  text: _model
                                                                      .promptTextFieldTextController
                                                                      .text,
                                                                  role: 'user',
                                                                ));
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .promptTextFieldTextController
                                                                      ?.clear();
                                                                });
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500));
                                                                await _model
                                                                    .chatListviewScrollable
                                                                    ?.animateTo(
                                                                  _model
                                                                      .chatListviewScrollable!
                                                                      .position
                                                                      .maxScrollExtent,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                                FFAppState()
                                                                    .addToChat(
                                                                        MessageStruct(
                                                                  text: '',
                                                                  role: 'model',
                                                                ));
                                                                safeSetState(
                                                                    () {});
                                                                if (FFAppState()
                                                                        .selectedModel ==
                                                                    FFAppState()
                                                                        .availableModels
                                                                        .elementAtOrNull(
                                                                            0)) {
                                                                  _model.flashResponse =
                                                                      await GeminiFlashAPICall
                                                                          .call(
                                                                    messagesJson:
                                                                        functions.formatMessages(FFAppState()
                                                                            .chat
                                                                            .toList()),
                                                                    systemMessage:
                                                                        FFAppState()
                                                                            .systemMessage,
                                                                    apiKey: FFAppState()
                                                                        .geminiApiKey,
                                                                  );
                                                                  if (_model
                                                                          .flashResponse
                                                                          ?.succeeded ??
                                                                      true) {
                                                                    _model
                                                                        .flashResponse
                                                                        ?.streamedResponse
                                                                        ?.stream
                                                                        .transform(utf8
                                                                            .decoder)
                                                                        .transform(
                                                                            const LineSplitter())
                                                                        .transform(
                                                                            ServerSentEventLineTransformer())
                                                                        .map((m) =>
                                                                            ResponseStreamMessage(message: m))
                                                                        .listen(
                                                                      (onMessageInput) async {
                                                                        FFAppState()
                                                                            .updateChatAtIndex(
                                                                          FFAppState().chat.length -
                                                                              1,
                                                                          (e) => e
                                                                            ..text = '${FFAppState().chat.elementAtOrNull(FFAppState().chat.length - 1)?.text}${GeminiFlashAPICall.segment(
                                                                              onMessageInput.serverSentEvent.jsonData,
                                                                            )}',
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                        unawaited(
                                                                          () async {
                                                                            await _model.chatListviewScrollable?.animateTo(
                                                                              _model.chatListviewScrollable!.position.maxScrollExtent,
                                                                              duration: Duration(milliseconds: 150),
                                                                              curve: Curves.ease,
                                                                            );
                                                                          }(),
                                                                        );
                                                                      },
                                                                      onError:
                                                                          (onErrorInput) async {
                                                                        FFAppState()
                                                                            .addToChat(MessageStruct(
                                                                          text:
                                                                              'Oops, sorry that didn\'t go through. Try again or refresh!',
                                                                          role:
                                                                              'model',
                                                                        ));
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      onDone:
                                                                          () async {
                                                                        await _model
                                                                            .chatListviewScrollable
                                                                            ?.animateTo(
                                                                          _model
                                                                              .chatListviewScrollable!
                                                                              .position
                                                                              .maxScrollExtent,
                                                                          duration:
                                                                              Duration(milliseconds: 300),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                } else if (FFAppState()
                                                                        .selectedModel ==
                                                                    FFAppState()
                                                                        .availableModels
                                                                        .elementAtOrNull(
                                                                            1)) {
                                                                  _model.proResponse =
                                                                      await GeminiProCall
                                                                          .call(
                                                                    messagesJson:
                                                                        functions.formatMessages(FFAppState()
                                                                            .chat
                                                                            .toList()),
                                                                    systemMessage:
                                                                        FFAppState()
                                                                            .systemMessage,
                                                                    apiKey: FFAppState()
                                                                        .geminiApiKey,
                                                                  );
                                                                  if (_model
                                                                          .proResponse
                                                                          ?.succeeded ??
                                                                      true) {
                                                                    _model
                                                                        .proResponse
                                                                        ?.streamedResponse
                                                                        ?.stream
                                                                        .transform(utf8
                                                                            .decoder)
                                                                        .transform(
                                                                            const LineSplitter())
                                                                        .transform(
                                                                            ServerSentEventLineTransformer())
                                                                        .map((m) =>
                                                                            ResponseStreamMessage(message: m))
                                                                        .listen(
                                                                      (onMessageInput) async {
                                                                        FFAppState()
                                                                            .updateChatAtIndex(
                                                                          FFAppState().chat.length -
                                                                              1,
                                                                          (e) => e
                                                                            ..text = '${FFAppState().chat.elementAtOrNull(FFAppState().chat.length - 1)?.text}${GeminiProCall.segment(
                                                                              onMessageInput.serverSentEvent.jsonData,
                                                                            )}',
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                        unawaited(
                                                                          () async {
                                                                            await _model.chatListviewScrollable?.animateTo(
                                                                              _model.chatListviewScrollable!.position.maxScrollExtent,
                                                                              duration: Duration(milliseconds: 150),
                                                                              curve: Curves.ease,
                                                                            );
                                                                          }(),
                                                                        );
                                                                      },
                                                                      onError:
                                                                          (onErrorInput) async {
                                                                        FFAppState()
                                                                            .addToChat(MessageStruct(
                                                                          text:
                                                                              'Oops, sorry that didn\'t go through. Try again or refresh!',
                                                                          role:
                                                                              'model',
                                                                        ));
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      onDone:
                                                                          () async {
                                                                        await _model
                                                                            .chatListviewScrollable
                                                                            ?.animateTo(
                                                                          _model
                                                                              .chatListviewScrollable!
                                                                              .position
                                                                              .maxScrollExtent,
                                                                          duration:
                                                                              Duration(milliseconds: 300),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                } else {
                                                                  await geminiGenerateText(
                                                                    context,
                                                                    functions
                                                                        .formatMessages(FFAppState()
                                                                            .chat
                                                                            .toList())
                                                                        .toString(),
                                                                  ).then(
                                                                      (generatedText) {
                                                                    safeSetState(() =>
                                                                        _model.geminiNativeResponse =
                                                                            generatedText);
                                                                  });

                                                                  FFAppState()
                                                                      .updateChatAtIndex(
                                                                    FFAppState()
                                                                            .chat
                                                                            .length -
                                                                        1,
                                                                    (e) => e
                                                                      ..text =
                                                                          _model
                                                                              .geminiNativeResponse,
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                }

                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            300));
                                                                await _model
                                                                    .chatListviewScrollable
                                                                    ?.animateTo(
                                                                  _model
                                                                      .chatListviewScrollable!
                                                                      .position
                                                                      .maxScrollExtent,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .ease,
                                                                );

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintText:
                                                                    'Write your prompt here...',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedErrorBorder:
                                                                    InputBorder
                                                                        .none,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                              cursorColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              validator: _model
                                                                  .promptTextFieldTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        borderRadius: 6.0,
                                                        buttonSize: 40.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        hoverIconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        icon: Icon(
                                                          FFIcons
                                                              .kimagePictureAddPlus,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                      ))
                                                        FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                          borderRadius: 6.0,
                                                          buttonSize: 40.0,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                          hoverIconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          icon: Icon(
                                                            FFIcons
                                                                .kattachmentLink,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                          onPressed: () {
                                                            print(
                                                                'IconButton pressed ...');
                                                          },
                                                        ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                      ))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            borderRadius: 6.0,
                                                            buttonSize: 40.0,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            hoverColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            hoverIconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            icon: Icon(
                                                              FFIcons.kmicRec,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 21.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
