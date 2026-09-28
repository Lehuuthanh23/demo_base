enum AppRole {
  customer('customer'),
  dealer('dealer');

  final String code;

  const AppRole(this.code);

  bool get isDealer => this == AppRole.dealer;
  bool get isCustomer => this == AppRole.customer;

  static AppRole fromCode(String? code) {
    return AppRole.values.firstWhere(
      (role) => role.code == code,
      orElse: () => AppRole.customer,
    );
  }
}
