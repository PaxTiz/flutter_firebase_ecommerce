import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/components/categories/category_row.dart';
import 'package:ecommerce_app/services/categories_service.dart';

class CategoryList extends StatefulWidget {
    createState() => _CategoryList();
}

class _CategoryList extends State<CategoryList> {

    @override
    Widget build(BuildContext context) {
        return StreamBuilder<List<Category>>(
            initialData: [],
            stream: CategoriesService().getAll(),
            builder: (context, snapshot) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text("Categories", style: Theme.of(context).textTheme.headline1,),
                    SizedBox(height: 16,),
                    if(snapshot.connectionState == ConnectionState.waiting) CircularProgressIndicator()
                    else if(snapshot.data.length == 0) Text("There is no data...")
                    else GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 3
                        ),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) => CategoryRow(category: snapshot.data[index]),
                    )
                ],
            ),
        );
    }

}
