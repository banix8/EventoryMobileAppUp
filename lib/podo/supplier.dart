class Supplier {
    String image;
    String phone;
    String address;
    String category;
    String rate;
    String years;
    String bio;
    String isFav;
    int accountID;
    String sFB;


  Supplier(
      this.image,
      this.phone,
      this.address,
      this.category,
      this.rate,
      this.years,
      this.bio,
      this.isFav,
      this.accountID,
      this.sFB,
  );


  Supplier.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    phone = json['supplierPhone'];
    address = json['supplierAddress'];
    category = json['supplierCategory'];
    rate = json['supplierRate'];
    years = json['supplierYears'];
    bio = json['supplierBio'];
    isFav = json['isFavorite'];
    accountID = json['accountID'];
    sFB = json['supplierFacebook'];
 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['supplierPhone'] = this.phone;
    data['supplierAddress'] = this.address;
    data['supplierCategory'] = this.category;
    data['supplierRate'] = this.rate;
    data['supplierYears'] = this.years;
    data['supplierBio'] = this.bio;
    data['isFavorite'] = this.isFav;
    data['accountID'] = this.accountID;
    data['supplierFacebook'] = this.sFB;
    
    return data;
  }
}
