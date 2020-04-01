class DataOBJ{

  int id;
  String title;
  List<dynamic> img;
  String interest;
  int price;
  String date;
  String address;
  String trainerName;
  String trainerImg;
  String trainerInfo;
  String occasionDetail;

  DataOBJ(
      {
        this.id,
        this.title,
        this.img,
        this.interest,
        this.price,
        this.date,
        this.address,
        this.trainerName,
        this.trainerImg,
        this.trainerInfo,
        this.occasionDetail,
      });

  // map the data from json map to obj
  factory DataOBJ.fromJson(Map<dynamic, dynamic> json) {


    List<dynamic> imgs =json['img'];
   // List<dynamic> filterd_imgs;
    for(int i =0;i<json['img'].length;i++)
      {
        imgs[i]=imgs[i].toString().replaceFirst('s', '');
        print('0xxzz: ${ imgs[i]}');
      }
    return DataOBJ(
       id:json['id'],
       title:json['title'],
       img: imgs,
       interest:json['interest'],
       price:json['price'],
       date:json['date'],
       address:json['address'],
       trainerName:json['trainerName'],
       trainerImg:json['trainerImg'].toString().replaceFirst('s', ''),
       trainerInfo:json['trainerInfo'],
       occasionDetail:json['occasionDetail'],
    );
  }




}

//"$y-$m-${d}T$h:$min:$sec.$ms${us}Z"