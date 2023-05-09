import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/blog_provider.dart';
import '../repository/api_manager.dart';

class AddTopicWidget extends StatefulWidget {
  const AddTopicWidget({Key? key}) : super(key: key);

  @override
  State<AddTopicWidget> createState() => _AddTopicWidgetState();
}

class _AddTopicWidgetState extends State<AddTopicWidget> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        GlobalKey<FormState> _formKey = GlobalKey<FormState>();
        showDialog(
          context: context,
          builder: (context) {
            return BackdropFilter(
              filter: ImageFilter.erode(radiusX: 10),
              child: SimpleDialog(
                backgroundColor: const Color.fromRGBO(157, 157, 158, 0.6),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                titlePadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                title: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.newspaper_sharp,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Add Topic',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: title,
                          style: TextStyle(color: Theme.of(context).hintColor),
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                                color: Colors.white70,
                              ),
                            ),
                            labelText: 'Title',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                            ),
                            alignLabelWithHint: true,
                          ),
                          keyboardType: TextInputType.text,
                          validator: (input) =>
                              (input != null && input.trim().length < 3)
                                  ? 'not a valid Title'
                                  : null,
                        ),
                        TextFormField(
                          controller: description,
                          style: TextStyle(color: Theme.of(context).hintColor),
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                                color: Colors.white70,
                              ),
                            ),
                            labelText: 'Description',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                            ),
                            alignLabelWithHint: true,
                          ),
                          keyboardType: TextInputType.text,
                          validator: (input) =>
                              (input != null && input.trim().length < 3)
                                  ? 'not a valid Title'
                                  : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'cancel',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          final currentState = _formKey.currentState;
                          if (currentState != null && currentState.validate()) {
                            currentState.save();
                            final response =
                                await createTopic(title.text, description.text);

                              context.read<BlogProvider>().fetchTopics();
                              Navigator.pop(context);

                          }
                        },
                        child: const Text(
                          'save',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white70,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
      child: const Text('Add Topic'),
    );
  }
}
