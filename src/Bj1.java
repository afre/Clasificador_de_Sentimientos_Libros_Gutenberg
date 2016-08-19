/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.util.logging.Level;
import java.util.logging.Logger;
import weka.classifiers.Evaluation;
import weka.classifiers.functions.MultilayerPerceptron;
import weka.core.Instances;
import weka.core.converters.ConverterUtils;

/**
 *
 * @author USRDES
 */
public class Bj1
{
  public void perceptron_multicapa() 
  {
      
          try {
              // Llamar al archivo .arff
              ConverterUtils.DataSource converU = new ConverterUtils.DataSource("./arff/circuito.arff");
              Instances instancias = converU.getDataSet();
               //Para evitar desborde de datos
              instancias.setClassIndex(instancias.numAttributes()-1);
              //Construir la red  MUlticapa
              MultilayerPerceptron red = new MultilayerPerceptron();
              red.buildClassifier(instancias);
              //evaluar modelo
              Evaluation ev = new Evaluation(instancias);
              
              ev.evaluateModel(red, instancias);
              System.out.println(instancias);
              System.out.println(ev.toSummaryString("Resultado ", true));
              System.out.println(ev.toMatrixString("Matriz de confución"));
              
              //salida deseada
              System.out.println("Salida Deseada");
              Instances inst2 = new Instances(instancias);
              ev.evaluateModel(red, inst2);
              for (int i=0; i< ev.evaluateModel(red, inst2).length;i++) 
              {
                  System.out.println(ev.evaluateModel(red, inst2)[i]);
                  
              }
          } 
          
          catch (Exception ex) {
              Logger.getLogger(Bj1.class.getName()).log(Level.SEVERE, null, ex);
          }
      
      
  }
}
