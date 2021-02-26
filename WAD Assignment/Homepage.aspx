<%@ Page Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="WAD_Assignment.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server"> 


 <style>
        body {
  font-family: Helvetica, sans-serif;
  text-align: center;
}

#slideshow {
  overflow: hidden;
  height: 510px;
  width: 679px; 
  margin: 4px auto;
}

.slide-wrapper {
  width: 2912px;
  -webkit-animation: slide 18s ease infinite;
}

.slide {
  float: left;
  height: 510px;
  width: 679px;
}

.slide:nth-child(1) {
  background-image:url(/arts/home1.jpg)
}

.slide:nth-child(2) {
  background-image:url(/arts/home2.jpg)
}

.slide:nth-child(3) {
  background-image:url(/arts/home3.jpg)
}



.slide-number {
  color: #000;
  text-align: center;
  font-size: 10em;
}

@-webkit-keyframes slide {
  20% {margin-left: 0px;}
  30% {margin-left: -728px;}
  50% {margin-left: -728px;}
  60% {margin-left: -1456px;}
  70% {margin-left: -1456px;}
  80% {margin-left: -2184px;}
  90% {margin-left: -2184px;}
}

     .auto-style4 {
         width: 385px;
     }
     .auto-style5 {
         width: 417px;
     }
     .auto-style6 {
         width: 365px;
     }

    </style>


    <div id="slideshow">
  <div class="slide-wrapper">
    <div class="slide"><h1 class="slide-number"></h1>
        <p class="slide-number"></p>
        <p class="slide-number"></p></div>
    <div class="slide"><h1 class="slide-number"></h1></div>
    <div class="slide"><h1 class="slide-number"></h1></div>

      <br />
      <br />

  </div>
</div>

    <div>
        Why Buy Art From Mochi?</div>

<h1>
    <table style="width:100%;">
        <tr>
            <td class="auto-style4" style="font-size:14px;">Peace of Mind</td>
            <td class="auto-style5" style="font-size:14px;">Quality Artwork</td>
            <td class="auto-style6" style="font-size:14px;">Own a True Original</td>
            <td style="font-size:14px;">Personal Service</td>
        </tr>
        <tr>
            <td class="auto-style4"><span style="color: rgb(102, 102, 102); font-family: &quot;Hind Vadodara&quot;, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 300; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Free returns within 14 days and our best price guarantee. Smooth delivery to your door, trackable and insured. Join the growing number of happy Mochi collectors around the world!</span></td>
            <td class="auto-style5"><span style="color: rgb(102, 102, 102); font-family: &quot;Hind Vadodara&quot;, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 300; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Mochi’s collection contains the best emerging and established artists, hand-picked by our curators, just for you. Official certificate of authenticity, signed by the artist, with every purchase.</span></td>
            <td class="auto-style6"><span style="color: rgb(102, 102, 102); font-family: &quot;Hind Vadodara&quot;, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 300; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Express yourself with a unique piece created by the hands of one of our talented artists. Transform your home with the impact of one-of-a-kind original art.</span></td>
            <td><span style="color: rgb(102, 102, 102); font-family: &quot;Hind Vadodara&quot;, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 300; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Your personal art concierge is here to help. Mochi’s friendly and transparent experience is a refreshing way to buy art. We’re only an e-mail or phone call away.</span></td>
        </tr>
    </table>
    </h1>
 
</asp:Content>
