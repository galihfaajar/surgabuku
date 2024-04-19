import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import 'package:get/get.dart';
import 'package:surgabuku/app/components/myBookSearch.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0xFFF2F2F2)),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 15,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.arrow_back),
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 16,
                      child: TextFormField(
                        validator: ValidationBuilder().minLength(4).build(),
                        controller: controller.search,
                        autocorrect: false,
                        autofocus: false,
                        enableInteractiveSelection: false,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          hintText: "Buku apa yang ingin anda cari?",
                          filled: true,
                          // border: OutlineInputBorder(),
                          fillColor: const Color(0xFFD9D9D9),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 255, 17, 0))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 255, 17, 0))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200),
                              borderSide:
                                  BorderSide(color: Colors.blue.shade400)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(200),
                            borderSide: const BorderSide(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.84,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: MyBookSearch(
                        state: state!,
                        controller: controller,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
