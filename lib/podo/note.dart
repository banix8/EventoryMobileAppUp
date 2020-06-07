class Note {
    String image;
    String phone;
    String address;
    String category;
    //int rate;
    //int years;
    String bio;
    //int isFav;
    //int accountID;
    String sFB;


  Note(
      this.image,
      this.phone,
      this.address,
      this.category,
      //this.rate,
      //this.years,
      this.bio,
     // this.isFav,
      //this.accountID,
      this.sFB,
    );

  Note.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    phone = json['supplierPhone'];
    address = json['supplierAddress'];
    category = json['supplierCategory'];
    //rate = json['supplierRate'];
    //years = json['supplierYears'];
    bio = json['supplierBio'];
    //isFav = json['isFavorite'];
    // /accountID = json['accountID'];
    sFB = json['supplierFacebook'];
  }
}
