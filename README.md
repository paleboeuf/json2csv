# json2csv

A simple ruby lib to convert JSON into CSV.

## Usage
### By command line :
```bash
ruby json2csv_cmd.rb file.json file.csv
```
If the CSV already exist, it will be overwritten.

### By including the lib
```ruby
require_relative 'lib/json2csv'
...
converter = Json2Csv.new()
converter.convert_file('data/user.json', 'users.csv')
...

```
If the CSV already exist, it will be overwritten.

## Example

**Input JSON**
```
$ cat data/users.json
     
[
  {
    "id": 0,
    "email": "colleengriffith@quintity.com",
    "tags": [
      "consectetur",
      "quis"
    ],
    "profiles": {
      "facebook": {
        "id": 0,
        "picture": "//fbcdn.com/a2244bc1-b10c-4d91-9ce8-184337c6b898.jpg"
      },
      "twitter": {
        "id": 0,
        "picture": "//twcdn.com/ad9e8cd3-3133-423e-8bbf-0602e4048c22.jpg"
      }
    }
  },
  {
    "id": 1,
    "email": "maryellengriffin@ginkle.com",
    "tags": [
      "veniam",
      "elit",
      "mollit"
    ],
    "profiles": {
      "facebook": {
        "id": 1,
        "picture": "//fbcdn.com/12e070e0-21ea-4663-97d0-46bc9c7b67a4.jpg"
      },
      "twitter": {
        "id": 1,
        "picture": "//twcdn.com/3057792f-5dfb-4c4b-86b5-cce4d6bbf7ac.jpg"
      }
    }
  },
  {
    "id": 2,
    "email": "hesterherman@exozent.com",
    "tags": [
      "consectetur",
      "et",
      "irure"
    ],
    "profiles": {
      "facebook": {
        "id": 2,
        "picture": "//fbcdn.com/412a957a-6387-44a5-91ac-3cad3cc2d8c1.jpg"
      },
      "twitter": {
        "id": 2,
        "picture": "//twcdn.com/4731911c-bd25-43fa-a152-877cd65f1ecb.jpg"
      }
    }
  },
  {
    "id": 3,
    "email": "romeromarks@exovent.com",
    "tags": [
      "sint",
      "laboris",
      "ad"
    ],
    "profiles": {
      "facebook": {
        "id": 3,
        "picture": "//fbcdn.com/557209e7-d617-4483-ac77-013690f58b10.jpg"
      },
      "twitter": {
        "id": 3,
        "picture": "//twcdn.com/56c4683a-78f4-4981-9497-bd8d254d09ff.jpg"
      }
    }
  },
  {
    "id": 4,
    "email": "marlamartin@stucco.com",
    "tags": [
      "id",
      "voluptate"
    ],
    "profiles": {
      "facebook": {
        "id": 4,
        "picture": "//fbcdn.com/1570cb6b-9384-411f-83bc-d933dc5d114d.jpg"
      },
      "twitter": {
        "id": 4,
        "picture": "//twcdn.com/aa247d25-a088-40f5-94ca-4ab6c90206e2.jpg"
      }
    }
  },
  {
    "id": 5,
    "email": "weekschase@maxemia.com",
    "tags": [
      "ullamco",
      "consequat",
      "do"
    ],
    "profiles": {
      "facebook": {
        "id": 5,
        "picture": "//fbcdn.com/c1ee744b-7962-48d3-b8fd-96ca55425ea0.jpg"
      },
      "twitter": {
        "id": 5,
        "picture": "//twcdn.com/c13d7066-1c78-480e-aa46-aa85b2ab3e48.jpg"
      }
    }
  },
  {
    "id": 6,
    "email": "grahamrichardson@marketoid.com",
    "tags": [
      "fugiat",
      "sint",
      "voluptate"
    ],
    "profiles": {
      "facebook": {
        "id": 6,
        "picture": "//fbcdn.com/67741ba9-53fb-4bd4-bb42-516ab8f3e1bd.jpg"
      },
      "twitter": {
        "id": 6,
        "picture": "//twcdn.com/d141e08e-ed47-46dd-bdba-6c634b903f7e.jpg"
      }
    }
  },
  {
    "id": 7,
    "email": "mendozavalentine@entality.com",
    "tags": [
      "nulla",
      "sint"
    ],
    "profiles": {
      "facebook": {
        "id": 7,
        "picture": "//fbcdn.com/4ca3087b-3c36-4f33-8ced-85996c44a4b0.jpg"
      },
      "twitter": {
        "id": 7,
        "picture": "//twcdn.com/243d581a-4376-4ce6-80c1-12352856b5bf.jpg"
      }
    }
  },
  {
    "id": 8,
    "email": "wademcleod@updat.com",
    "tags": [
      "fugiat",
      "duis",
      "exercitation"
    ],
    "profiles": {
      "facebook": {
        "id": 8,
        "picture": "//fbcdn.com/b05115ad-fec0-4635-a8b5-af046805d2c9.jpg"
      },
      "twitter": {
        "id": 8,
        "picture": "//twcdn.com/3a73caa1-ae33-4527-bcc9-4d3b274c1ece.jpg"
      }
    }
  },
  {
    "id": 9,
    "email": "bakerwatson@geekosis.com",
    "tags": [
      "Lorem",
      "cupidatat"
    ],
    "profiles": {
      "facebook": {
        "id": 9,
        "picture": "//fbcdn.com/548c4633-4f74-4803-ab19-e3cb5acd526d.jpg"
      },
      "twitter": {
        "id": 9,
        "picture": "//twcdn.com/f7a1e1d1-f96d-4274-9469-a99313bac94e.jpg"
      }
    }
  }
```  
**Convert JSON to CSV**
```
$ ruby json2csv_cmd.rb data/users.json users.csv
```
  
**Output CSV**
```
$ cat users.csv 

id,email,tags,profiles.facebook.id,profiles.facebook.picture,profiles.twitter.id,profiles.twitter.picture
0,colleengriffith@quintity.com,"consectetur,quis",0,//fbcdn.com/a2244bc1-b10c-4d91-9ce8-184337c6b898.jpg,0,//twcdn.com/ad9e8cd3-3133-423e-8bbf-0602e4048c22.jpg
1,maryellengriffin@ginkle.com,"veniam,elit,mollit",1,//fbcdn.com/12e070e0-21ea-4663-97d0-46bc9c7b67a4.jpg,1,//twcdn.com/3057792f-5dfb-4c4b-86b5-cce4d6bbf7ac.jpg
2,hesterherman@exozent.com,"consectetur,et,irure",2,//fbcdn.com/412a957a-6387-44a5-91ac-3cad3cc2d8c1.jpg,2,//twcdn.com/4731911c-bd25-43fa-a152-877cd65f1ecb.jpg
3,romeromarks@exovent.com,"sint,laboris,ad",3,//fbcdn.com/557209e7-d617-4483-ac77-013690f58b10.jpg,3,//twcdn.com/56c4683a-78f4-4981-9497-bd8d254d09ff.jpg
4,marlamartin@stucco.com,"id,voluptate",4,//fbcdn.com/1570cb6b-9384-411f-83bc-d933dc5d114d.jpg,4,//twcdn.com/aa247d25-a088-40f5-94ca-4ab6c90206e2.jpg
5,weekschase@maxemia.com,"ullamco,consequat,do",5,//fbcdn.com/c1ee744b-7962-48d3-b8fd-96ca55425ea0.jpg,5,//twcdn.com/c13d7066-1c78-480e-aa46-aa85b2ab3e48.jpg
6,grahamrichardson@marketoid.com,"fugiat,sint,voluptate",6,//fbcdn.com/67741ba9-53fb-4bd4-bb42-516ab8f3e1bd.jpg,6,//twcdn.com/d141e08e-ed47-46dd-bdba-6c634b903f7e.jpg
7,mendozavalentine@entality.com,"nulla,sint",7,//fbcdn.com/4ca3087b-3c36-4f33-8ced-85996c44a4b0.jpg,7,//twcdn.com/243d581a-4376-4ce6-80c1-12352856b5bf.jpg
8,wademcleod@updat.com,"fugiat,duis,exercitation",8,//fbcdn.com/b05115ad-fec0-4635-a8b5-af046805d2c9.jpg,8,//twcdn.com/3a73caa1-ae33-4527-bcc9-4d3b274c1ece.jpg
9,bakerwatson@geekosis.com,"Lorem,cupidatat",9,//fbcdn.com/548c4633-4f74-4803-ab19-e3cb5acd526d.jpg,9,//twcdn.com/f7a1e1d1-f96d-4274-9469-a99313bac94e.jpg
```