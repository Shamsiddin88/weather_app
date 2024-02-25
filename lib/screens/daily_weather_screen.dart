import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/data/models/detail/one_call_data.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/utils/extensions/my_extensions.dart';
import 'package:weather_app/utils/images/app_images.dart';
import 'package:weather_app/utils/size/size_utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/utils/styles/app_text_style.dart';
import '../data/models/my_response.dart';
import '../data/repository/weather_repository.dart';

class DailyWeatherScreen extends StatefulWidget {
  const DailyWeatherScreen({super.key});

  @override
  State<DailyWeatherScreen> createState() => _DailyWeatherScreenState();
}

class _DailyWeatherScreenState extends State<DailyWeatherScreen> {
  final WeatherRepository weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        backgroundColor: AppColors.c_0C0926,
        body: Column(
          children: [
            FutureBuilder<MyResponse>(
                future: weatherRepository.getComplexWeatherInfo(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (snapshot.hasData) {
                    OneCallData oneCallData =
                    (snapshot.data as MyResponse).data as OneCallData;
                    return Column(
                      children: [
                        Container(
                          height: 350.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.c_0648F1.withOpacity(0.5),
                                    offset: Offset(0, 20),
                                    blurRadius: 10,
                                    spreadRadius: -2),
                                BoxShadow(
                                    color: AppColors.c_0648F1.withOpacity(0.5),
                                    offset: Offset(0, 25),
                                    blurRadius: 3,
                                    spreadRadius: -15),
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.w),
                                bottomRight: Radius.circular(15.w),
                              ),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    AppColors.c_0648F1,
                                    AppColors.c_11ACFF,
                                    AppColors.c_00D1FF
                                  ])),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              25.getH(),
                              IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: AppColors.white,)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Icon(Icons.calendar_month, color: AppColors.white,),
                                Text("7 days", style: AppTextStyle.interBold.copyWith(fontSize: 22.w),)
                              ],),
                              Container(
                                width: double.infinity,
                                height: 240.h,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top:0,
                                        left: 145.w,
                                        child: Text("Tomorrow", style: AppTextStyle.interBold.copyWith(fontSize: 18.w),)),
                                    Positioned(
                                      left: 40.w,
                                      top: 30.h,
                                      child: Row(
                                        children: [
                                          Image.network(oneCallData.daily[0].weather[0].icon.getWeatherIconUrl(),),
                                          RichText(
                                            text: TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(text: oneCallData.daily[0].dailyTemp.max.round().toString(), style: AppTextStyle.interMedium.copyWith(fontSize: 60.w)),
                                                TextSpan(text: "/${oneCallData.daily[0].dailyTemp.min.round().toString()}", style: AppTextStyle.interMedium.copyWith(fontSize: 40.w))
                                              ],
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 50.h,
                                      right: 150.w,
                                      child: Text(
                                        "o",
                                        style: AppTextStyle.interMedium
                                            .copyWith(fontSize: 20.h),
                                      ),
                                    ),
                                    Positioned(
                                      left: 135.w,
                                      top: 120.h,
                                      child: Text(oneCallData.daily[0].weather[0].main, style: AppTextStyle.interBold.copyWith(fontSize: 18.w),)


                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 140,
                                      child: Column(children: [
                                        Divider(
                                          thickness: 2.h,
                                          endIndent: 30.w,
                                          color: AppColors.white,
                                          indent: 30.w,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  SvgPicture.asset(AppImages.wind),
                                                  Text(
                                                    "${oneCallData.daily[0].windSpeed.round()} km/h",
                                                    style: AppTextStyle.interSemiBold
                                                        .copyWith(fontSize: 12.w),
                                                  ),
                                                  Text(
                                                    "Wind",
                                                    style: AppTextStyle.interSemiBold
                                                        .copyWith(
                                                        fontSize: 12.w,
                                                        color: AppColors.white
                                                            .withOpacity(0.7)),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  SvgPicture.asset(AppImages.humidity),
                                                  Text(
                                                    "${oneCallData.daily[0].humidity.round()} %",
                                                    style: AppTextStyle.interSemiBold
                                                        .copyWith(fontSize: 12.w),
                                                  ),
                                                  Text(
                                                    "Humidity",
                                                    style: AppTextStyle.interSemiBold
                                                        .copyWith(
                                                        fontSize: 12.w,
                                                        color: AppColors.white
                                                            .withOpacity(0.7)),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  SvgPicture.asset(AppImages.humidity),
                                                  Text(
                                                    "${oneCallData.daily[0].clouds}",
                                                    style: AppTextStyle.interSemiBold
                                                        .copyWith(fontSize: 12.w),
                                                  ),
                                                  Text(
                                                    "Clouds",
                                                    style: AppTextStyle.interSemiBold
                                                        .copyWith(
                                                        fontSize: 12.w,
                                                        color: AppColors.white
                                                            .withOpacity(0.7)),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],),
                                    )






                                  ],),
                              ),

                            ],
                          ),

                        ),
                        SizedBox(
                          height:430.h,
                          child: ListView(

                            children: [
                              ...List.generate(oneCallData.daily.length, (index) {
                                var daily = oneCallData.daily[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(daily.dt.getParsedOnlyDay(), style: AppTextStyle.interSemiBold.copyWith(fontSize: 18.w),),
                                      Row(
                                        children: [
                                          Image.network(
                                            daily.weather[0].icon.getWeatherIconUrl(),
                                          ),
                                          Text(oneCallData.daily[index].weather[0].main, style: AppTextStyle.interSemiBold.copyWith(fontSize: 18.w),)
                                        ],
                                      ),
                                      Text(
                                        "${daily.dailyTemp.day.round() } C",style: AppTextStyle.interSemiBold.copyWith(fontSize: 24.w),
                                      ),
                                    ],
                                  ),
                                );
                              })
                            ],
                          ),
                        ),


                        // Text(weatherMainModel.name)
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),

          ],
        ),
      ),
    );
  }
}
