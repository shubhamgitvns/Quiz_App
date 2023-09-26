import 'package:flutter/material.dart';
import 'package:quiz_app/quizapp.dart';

class QuizOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF09203e),
                Color(0xFF537895),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Quiz App",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                      color: Colors.amber),
                ),
              ),
              Row(
                children: const [
                  SizedBox(
                    height: 100,
                  ),
                  Expanded(
                      child: Center(
                    child: Text(
                      "Select Yor Choice",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white),
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 10,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.transparent,
                              offset: Offset(-2.0, -2.0),
                              blurRadius: 10,
                              spreadRadius: 1.0,
                            ),
                          ]),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/second');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Image.network(
                            "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAMAAACahl6sAAAAwFBMVEX///9FaIY2cKH/1E02dqv/yz02a5j/yTg2bZw2d63/0EY2cqT/11L2+Ps2bp7/1VDt8fT/zkJBY4CDm66TqLne5OqQsMudsL//6KZdepL//fdAd6f0y1g0caXvw0V0jaP/+uz+4ZC2w8+qusjvwUFVh7Cmw9r/8cb/2Wv/1VpNa4a/ytXW3uVUcoxBbpeeutHL3ev71XD/5Z7/7bh8lKmBo792n8FQg6/82Xu5zuH/9d1slbvvvTP84YXO199ngpr8KMQ2AAAEFklEQVR4nO2be3eaMByGE9fpHKUFK7O3Faq9rOrabuu6e/f9v9VIAsglOGA7/SWc9/lDCILnfcwVjjIGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAsBU3hjrDv+E5g73BYC/mleTWo07UhbuB4wwEG5HhcHhJHas1jqAqMhxSB2tLrUhAnawde7HGSbB2lEdexLIqEfUhtneVGhl+ps7WitjjUe5URYZWjcWxyBexdXsgUte07BNxgrVm1LJRRDv8QoSG3oi8KWCxSJFX1omsLy9PNJRr5FQRUcet434nwXG295GXktFoFFFH1vI4HrcVGR1Th9ZwNdaKVFa/BZGv1Kk1jLuIjKhTV9npJnJOnbvCuJuIcVXyrS8iV3UilVHrlhVEIurkJcaNRe5ZlBf5RJ28RHMRxi7yIh+ok5doLOKyyM+LmNZJmoq47Nwvinykjl6kVqQ4anmM+SURw2YSjcg33XmRb5nIQHfS8Xfft0xEPHU/29/ff6F4rfB960QY293d7YHIFYsaixxSRy8iNTIRWSENRaiTlyiI/GCHjUVMm9mvciKOJyukmUhEnbyEmxN5y1qIUAev0BuRnW4i19S5K3jdRKhja9jpImLY0ldx317kJ3VmPSetRSLqyDV4j2oBXxY5q3ARc0odtwlFEeo0/0BR5LAAdbZWbOsjJj6BrwUipqETeXccnfdB5EYcf9cDEfmQN4IIEb+qInJavPF98xbuW9F09pvoWnQR6mRtqRt+rWpYkmudyAV1qi4cVkXOqDN1JDo9y4mc2teqgNk8HVEn+D94nFNH+D/0ScTKP8BsmE7kxnoRl/dPxIbfldaTEyFO0gjP27Sb4he/TcQLiv9Qyn8KBXMumcsC58nEFycPxItgmYhMROEpuey3eq/0KZPnTp9xwPl7VwaVJkURd/HA+WIxZ0ppOV+FnK/E28FEZj5KTGLFRbyZxR9GYsFE8qXcTjlfs7KIaFo8LapvOzlhok6PizN11oIlh1fPmT4H5wfpDmc6kayPrNKdmUz+kBYPNrpiZ/qM4fNkIg9/E8kuiEXCXJHnRJgBIoGc8hqKbHr5kXEinuyorUVCOSiYKBJmxUYicpAwSiRIRH6rYgsRw5rWQo5L1aa1TIvZBTM5zCbF0DiRiVwWZnPz9hqZGTxqpfNIEmm7CMumcKlvhohqSytVF5N0MTWrzOzZBUpEladycDBDRA5UYTpVxyah6z6Iw4F6Xw5jZRGxRotfl6rCzBA5mMl1a7pGOpKlmZuIxFmz1W9ygRRhT/I8FdsQEe3xTbZ6PJNuGutELLkl3NB7kfc9EZmn977WoBFx11NuW32IeaMiIu5qLauOGG9dEQnDld1PFQEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAr/gDIyJ56DT2nIsAAAAASUVORK5CYII=",
                            height: 100,
                            width: 100),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 10,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Colors.transparent,
                            offset: Offset(-2.0, -2.0),
                            blurRadius: 10,
                            spreadRadius: 1.0,
                          ),
                        ]),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Third');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Image.network(
                          'data:image/png;base64,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',
                          height: 100,
                          width: 100),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//<<<<<<<<<<<<<<<<python Quiz App>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>./

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Python Quiz"),
          centerTitle: true,
          backgroundColor: Colors.amber,
          shadowColor: Colors.grey,

        ),
        body: const QuizApp(),
      ),
    ));
  }
}

//*******************C Quiz App**********************************

class QuizThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("C.Quiz"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: const CQuizApp(),
      ),
    ));
  }
}
