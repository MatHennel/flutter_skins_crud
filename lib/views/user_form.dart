import 'package:flutter/material.dart';
import 'package:flutter_skins_crud/models/user.dart';
import 'package:flutter_skins_crud/provider/users.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_skins_crud/components/skin_list.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formDATA = {};
  List<String> avatarUrls = [
    "https://arena.rtp.pt/wp-content/uploads/2023/03/wild-lotus-860x507-1.png",
    "https://s2-techtudo.glbimg.com/Yt1KyOropQxteSSgbgTlMgXfSxo=/0x0:1280x720/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2019/Q/C/abgL3mSDWNqZpdoA8jhA/novo-projeto-75-.jpg",
    "https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_cu_deagle_kitch_light_large.0df9b5246d27786b413642f5fc959f37d8892c3a.png",
    'https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRobndNekplbWtWMDh5a200YU9oT1Q5UExYUW1sUmQ0Y0o1bnRiTjlKN3lqUnF3LTBvNFpXdndjSWJFZFFRN01sN1RyMW52d3VmdmdNQzZ1cy1ibUhaaTZIRWdzQ3ZZbGtDX24xZ1NPYXNIRXVZZi81MTJ4Mzg0/auto/auto/85/notrim/ea1d2d4773d461e191522ed432959c72.webp',
    'https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplbWtWMDktNWs1U0Rudm56SUlUZG4yeFpfUHA5aV92RzhNS3NpZ0RpX0VzOVpHbWdKNGVRSndOcVoxaUItRkc5eGUzcDE1SHR0WmlhblhZd3YzUnh0bmZVZ1ZYcDFsSmdGWjQxLzUxMngzODQ-/auto/auto/85/notrim/796732af024b7f27919c0e89e6bd6182.webp',
    'https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplbWtWMDkybG5ZbUdtT0hMUDdMV25uOXU1TVJqamV5UG85cWdqbGZucVV0dk1HSHpJSUNXZXc0NWFWLUJfMWJxdzd1NWdzZTE2SlRLd1hCbnZpZ2c1V0dkd1VMM1ZZdGJVQS81MTJ4Mzg0/auto/auto/85/notrim/603be131442ee64e08c3b0b52bf696dc.webp',
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplZ0pLNmQyeXE1T0RtT1BMTzdUZG1WUmQ0Y0o1bnRiTjlKN3lqUnJzX2hFNWEyMmhkWUhHY2dFM1lGX1U4MUxzeWJ2bjFKQzY3NVNkd0hjd3N5SXFzQzJJbDBleG4xZ1NPVFVLUnBGdi81MTJ4Mzg0/auto/auto/85/notrim/7b5dfd1209147ab0113ed5adbf76e074.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRobndNekplbWtWMDk2Nm00LVBoT2Y3SWFfdW1tSlc0TkZPaHVqVDhvbTczQVN5LTBScU5XLWhMWVRBY2c1dk1ndlRfVm00d2VmdGhwT192OHlZd0hWbHNpY3I0QzNmelF2MzMwXzc5ZXlwRkEvNTEyeDM4NA--/auto/auto/85/notrim/518d3017011c760f97adf3a144650a0a.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplbWtWMDlLX2s0aWZnUDduTzRUZG4yeFpfUHA5aV92RzhNS2xpd0RoODBJLU5tbjZJTk9YSUZJNVlscUNyd0tfeWJ1OTBjZm92c3ZPeUNCaXVpRXF0Q25mZ1ZYcDFpTmhHdTBGLzUxMngzODQ-/auto/auto/85/notrim/372d8e1234f44eec33f48410fb4a95fb.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRobndNekplbWtWMDltN2hKS09oT1RMUDdMV25uOXU1TVJqamV5UDg5U2tqQVMyLTBRNE1EandMSWVUY1FOdGFWR0dfVlhza3JxOWc4UzZ1TXpQblNObDd5Z2p0bUdkd1VKcW1jeVM2dy81MTJ4Mzg0/auto/auto/85/notrim/16037f3a5b12fda55f0aaed0bfbc7c65.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplbWtWMDkyNGdZS0NoTWo0T3J6WmdsUmQ2ZGQyajZlVXA0M3dpd2ZncWtNNFoyNzBMSU9VY0ZBNmFGN1NxRmE1eU83dGpKTHU3c2pJelhGbnZTa24tei1EeU1sb1dzRmMvNTEyeDM4NA--/auto/auto/85/notrim/c0ff37021e6a99a2fd4122b38d3b3a25.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplbWtWMDktNWxwS0txUHY5TkxQRnFXZFEtc0oweEw2VnJOajNqbEN5XzB0cFpqLW5JTk9USXdScU13elo4bExybGU2LWg1S183NVhKbkNScnVTQThwU0dLRXR3eVN0OC81MTJ4Mzg0/auto/auto/85/notrim/348daed380234d70adf71efe5653a3df.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplbkFXdS1PbW5JR0ZnX2o1RExfWWhYbEUtTkYtbU5iTl9JdjluR3U0cWdFN05uZWdKWUxESVZOc05GblhxMVh0d0xfcWhaX3A2TTdNd0hVeHVTTjJ0aTNVelJEajBrd2RiZWM5bTdYQUhrcUdCY1AxLzUxMngzODQ-/auto/auto/85/notrim/2474bc88e2b58d56360b2acd55dd4072.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplbWtWMDkyNGxaS0luLTdMUDdMV25uOXU1TVJqamV5UG80bXMwRkxrcUVVNk1EdjdKZGZFSjFWdllWdURfMWZybExycGpaLTZ2c3ZNeVNGcTczWXI0V0dkd1VJdC1HUUk5Zy81MTJ4Mzg0/auto/auto/85/notrim/eebed1c27d5bb06717d90a6c81ba5808.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoaHdzekhlREZINk9PNm5ZZURnOGo0TXFuV2t5VUl1c1lwanJpVG9JbWhqUUhnX0Vaa04ycjBjWS1SZEFJM1oxalQtZ1Mza09fbmpaV183cGpCMXpJOTdUMkZJSzNYLzUxMngzODQ-/auto/auto/85/notrim/8cb51d66b6b15b37a6f6cb2b3974e637.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplZ0pNNmRPNHE1S0NrX0xtRExmWWtXTkYxOGx3bU83RXU5V24yQTNsOGtFLVptajNkNExBSVE4MllGeldxRlc1eGVtNzBNVzA3OGpOeVhVeXN5Y2x0bmZEMzB2Z0VnSVRYa00vNTEyeDM4NA--/auto/auto/85/notrim/5d2c089c500828dc80fedded2472d45a.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplbWtWMDlHM2g1U09oZTdMUDdMV25uOXU1TVJqamV5UG9kLWwzVmZrcVJKb01XbnhkOU9RY1Fkb01sallxVk81eExpLWc4ZTE2SlhPblNOaDZYWWxzR0dkd1VJLWYxZnNaZy81MTJ4Mzg0/auto/auto/85/notrim/012dbf1010aa197828b79436b26d10d4.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplbWtWMDh1X21wU09oY2puSTdURGdsUmQ0Y0o1bnRiTjlKN3lqUnJqODBZOVkyR2ljZFhCZXc4NE5RdUdyQUs0bC0zbmhwR182c21hem5GbHN5ZDM0M19jemhQbW4xZ1NPYUR3MTVjTi81MTJ4Mzg0/auto/auto/85/notrim/132a34b8c7edd0d3a3dee9a304b46cff.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplbWtWMDg2amxvS09oY2o0T3J6WmdsUmQ2ZGQyajZlVXJkLWppd2ZzcjBCc1lHNmlJZGVVSkE4LU53NkVxVm50eUxydjE1LTR2NXZPbWlOcjczWjItei1EeUFkZFRuOGUvNTEyeDM4NA--/auto/auto/85/notrim/0f5fbd57495775101c825f79c2ea44f9.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRoanhzekplbWtWMDh5NW5ZNmZxUFA5SUxyRGhHcEkxOGw0amVIVnlvRDBtbE94NVJFOVl6XzFkOVhCSVZRM1lGLUJxMVBzbGJ2dDBNQzh2NXpMbW5kazdpY2s1aTdibmtHMGhSbFNMcnM0aUVndFJ3NC81MTJ4Mzg0/auto/auto/85/notrim/f8325ccc3319cb0a0f82dacb0cc79c8a.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90N0h4ZkRobndNekplbWtWMDgtamhJV1psUF8xSWJ6VWtsUmQ0Y0o1bnRiTjlKN3lqUnJzcWtNNFptcW1MSUxIZFFZNmFGdldfQUM5bE8yNzE4Uy11Y25Md0NSbnZTTjI0bm1KekVEbG4xZ1NPY0dTTENPMi81MTJ4Mzg0/auto/auto/85/notrim/5b8e9829a1e89f11b7b874326c71f209.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90NjIxRkFSMTdQTGZZUUpNNmRPNG00bVpxUHY5TkxQRnFXZFEtc0oweE9xVThZaWczMUxzX2tacE4yandkNEtVSkFZMllWclVyRk81a09mc2hKSzh1NW1iejN0cjYzWThwU0dLY2dGQlI3VS81MTJ4Mzg0/auto/auto/85/notrim/0a05db6363db6c6d386af8b5e59aaf25.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90NjIxRkFCejdQTGZZUUpPNWRHMG03LVltZmJfTm9UZG4yeFpfUHA5aV92RzhNS2oyQTNzX3hBNVlqejJkNGZFZGxkdFlGaUY4bEs2eGVxLWpNUzc2WnFmem5vMzdpa3F0MzZJZ1ZYcDFuUlBJTW1uLzUxMngzODQ-/auto/auto/85/notrim/abed79adcf69d05d4525b663b1bd05c4.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90NjIxRkFSMTdQTGZZUUpEXzlXN201YTBtdkx3T3E3Y3FXZFEtc0oweE96QW90LWppUWEzLWhCcVl6dnpMZFNWSmxRM05RdlItRmZzeEwzcWg1ZTd2TTZielNBMjZTZzhwU0dLSlVQZU50WS81MTJ4Mzg0/auto/auto/85/notrim/37ae83d7200b9f762ef320d5b7d79d16.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90NjIxRkFSMTdQTGZZUUpVNWN5emhyLUhudkQ4SjRUZGwzbFc3WXNqanV5V29OaWwwRlhqcUVabFptcnlKdEtRZWdRLVlnN1YtUUs1d3JfczFKZTA2c3lZelNOZ3BHQjhzaHlXWVhlTS81MTJ4Mzg0/auto/auto/85/notrim/604b4c2a3c1ffdff083c64984f3e6b62.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90NjIxRkFadDdQX0JkalZXNHRXNGs3LUtnT2ZMUDdMV25uOXU1TVJqamV5UHB0dWoyUXp0XzBKc1lEeW1KTkRBSVE4LU1BN1VfMWkzdy1icGhwTzF2NTZibUhCazd5TWtzV0dkd1VKcTROSTBsZy81MTJ4Mzg0/auto/auto/85/notrim/dc1c776765d65482e1449f1467c633c4.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90NjIxRkFSMTdQTGZZUUpLN2RLNGpZRzBtXzd6TzZfdW1tcEQ3OEFfanVxWm9vbWxqZ1cxcmhZOU1UejFkNGZHZWdJLU4xcUI4d1M1eE9pNjFKUzZ2Y2lmd0NacnV6NWl1eWg1ZnVJSFlBLzUxMngzODQ-/auto/auto/85/notrim/a12806a908c9c0910bdf8c92fb133752.webp",
    "https://cdn.csgoskins.gg/public/uih/products/aHR0cHM6Ly9zdGVhbWNvbW11bml0eS1hLmFrYW1haWhkLm5ldC9lY29ub215L2ltYWdlLy05YTgxZGxXTHdKMlVVR2NWc19uc1Z0emRPRWR0V3dLR1paTFFIVHhEWjdJNTZLVTBad3dvNE5VWDRvRkpaRUhMYlhINUFwZU80WW1saHhZUWtuQ1J2Q28wNERFVmx4a0tncG90NjIxRkFCejdQTGZZUUpLOWRpa2xiLUhudkQ4SjRUZGwzbFc3WXR3M0xERDhOV25qRkRoclVvNU5qXzNjSTZkSUE5dFoxelFyRkxxazdqdWdNSzA3NVdmem5vd3BHQjhzdU96NjJCQS81MTJ4Mzg0/auto/auto/85/notrim/eaaf2c98b00e7bf5285195e16297d345.webp",
    // Adicione outras URLs de imagens desejadas
  ];
  String selectedAvatarUrl = '';

  void _loadFormData(User user) {
    if (user != null) {
      _formDATA['id'] = user.id!;
      _formDATA['name'] = user.name;
      _formDATA['preco'] = user.preco;
      _formDATA['arma'] = user.arma;
      _formDATA['desgaste'] = user.desgaste;
      _formDATA['avatarUrl'] = user.avatarUrl;
    }
  }

  void _handleAvatarSelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SkinListScreen(skinUrls: avatarUrls),
      ),
    );

    // Atualize a variável selectedAvatarUrl com o resultado da seleção
    if (result != null && result is String) {
      setState(() {
        selectedAvatarUrl = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments != null && arguments is User) {
      final user = arguments as User;
      _loadFormData(user);
    } else {
      // Lógica para lidar com o caso em que os argumentos não são do tipo User ou são nulos
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
        backgroundColor: Colors.cyanAccent,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (_form.currentState?.validate() == true) {
                _form.currentState?.save();

                Provider.of<UsersProvider>(context, listen: false).put(
                  User(
                    id: _formDATA['id'],
                    name: _formDATA['name']!,
                    preco: _formDATA['preco']!,
                    arma: _formDATA['arma']!,
                    desgaste: _formDATA['desgaste']!,
                    avatarUrl: selectedAvatarUrl ?? '',
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formDATA['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o nome.';
                  }
                  return null;
                },
                onSaved: (value) => _formDATA['name'] = value!,
              ),
              TextFormField(
                initialValue: _formDATA['preco'],
                decoration: InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^\d+([\.]\d{0,2})?'))
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o preço.';
                  }
                  // Adicione validações adicionais, se necessário
                  return null;
                },
                onSaved: (value) => _formDATA['preco'] = value!,
              ),
              TextFormField(
                initialValue: _formDATA['arma'],
                decoration: InputDecoration(labelText: 'Arma'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite a arma.';
                  }
                  return null;
                },
                onSaved: (value) => _formDATA['arma'] = value!,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Selecione um avatar:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _handleAvatarSelection(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: selectedAvatarUrl.isNotEmpty
                          ? Colors.blue
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: selectedAvatarUrl.isNotEmpty
                      ? Image.network(selectedAvatarUrl)
                      : Icon(
                          Icons.image,
                          size: 60,
                          color: Colors.grey,
                        ),
                ),
              ),
              TextFormField(
                initialValue: _formDATA['desgaste'],
                decoration: InputDecoration(labelText: 'Desgaste'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o desgaste.';
                  }
                  return null;
                },
                onSaved: (value) => _formDATA['desgaste'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
