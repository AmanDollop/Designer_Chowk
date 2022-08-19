class BlogData {
  String? message;
  List<Blog>? blog;

  BlogData({this.message, this.blog});

  BlogData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['blog'] != null) {
      blog = <Blog>[];
      json['blog'].forEach((v) {
        blog!.add(new Blog.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.blog != null) {
      data['blog'] = this.blog!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Blog {
  String? blogId;
  String? cityIds;
  String? categoryId;
  String? blogTitle;
  String? blogImage;
  String? blogDescription;
  String? language;
  String? location;
  String? blogTitleHindi;
  String? blogDescriptionHindi;
  String? isActive;
  String? createdAt;

  Blog(
      {this.blogId,
        this.cityIds,
        this.categoryId,
        this.blogTitle,
        this.blogImage,
        this.blogDescription,
        this.language,
        this.location,
        this.blogTitleHindi,
        this.blogDescriptionHindi,
        this.isActive,
        this.createdAt});

  Blog.fromJson(Map<String, dynamic> json) {
    blogId = json['blog_id'];
    cityIds = json['cityIds'];
    categoryId = json['category_id'];
    blogTitle = json['blog_title'];
    blogImage = json['blog_image'];
    blogDescription = json['blog_description'];
    language = json['language'];
    location = json['location'];
    blogTitleHindi = json['blog_title_hindi'];
    blogDescriptionHindi = json['blog_description_hindi'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blog_id'] = this.blogId;
    data['cityIds'] = this.cityIds;
    data['category_id'] = this.categoryId;
    data['blog_title'] = this.blogTitle;
    data['blog_image'] = this.blogImage;
    data['blog_description'] = this.blogDescription;
    data['language'] = this.language;
    data['location'] = this.location;
    data['blog_title_hindi'] = this.blogTitleHindi;
    data['blog_description_hindi'] = this.blogDescriptionHindi;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    return data;
  }
}