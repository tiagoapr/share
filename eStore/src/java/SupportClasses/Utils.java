/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SupportClasses;

import DatabaseClasses.UserInfo;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

public class Utils {

   static public String convertToMd5(final String plainText) throws UnsupportedEncodingException {
      StringBuilder sb = new StringBuilder();
      try {
         final java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
         final byte[] array;
         array = md.digest(plainText.getBytes("UTF-8"));
         for (int i = 0; i < array.length; ++i) {
            sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
         }
         return sb.toString();
      } catch (final java.security.NoSuchAlgorithmException e) {
      }
      return sb.toString();
   }

   static public String transformToSimpleDateFormat(Date data) throws ParseException {
      String dateStr;
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
      dateStr = format.format(data);
      return dateStr;
   }

   static public String transformToSimpleDateTimeFormat(Date data) throws ParseException {
      String dateStr;
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      dateStr = format.format(data);
      return dateStr;
   }

   static public String parseStringSpecialChars(String original){
      String parsed = original.replace("<", " ");
      parsed = parsed.replace(">", " ");
      parsed = parsed.replace("\"", " ");
      parsed = parsed.replace("/", " ");
      parsed = parsed.replace(";", " ");
      parsed = parsed.replace("=", " ");
      parsed = parsed.replace("'", " ");
      parsed = parsed.replace("toto", " ");
      parsed = parsed.replace("titi", " ");            
      return parsed;
   }
   
   static public Boolean userIsLogged(HttpSession session) {
      if (   session.getAttribute("sessionUserObject") instanceof UserInfo 
          && session.getAttribute("sessionUserId") != null) {
         return true;
      }
      return false;
   }

   static public Boolean userIsLoggedAsAdmin(HttpSession session) {
      if (   session.getAttribute("sessionUserObject") instanceof UserInfo 
          && session.getAttribute("sessionNivelAcesso").toString().equals("1")) {
         return true;
      }
      return false;
   }
   

   static public void sessionLogout(HttpSession session) {
      session.removeAttribute("sessionUserObject");
      session.removeAttribute("sessionUserEmail");
      session.removeAttribute("sessionUserId");
      session.removeAttribute("sessionNivelAcesso");
      session.removeAttribute("sessionUrlPathBack");
      session.removeAttribute("sessionUrlPathBackVoltar");
      session.removeAttribute("sessionCarrinhoFull");      
      session.removeAttribute("sessionArtigoId");      
      session.invalidate();
   }

   static public Map decodeUrl(String httpQueryString) throws UnsupportedEncodingException {
      Map<String, String> queryPairs = new LinkedHashMap<String, String>();

      String[] pairs = httpQueryString.split("&");
      for (String pair : pairs) {
         int idx = pair.indexOf("=");
         queryPairs.put(URLDecoder.decode(pair.substring(0, idx), "UTF-8"), URLDecoder.decode(pair.substring(idx + 1), "UTF-8"));
      }
      return queryPairs;
   }

   static public List getUrlParameters(String httpQueryString) throws UnsupportedEncodingException {
      if (httpQueryString == null) {
         return null;
      }
      List<String> urlParams = new ArrayList<String>();
      Map<String, String> queryPairsDecoded = decodeUrl(httpQueryString);

      for (Map.Entry<String, String> entrada : queryPairsDecoded.entrySet()) {
         urlParams.add(entrada.getKey());
      }
      return urlParams;
   }

   static public String getPathBack(String requestURI, String queryString) {
      String pathBack = "";
      if (queryString == null || queryString.isEmpty()) {
         pathBack = requestURI;
         return pathBack;
      }
      pathBack = requestURI + "?" + queryString;
      return pathBack;
   }

   static public void setPathBack(HttpSession session, String requestURI, String queryString) {
      String pathBack = "";
      if (queryString == null || queryString.isEmpty()) {
         pathBack = requestURI;
      } else {
         pathBack = requestURI + "?" + queryString;
      }
      session.setAttribute("sessionUrlPathBack", pathBack);
   }
   
   static public void setPathBackVoltar(HttpSession session, String requestURI, String queryString) {
      String pathBack = "";
      if (queryString == null || queryString.isEmpty()) {
         pathBack = requestURI;
      } else {
         pathBack = requestURI + "?" + queryString;
      }
      session.setAttribute("sessionUrlPathBackVoltar", pathBack);
   }
   
   static public float round(float d, int decimalPlace) {
      BigDecimal bd = new BigDecimal(Float.toString(d));
      bd = bd.setScale(decimalPlace, BigDecimal.ROUND_HALF_UP);
      return bd.floatValue();
   }

   static public float promotionalPrice(Object preco, Object promocao) {

      float valorPreco = ((BigDecimal) preco).floatValue();

      int valorPromocao = (Integer) promocao;
      float desconto = ((100 - (float) valorPromocao) / 100);

      float precoFinal = valorPreco * desconto;

      return round(precoFinal, 2);
   }

   static public float promotionalPriceB(float preco, int promocao) {

      float valorPreco = preco;
      int valorPromocao = promocao;

      float desconto = ((100 - (float) valorPromocao) / 100);

      float precoFinal = valorPreco * desconto;

      return round(precoFinal, 2);
   }
}
