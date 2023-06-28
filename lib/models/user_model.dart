// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names

class user_model {
  final id, name, email, address;

  user_model({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
  });

  Map<String, dynamic> add_data() {
    return {
      "name": name,
      "email": email,
      "address": address,
    };
  }
}
