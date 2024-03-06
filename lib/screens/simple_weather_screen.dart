import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/data/models/detail/one_call_data.dart';
import 'package:weather_app/data/models/my_response.dart';
import 'package:weather_app/data/models/simple/weather_main_model.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/screens/daily_weather_screen.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/utils/extensions/my_extensions.dart';
import 'package:weather_app/utils/size/size_utils.dart';
import 'package:weather_app/utils/styles/app_text_style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../utils/images/app_images.dart';

class SimpleWeatherScreen extends StatefulWidget {
  const SimpleWeatherScreen({super.key});

  @override
  State<SimpleWeatherScreen> createState() => _SimpleWeatherScreenState();
}

class _SimpleWeatherScreenState extends State<SimpleWeatherScreen> {
  final WeatherRepository weatherRepository = WeatherRepository();
  final TextEditingController controller = TextEditingController();
  String city="Samarkand";

  bool isDark = false;
  _init () async {
    isDark=await AdaptiveTheme.getThemeMode()==AdaptiveThemeMode.light;
    setState(() {

    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<MyResponse>(
                  future: weatherRepository.getSimpleWeatherInfo(city) ?? weatherRepository.getSimpleWeatherInfo("Samarkand"),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    if (snapshot.hasData) {
                      print(snapshot);
                      WeatherMainModel weatherMainModel =
                      (snapshot.data as MyResponse).data as WeatherMainModel;
                      return
                        Column(
                        children: [
                          Container(
                            height: 600.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: isDark? AppColors.c_0648F1.withOpacity(0.5):AppColors.c_e76f51.withOpacity(0.5),
                                      offset: Offset(0, 20),
                                      blurRadius: 10,
                                      spreadRadius: -2),
                                  BoxShadow(
                                      color: isDark? AppColors.c_0648F1.withOpacity(0.5):AppColors.c_e76f51.withOpacity(0.5),
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
                                    colors: isDark? [
                                      AppColors.c_0648F1,
                                      AppColors.c_11ACFF,
                                      AppColors.c_00D1FF
                                    ]:[
                                      AppColors.c_e76f51,
                                      AppColors.c_FAFD74,
                                    ])),
                            child: Column(
                              children: [
                                20.getH(),
                                Row(

                                  children: [
                                    Switch(
                                        value: isDark ,
                                        onChanged: (v){
                                      if(v){
                                        AdaptiveTheme.of(context).setDark();
                                      }
                                      else{
                                        AdaptiveTheme.of(context).setLight();

                                      }
                                      isDark=v;
                                    }),
                                    Spacer(),
                                    Icon(
                                      Icons.location_on,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Text(
                                      weatherMainModel.name,
                                      style: Theme.of(context).textTheme.titleMedium),

                                    30.getW(),
                                  ],
                                ),
                                10.getH(),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                                  child: TextField(
                                    onSubmitted: (value){city=value; },
                                    controller: controller,
                                    decoration: InputDecoration(
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        fillColor: Colors.transparent,
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(7.0),
                                          child: Icon(Icons.search),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 14),
                                        hintText: "Enter city",
                                        hintStyle: TextStyle(
                                            color: Colors.blue, fontSize: 14),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.c_2352CB.withOpacity(.6)),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.c_2352CB.withOpacity(.6)),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.c_2352CB.withOpacity(.6)),
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                  ),
                                ),
                                10.getH(),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.symmetric(vertical: 16.h),
                                              backgroundColor: AppColors.c_2352CB.withOpacity(0.6),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                          onPressed: (){
                                             setState(() {

                                            });
                                          },child: Text("ok", style: Theme.of(context).textTheme.titleMedium),),
                                    ],
                                  ),
                                ),
                                Image.network(
                                  weatherMainModel.weatherModel[0].icon
                                      .getWeatherIconUrl(),
                                ),
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: 70.w,
                                      child: Text(
                                        (weatherMainModel.mainInMain.temp - 273.15)
                                            .round()
                                            .toString(),
                                        style: Theme.of(context).textTheme.displayLarge!
                                            .copyWith(fontSize: 80.h),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Text(
                                        "o",
                                        style: Theme.of(context).textTheme.headlineSmall!
                                            .copyWith(fontSize: 25.h),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  weatherMainModel.weatherModel[0].main,
                                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      fontSize: 48.w, color: AppColors.c_FAFD74),
                                ),
                                Text(
                                  weatherMainModel.dateTime.getParsedDate(),
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(fontSize: 20.w),
                                ),
                                12.getH(),
                                Divider(
                                  thickness: 2.h,
                                  endIndent: 30.w,
                                  color: Theme.of(context).primaryColor,
                                  indent: 30.w,
                                ),
                                10.getH(),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset(AppImages.windTwo,height: 25.h,
                                      color: Theme.of(context).primaryColor, ),
                                          Text(
                                            "${weatherMainModel.windInMain.speed.round()} km/h",
                                            style: Theme.of(context).textTheme.labelMedium),
                                          Text(
                                            "Wind",
                                            style: Theme.of(context).textTheme.labelMedium!
                                                .copyWith(
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
                                            "${weatherMainModel.mainInMain.humidity} %",
                                            style: Theme.of(context).textTheme.labelMedium,
                                          ),
                                          Text(
                                            "Humidity",
                                            style: Theme.of(context).textTheme.labelMedium!
                                                .copyWith(
                                                    fontSize: 12.w,
                                                    color: Theme.of(context).primaryColor.withOpacity(0.7)),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.visibility,
                                          color: Theme.of(context).primaryColor,),
                                          Text(
                                            "${weatherMainModel.visibility}",
                                            style: Theme.of(context).textTheme.labelMedium,
                                          ),
                                          Text(
                                            "Visibility",
                                            style: Theme.of(context).textTheme.labelMedium!
                                                .copyWith(
                                                    fontSize: 12.w,
                                                    color: Theme.of(context).primaryColor.withOpacity(0.7)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          25.getH(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Hourly",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DailyWeatherScreen(isDark: isDark,)));
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "7 days",
                                          style: Theme.of(context).textTheme.titleSmall,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,

                                            color: Theme.of(context).primaryColor,
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          10.getH(),

                          // Text(weatherMainModel.name)
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              FutureBuilder<MyResponse>(
                  future: weatherRepository.getComplexWeatherInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    if (snapshot.hasData) {
                      OneCallData oneCallData =
                          (snapshot.data as MyResponse).data as OneCallData;
                      return
                        SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                                oneCallData.hourly.length,
                                (index){
                            var hourData = oneCallData.hourly[index];
                            return

                                    Center(
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.symmetric(horizontal: 4),
                                        height: 120.h,
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30.w),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: isDark? [
                                                  AppColors.c_0648F1,
                                                  AppColors.c_11ACFF,
                                                  AppColors.c_00D1FF
                                                ]:[
                                                  AppColors.c_e76f51,
                                                  AppColors.c_FAFD74,
                                                ])),
                                        child: Column(children: [
                                          Text(hourData.dt.getParsedHour(), style: Theme.of(context).textTheme.titleMedium,),
                                          Image.network(
                                            hourData.weather[0].icon
                                                .getWeatherIconUrl(),height: 45,
                                          ),
                                          Text(
                                            "${hourData.temp.round()} C", style: Theme.of(context).textTheme.titleMedium,
                                          ),
                                        ],

                                        ),
                                      ),
                                    );})
                          ],
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
