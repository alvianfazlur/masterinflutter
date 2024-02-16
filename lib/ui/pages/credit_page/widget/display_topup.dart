import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_controller.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/button_nominal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DisplayTopUp extends StatelessWidget {
  const DisplayTopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CreditController controller) => Visibility(
        visible: controller.isVisibleMenu,
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: whiteColor, border: Border.all(color: blackColor.withOpacity(0.1))),
          child: Column(
            children: [
              Text("Nominal", style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 18),),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              ButtonNominal(nominal: 100000),
                              ButtonNominal(nominal: 200000),
                              ButtonNominal(nominal: 500000),
                              ButtonNominal(nominal: 1000000),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text("Nominal Dipilih: ", style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
                    SizedBox(height: 6,),
                    Text(
                      controller.selectedNominal.isEmpty?
                      "Rp.0" :
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(controller.selectedNominal[0]),style: blackTextStyle.copyWith(fontWeight: extraBold, fontSize: 16),),
                    Visibility(
                      visible: controller.selectedNominal.isNotEmpty,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 100,
                          height: 40,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              controller.topUp(id: controller.user!.id, balance: controller.selectedNominal[0]);
                            },
                            child: Text(
                              'Bayar',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: medium),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
