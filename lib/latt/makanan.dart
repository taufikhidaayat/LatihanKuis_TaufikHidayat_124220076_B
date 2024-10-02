import 'package:flutter/material.dart';
import 'dummy_menu .dart';
import 'DetailPage.dart';

class makananPage extends StatelessWidget {
  final String username;
  final String? nickname;

  makananPage({Key? key, required this.username, this.nickname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Menu"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: const Color.fromARGB(255, 205, 29, 161),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "WEHH BRO, $username!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (nickname != null) SizedBox(height: 10),
                Text(
                  "ENAK ENAK KAN MENUNYA $nickname",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: foodMenuList.length,
                itemBuilder: (context, index) {
                  final menu = foodMenuList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(menu: menu),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(15)),
                            child: Image.asset(
                              menu.imageAsset,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  menu.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  menu.category,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  menu.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  menu.price,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          _showLogoutConfirmation(context);
        },
        child: Icon(Icons.logout),
        tooltip: 'Logout',
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Konfirmasi Logout',
            style: TextStyle(color: Colors.teal),
          ),
          content: Text('Apakah Anda yakin ingin logout?'),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Batal',
                style: TextStyle(color: Colors.teal),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
