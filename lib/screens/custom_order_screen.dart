import 'package:flutter/material.dart';
import 'my_orders_screen.dart';

class CustomOrderScreen extends StatefulWidget {
  final String productName;

  const CustomOrderScreen({
    super.key,
    required this.productName,
  });

  @override
  State<CustomOrderScreen> createState() => _CustomOrderScreenState();
}

class _CustomOrderScreenState extends State<CustomOrderScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController chestController = TextEditingController();
  final TextEditingController waistController = TextEditingController();
  final TextEditingController hipsController = TextEditingController();
  final TextEditingController shoulderController = TextEditingController();
  final TextEditingController sleeveController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String fabric = "Cotton";
  String delivery = "Pickup";

  @override
void dispose() {
  fullNameController.dispose();
  phoneController.dispose();
  chestController.dispose();
  waistController.dispose();
  hipsController.dispose();
  shoulderController.dispose();
  sleeveController.dispose();
  lengthController.dispose();
  notesController.dispose();
  addressController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Custom Order"),
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PRODUCT NAME
              Text(
                widget.productName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              sectionTitle("Customer Details"),
              inputField("Full Name", fullNameController),
              inputField("Phone Number", phoneController),

              const SizedBox(height: 20),

              sectionTitle("Body Measurements (cm)"),
              inputField("Chest / Bust", chestController),
              inputField("Waist", waistController),
              inputField("Hips", hipsController),
              inputField("Shoulder Width", shoulderController),
              inputField("Sleeve Length", sleeveController),
              inputField("Dress / Trouser Length", lengthController),

              const SizedBox(height: 20),

              sectionTitle("Design Options"),
              dropdownField(
                "Fabric",
                fabric,
                ["Cotton", "Silk", "Ankara", "Lace"],
                (value) => setState(() => fabric = value!),
              ),

              inputField("Special Instructions", notesController,
                  maxLines: 3, required: false),

              const SizedBox(height: 20),

              sectionTitle("Delivery"),
              dropdownField(
                "Delivery Type",
                delivery,
                ["Pickup", "Home Delivery"],
                (value) => setState(() => delivery = value!),
              ),

              if (delivery == "Home Delivery")
                inputField("Delivery Address", addressController),

              const SizedBox(height: 35),

              // SUBMIT BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Submit Order",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

void _submitOrder() {
  if (_formKey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Order placed successfully"),
        action: SnackBarAction(
          label: "My Orders",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MyOrdersScreen()),
            );
          },
        ),
      ),
    );
  }
}

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFFE91E63),
        ),
      ),
    );
  }

  Widget inputField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    bool required = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: TextInputType.text,
        validator: required
            ? (value) =>
                value!.isEmpty ? "This field is required" : null
            : null,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: const Color(0xFFFFF0F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget dropdownField(
    String label,
    String value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: const Color(0xFFFFF0F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        items: items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ),
            )
            .toList(),
      ),
    );
  }
}
