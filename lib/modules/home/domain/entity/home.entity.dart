class HomeEntity {
  List<ImagePushs>? imagePushs;
  List<ShelfPushs>? shelfPushs;
  List<Editorials>? editorials;

  HomeEntity({this.imagePushs, this.shelfPushs, this.editorials});

  HomeEntity.fromJson(Map<String, dynamic> json) {
    if (json['ImagePushs'] != null) {
      imagePushs = <ImagePushs>[];
      json['ImagePushs'].forEach((v) {
        imagePushs!.add(ImagePushs.fromJson(v));
      });
    }
    if (json['ShelfPushs'] != null) {
      shelfPushs = <ShelfPushs>[];
      json['ShelfPushs'].forEach((v) {
        shelfPushs!.add(ShelfPushs.fromJson(v));
      });
    }
    if (json['Editorials'] != null) {
      editorials = <Editorials>[];
      json['Editorials'].forEach((v) {
        editorials!.add(Editorials.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.imagePushs != null) {
      data['ImagePushs'] = this.imagePushs!.map((v) => v.toJson()).toList();
    }
    if (this.shelfPushs != null) {
      data['ShelfPushs'] = this.shelfPushs!.map((v) => v.toJson()).toList();
    }
    if (this.editorials != null) {
      data['Editorials'] = this.editorials!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImagePushs {
  String? imageUrl;
  String? title;
  String? selectionPageName;

  ImagePushs({this.imageUrl, this.title, this.selectionPageName});

  ImagePushs.fromJson(Map<String, dynamic> json) {
    imageUrl = json['ImageUrl'];
    title = json['Title'];
    selectionPageName = json['SelectionPageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageUrl'] = this.imageUrl;
    data['Title'] = this.title;
    data['SelectionPageName'] = this.selectionPageName;
    return data;
  }
}

class ShelfPushs {
  String? selectionUrl;
  String? id;
  int? order;
  String? title;
  int? totalCount;
  List<Products>? products;

  ShelfPushs(
      {this.selectionUrl,
      this.id,
      this.order,
      this.title,
      this.totalCount,
      this.products});

  ShelfPushs.fromJson(Map<String, dynamic> json) {
    selectionUrl = json['SelectionUrl'];
    id = json['Id'];
    order = json['Order'];
    title = json['Title'];
    totalCount = json['TotalCount'];
    if (json['Products'] != null) {
      products = <Products>[];
      json['Products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SelectionUrl'] = this.selectionUrl;
    data['Id'] = this.id;
    data['Order'] = this.order;
    data['Title'] = this.title;
    data['TotalCount'] = this.totalCount;
    if (this.products != null) {
      data['Products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  List<ImageUrls>? imageUrls;
  String? author;
  List<String>? extensions;
  List<Offers>? offers;
  Extract? extract;
  int? right;
  String? estimatedReadTime;
  String? ownerDisplayableUserName;
  String? ownerUserName;
  double? rentalPriceByPages;
  int? themeId;
  int? categoryId;
  int? rootThemeId;
  String? documentProtectionTypeName;
  bool? voteEligibility;
  int? voteValue;
  Null? voteCampainLabel;
  List<PlaylistModel>? playlistModel;
  double? totalDuration;
  int? nbParts;
  String? narrator;
  List<String>? languagesIsoCode;
  int? ownerId;
  int? numberOfPages;
  List<int>? classificationsIds;
  List<Tags>? tags;
  bool? isFavorite;
  bool? isOffline;
  String? publishDate;
  Null? origin;
  List<People>? people;
  int? collectionId;
  String? collectionTitle;

  Products(
      {this.id,
      this.title,
      this.description,
      this.imageUrls,
      this.author,
      this.extensions,
      this.offers,
      this.extract,
      this.right,
      this.estimatedReadTime,
      this.ownerDisplayableUserName,
      this.ownerUserName,
      this.rentalPriceByPages,
      this.themeId,
      this.categoryId,
      this.rootThemeId,
      this.documentProtectionTypeName,
      this.voteEligibility,
      this.voteValue,
      this.voteCampainLabel,
      this.playlistModel,
      this.totalDuration,
      this.nbParts,
      this.narrator,
      this.languagesIsoCode,
      this.ownerId,
      this.numberOfPages,
      this.classificationsIds,
      this.tags,
      this.isFavorite,
      this.isOffline,
      this.publishDate,
      this.origin,
      this.people,
      this.collectionId,
      this.collectionTitle});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    description = json['Description'];
    if (json['ImageUrls'] != null) {
      imageUrls = <ImageUrls>[];
      json['ImageUrls'].forEach((v) {
        imageUrls!.add(new ImageUrls.fromJson(v));
      });
    }
    author = json['Author'];
    extensions = json['Extensions'].cast<String>();
    if (json['Offers'] != null) {
      offers = <Offers>[];
      json['Offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
      });
    }
    extract =
        json['Extract'] != null ? new Extract.fromJson(json['Extract']) : null;
    right = json['Right'];
    estimatedReadTime = json['EstimatedReadTime'];
    ownerDisplayableUserName = json['OwnerDisplayableUserName'];
    ownerUserName = json['OwnerUserName'];
    rentalPriceByPages = json['RentalPriceByPages'];
    themeId = json['ThemeId'];
    categoryId = json['CategoryId'];
    rootThemeId = json['RootThemeId'];
    documentProtectionTypeName = json['DocumentProtectionTypeName'];
    voteEligibility = json['VoteEligibility'];
    voteValue = json['VoteValue'];
    voteCampainLabel = json['VoteCampainLabel'];
    if (json['PlaylistModel'] != null) {
      playlistModel = <PlaylistModel>[];
      json['PlaylistModel'].forEach((v) {
        playlistModel!.add(new PlaylistModel.fromJson(v));
      });
    }
    totalDuration = json['TotalDuration'];
    nbParts = json['NbParts'];
    narrator = json['Narrator'];
    languagesIsoCode = json['LanguagesIsoCode'].cast<String>();
    ownerId = json['OwnerId'];
    numberOfPages = json['NumberOfPages'];
    classificationsIds = json['ClassificationsIds'].cast<int>();
    if (json['Tags'] != null) {
      tags = <Tags>[];
      json['Tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    isFavorite = json['IsFavorite'];
    isOffline = json['IsOffline'];
    publishDate = json['PublishDate'];
    origin = json['Origin'];
    if (json['People'] != null) {
      people = <People>[];
      json['People'].forEach((v) {
        people!.add(new People.fromJson(v));
      });
    }
    collectionId = json['CollectionId'];
    collectionTitle = json['CollectionTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Title'] = this.title;
    data['Description'] = this.description;
    if (this.imageUrls != null) {
      data['ImageUrls'] = this.imageUrls!.map((v) => v.toJson()).toList();
    }
    data['Author'] = this.author;
    data['Extensions'] = this.extensions;
    if (this.offers != null) {
      data['Offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    if (this.extract != null) {
      data['Extract'] = this.extract!.toJson();
    }
    data['Right'] = this.right;
    data['EstimatedReadTime'] = this.estimatedReadTime;
    data['OwnerDisplayableUserName'] = this.ownerDisplayableUserName;
    data['OwnerUserName'] = this.ownerUserName;
    data['RentalPriceByPages'] = this.rentalPriceByPages;
    data['ThemeId'] = this.themeId;
    data['CategoryId'] = this.categoryId;
    data['RootThemeId'] = this.rootThemeId;
    data['DocumentProtectionTypeName'] = this.documentProtectionTypeName;
    data['VoteEligibility'] = this.voteEligibility;
    data['VoteValue'] = this.voteValue;
    data['VoteCampainLabel'] = this.voteCampainLabel;
    if (this.playlistModel != null) {
      data['PlaylistModel'] =
          this.playlistModel!.map((v) => v.toJson()).toList();
    }
    data['TotalDuration'] = this.totalDuration;
    data['NbParts'] = this.nbParts;
    data['Narrator'] = this.narrator;
    data['LanguagesIsoCode'] = this.languagesIsoCode;
    data['OwnerId'] = this.ownerId;
    data['NumberOfPages'] = this.numberOfPages;
    data['ClassificationsIds'] = this.classificationsIds;
    if (this.tags != null) {
      data['Tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    data['IsFavorite'] = this.isFavorite;
    data['IsOffline'] = this.isOffline;
    data['PublishDate'] = this.publishDate;
    data['Origin'] = this.origin;
    if (this.people != null) {
      data['People'] = this.people!.map((v) => v.toJson()).toList();
    }
    data['CollectionId'] = this.collectionId;
    data['CollectionTitle'] = this.collectionTitle;
    return data;
  }
}

class ImageUrls {
  int? height;
  String? url;
  int? width;

  ImageUrls({this.height, this.url, this.width});

  ImageUrls.fromJson(Map<String, dynamic> json) {
    height = json['Height'];
    url = json['Url'];
    width = json['Width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Height'] = this.height;
    data['Url'] = this.url;
    data['Width'] = this.width;
    return data;
  }
}

class Offers {
  int? type;

  Offers({this.type});

  Offers.fromJson(Map<String, dynamic> json) {
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Type'] = this.type;
    return data;
  }
}

class Extract {
  int? id;
  List<String>? extensions;

  Extract({this.id, this.extensions});

  Extract.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    extensions = json['Extensions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Extensions'] = this.extensions;
    return data;
  }
}

class PlaylistModel {
  int? documentId;
  String? title;
  int? orderId;
  double? chapterDuration;

  PlaylistModel(
      {this.documentId, this.title, this.orderId, this.chapterDuration});

  PlaylistModel.fromJson(Map<String, dynamic> json) {
    documentId = json['DocumentId'];
    title = json['Title'];
    orderId = json['OrderId'];
    chapterDuration = json['ChapterDuration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocumentId'] = this.documentId;
    data['Title'] = this.title;
    data['OrderId'] = this.orderId;
    data['ChapterDuration'] = this.chapterDuration;
    return data;
  }
}

class Tags {
  int? id;
  String? value;

  Tags({this.id, this.value});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Value'] = this.value;
    return data;
  }
}

class People {
  String? firstName;
  String? lastName;
  String? function;
  int? id;

  People({this.firstName, this.lastName, this.function, this.id});

  People.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
    lastName = json['LastName'];
    function = json['Function'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Function'] = this.function;
    data['Id'] = this.id;
    return data;
  }
}

class Editorials {
  int? typeId;
  String? firstImage;
  String? secondImage;
  Null? backgroundImage;
  String? firstLink;
  String? secondLink;
  int? order;

  Editorials(
      {this.typeId,
      this.firstImage,
      this.secondImage,
      this.backgroundImage,
      this.firstLink,
      this.secondLink,
      this.order});

  Editorials.fromJson(Map<String, dynamic> json) {
    typeId = json['TypeId'];
    firstImage = json['FirstImage'];
    secondImage = json['SecondImage'];
    backgroundImage = json['BackgroundImage'];
    firstLink = json['FirstLink'];
    secondLink = json['SecondLink'];
    order = json['Order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TypeId'] = this.typeId;
    data['FirstImage'] = this.firstImage;
    data['SecondImage'] = this.secondImage;
    data['BackgroundImage'] = this.backgroundImage;
    data['FirstLink'] = this.firstLink;
    data['SecondLink'] = this.secondLink;
    data['Order'] = this.order;
    return data;
  }
}
