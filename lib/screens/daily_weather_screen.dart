import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/data/models/detail/one_call_data.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/utils/extensions/my_extensions.dart';
import 'package:weather_app/utils/images/app_images.dart';
import 'package:weather_app/utils/size/size_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:weather_app/utils/styles/app_text_style.dart';
import '../data/models/my_response.dart';
import '../data/repository/weather_repository.dart';

class DailyWeatherScreen extends StatefulWidget {
  const DailyWeatherScreen({super.key, required this.isDark});

  final bool isDark;
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
                                    color: widget.isDark? AppColors.c_0648F1.withOpacity(0.5):AppColors.c_e76f51.withOpacity(0.5),
                                    offset: Offset(0, 20),
                                    blurRadius: 10,
                                    spreadRadius: -2),
                                BoxShadow(
                                    color: widget.isDark? AppColors.c_0648F1.withOpacity(0.5):AppColors.c_e76f51.withOpacity(0.5),
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
                                  colors: widget.isDark? [
                                    AppColors.c_0648F1,
                                    AppColors.c_11ACFF,
                                    AppColors.c_00D1FF
                                  ]:[
                                    AppColors.c_e76f51,
                                    AppColors.c_FAFD74,
                                  ])),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              25.getH(),
                              IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,
                                color: Theme.of(context).primaryColor,)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Icon(Icons.calendar_month,
                                  color: Theme.of(context).primaryColor,),
                                Text("7 days", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),)
                              ],),
                              Container(
                                width: double.infinity,
                                height: 240.h,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top:0,
                                        left: 145.w,
                                        child: Text("Tomorrow", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18.w),)),
                                    Positioned(
                                      left: 40.w,
                                      top: 30.h,
                                      child: Row(
                                        children: [
                                          Image.network(oneCallData.daily[0].weather[0].icon.getWeatherIconUrl(),),
                                          RichText(
                                            text: TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(text: oneCallData.daily[0].dailyTemp.max.round().toString(), style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 60.w)),
                                                TextSpan(text: "/${oneCallData.daily[0].dailyTemp.min.round().toString()}", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 40.w))
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
                                        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20.h),
                                      ),
                                    ),
                                    Positioned(
                                      left: 135.w,
                                      top: 120.h,
                                      child: Text(oneCallData.daily[0].weather[0].main, style:Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18.w),)


                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 140,
                                      child: Column(children: [
                                        Divider(
                                          thickness: 2.h,
                                          endIndent: 30.w,
                                          color: Theme.of(context).primaryColor,
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
                                                  Image.asset(AppImages.windTwo, height: 25.h,
                                                    color: Theme.of(context).primaryColor,),
                                                  Text(
                                                    "${oneCallData.daily[0].windSpeed.round()} km/h",
                                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 12.w),
                                                  ),
                                                  Text(
                                                    "Wind",
                                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                                        fontSize: 12.w,
                                                        color: Theme.of(context).primaryColor.withOpacity(0.7)),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Image.asset(AppImages.humidityTwo, height: 25.h,
                                                    color: Theme.of(context).primaryColor,),
                                                  Text(
                                                    "${oneCallData.daily[0].humidity.round()} %",
                                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 12.w),
                                                  ),
                                                  Text(
                                                    "Humidity",
                                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                                        fontSize: 12.w,
                                                        color: Theme.of(context).primaryColor.withOpacity(0.7)),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Icon(Icons.cloud,
                                                    color: Theme.of(context).primaryColor,),
                                                  Text(
                                                    "${oneCallData.daily[0].clouds}",
                                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 12.w),
                                                  ),
                                                  Text(
                                                    "Clouds",
                                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                                        fontSize: 12.w,
                                                        color: Theme.of(context).primaryColor.withOpacity(0.7)),
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
                                      Text(daily.dt.getParsedOnlyDay(), style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18.w),),
                                      Row(
                                        children: [
                                          Image.network(
                                            daily.weather[0].icon.getWeatherIconUrl(),
                                          ),
                                          Text(oneCallData.daily[index].weather[0].main, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18.w),)
                                        ],
                                      ),
                                      Text(
                                        "${daily.dailyTemp.day.round() } C",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24.w),
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
