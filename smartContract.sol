//SPDX-License-Identifier: GPL-3.0;

pragma solidity ^0.8.7;

contract LandRegistry{

    struct landregistry
    {
    address Owner;
    string Area;
    string City;
    string State;
    uint LandPrice; 
    uint PropertyId;
    }

     struct BuyerDetails{

        string Name;
        uint Age;
        string City;
        uint Cnic;
        string Email;

    }

    struct SellerDetails{
        uint id;
        string Name;
        uint Age;
        string City;
        uint Cnic;
        string Email;
        
      
    }

    struct LandInspector{
        address id;
        string name;
        uint age;
        string designation;
    }


    address public InspectorOnly;
   

         //_________________________STRUCT ENDS_____________________________// 

     //____________________________CONSTRUCTOR______________________________//

   constructor ()  {
       InspectorOnly = msg.sender;
   }

   //_______________________________CONSTRUCTOR ENDS___________________________//


  ///__________________Modifier for only Inspector______________________________//
  
modifier LimitedRights{
    require(msg.sender == InspectorOnly);
    _;
}

///_________________________MODIFIER ENDS_______________________________________///
   
  

 
///______________________________Add land inspector______________________________________///

   function Landinspector(address _addr,string memory _name,uint _age,
   string memory _designation) public  LimitedRights{
       landInspector[msg.sender] = LandInspector(_addr,_name,_age,_designation);
   }
   

        ///_______________________MAPPING START___________________________________///
  
    mapping(uint => landregistry) public land;
    mapping(address=> BuyerDetails) public buyer;
    mapping(address => SellerDetails) public seller;
    mapping(address => LandInspector) public landInspector;
    mapping (address => bool) public VerifiedSeller;
    mapping(address => bool) public VerifiedBuyer;
    mapping (uint => bool) public VerifyLand;
    // mapping (uint => address) public GetLandOwner;

   /// ______________________________MAPPING ENDS___________________________________///

     
    ///_________________________Createe Function to Register Seller______________________///

    function registerSeller(uint _id,
    string memory _Name,
    uint _Age,
    string memory _City,
    uint _Cnic,
    string memory _Email) public {
        seller[msg.sender] = SellerDetails (_id,
        _Name,
        _Age,
        _City,
        _Cnic,
        _Email);
        VerifiedSeller[msg.sender] = false;
    }
///__________________________________ENDS______________________________________________///

  
    ///_____________________________FUNCTION TO VERIFY SELLER_________________________///
      function VerifiySeller(address _addr) public LimitedRights{
       VerifiedSeller[_addr] = true;
           }
 
  ///_________________________________ENDS___________________________________________///


///_______________________________function to reject seller___________________________///

           function RejectSeller(address _addr) public LimitedRights {
          VerifiedSeller[_addr] = false;
           }



    ///_______________________________________ENDS_______________________________________///



      ///_________________________________land Register function_________________________///


      function registerLand(uint _LandId, address, string memory _Area, string memory _City, string memory _State, uint _LandPrice, uint _PropertyId) public {
             land[_LandId] =landregistry(msg.sender, _Area, _City, _State, _LandPrice, _PropertyId);
             VerifyLand[_LandId] = false;
             
           }


    ///_______________________________________ENDS____________________________________///



///____________________________________verify lanDE_________________________________///


            function VerifyingLand(uint _LandId) public LimitedRights{
          VerifyLand[_LandId] = true;
           }



///_____________________________________ENDS__________________________________________///




//__________________________________________Reject land______________________________///

            function RejectLand(uint _LandId) public LimitedRights{
          VerifyLand[_LandId] = false;
            }



    ///________________________________ENDS_________________________________________///



    ///________________________________update seller________________________________///
            
            function updateSeller(address _addr,string memory _Name,
            uint _Age,string memory _City,uint _Cnic,string memory _Email) public{
                seller[_addr].Name=_Name;
                seller[_addr].Age= _Age;
                seller[_addr].City=_City;
                seller[_addr].Cnic=_Cnic;
                seller[_addr].Email=_Email;
           }
          

  ///____________________________________ENDS______________________________________///
  
  
  ///_______________________________cHECK OWNER BY LAND ID____________________________///

///_________________________________FIRST FOR INDIVIDUAL///_________________________________
           function getLandOwnerById(uint _id) public view returns(address) {

               return land[_id].Owner;
          }


          ///_________________________________Ends____________________________________///


          //_________________________________ 2 OF BUYER___________________________________///
       


        // ___________________________________Register BUyer Function/___________________________________///

          function RegisterBuyer(address _key ,string memory _Name,uint _Age,string memory _City,uint _Cnic,string memory  _Email) public {
          buyer[_key] = BuyerDetails(_Name,_Age,_City,_Cnic,_Email);
          VerifiedBuyer[msg.sender] = false;
          }


    ///_________________________________Ends____________________________________///



 ///__________________________VERIFY BUYER FUNCTION____________________________________///



       function BuyerVerified(address _addr) public LimitedRights{
       VerifiedBuyer[_addr] = true;
           }

           ///_________________________________Ends____________________________________///



       ///____________________Reject buyer Function______________________________________///

        function BuyerReject(address _addr) public LimitedRights{
          VerifiedBuyer[_addr] = false;
           }

              ///_________________________________Ends____________________________________///


    

    ///________________________________UPDATE BUYER ___________________________________/// 

       function UpdateBuyer(address _addr,
       string memory _Name,
       uint _Age,
       string memory _City,
       uint _Cnic,
       string memory _Email) public 
       {
                 buyer[_addr].Name=_Name;
                 buyer[_addr].Age= _Age;
                 buyer[_addr].City=_City;
                 buyer[_addr].Cnic=_Cnic;
                 buyer[_addr].Email=_Email;
           }   

         ///_________________________________Ends____________________________________///  


///________________________________Getting owner by id__________________________________________////

     function GetCurrentOwner(uint _LandId) public view returns (address _addr){
       return land[_LandId].Owner;
     }


        ///_________________________________Ends____________________________________///

         



         ////________________________________ INDIVIDUAL CALL FUNCTIOn_______________________///
        

        //////FUNCTION TO GET LAND CITY/////////////////////

        function GetLandCity(uint _LandId) public view returns(string memory _City){
            return land[_LandId].City;
        }

    ///_________________________________Ends____________________________________///


///_________________________________FUNCTION GET LAND PRICE_______________________________///


        function GetLandPrice(uint _LandId) public view returns(uint _LandPrice){
            return land[_LandId].LandPrice;
        }

        ///__________________________________ ENDS _____________________________________///



///________________________________ FUNCTION TO GET LAND AREA_____________________________///


        function GetLandArea(uint _LandId) public view returns(string memory _Area){
            return land[_LandId].Area;
        }


 ///________________________________end_______________________________________///



 ///______________________________________ BUY LAND________________________________________///


 
      function BuyLand(uint _LandId) public payable{
        require(VerifiedBuyer[msg.sender] == true,"error in buyer");
        require(VerifyLand[_LandId] == true,"error in seller");
        payable(land[_LandId].Owner).transfer(msg.value);
        land[_LandId].Owner=msg.sender;


          }
}