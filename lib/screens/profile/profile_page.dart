import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ShadForm(
              key: formKey,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ShadAvatar(
                      'https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4',
                      size: Size(200, 200),
                      placeholder: Text('AA'),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ShadInputFormField(
                            id: 'firstName',
                            label: Text('First Name', style: ShadTheme.of(context).textTheme.h4,),
                            placeholder: Text('Enter your first name', style: ShadTheme.of(context).textTheme.muted,),
                            keyboardType: TextInputType.name,
                            validator: (v) {
                              if (v.isEmpty) {
                                return 'First name is required.';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ShadInputFormField(
                            id: 'lastName',
                            label: Text('Last Name', style: ShadTheme.of(context).textTheme.h4,),
                            placeholder: Text('Enter your Last name', style: ShadTheme.of(context).textTheme.muted,),
                            keyboardType: TextInputType.name,
                            validator: (v) {
                              if (v.isEmpty) {
                                return 'Last name is required.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ShadInputFormField(
                            id: 'email',
                            label: Text('Email', style: ShadTheme.of(context).textTheme.h4,),
                            placeholder: Text('Enter your Email', style: ShadTheme.of(context).textTheme.muted,),
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) {
                              if (v.isEmpty) {
                                return 'Email is required.';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v)) {
                                return 'Enter a valid email address.';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ShadInputFormField(
                            id: 'phone',
                            label: Text('Phone Number', style: ShadTheme.of(context).textTheme.h4,),
                            placeholder: Text('Enter your Phone Number', style: ShadTheme.of(context).textTheme.muted,),
                            keyboardType: TextInputType.phone,
                            validator: (v) {
                              if (v.isEmpty) {
                                return 'Phone number is required.';
                              }
                              if (!RegExp(r'^\+?[\d\s-]{10,}$').hasMatch(v)) {
                                return 'Enter a valid phone number.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ShadButton(
                      child: const Text('Save Changes'),
                      onPressed: () {
                        if (formKey.currentState!.saveAndValidate()) {
                          print('Form validation succeeded with ${formKey.currentState!.value}');
                          // TODO: Implement save logic
                        } else {
                          print('Form validation failed');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}