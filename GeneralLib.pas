//----------------------------------------------------------------------------//
//             *** ������������-��������-��������� ���������� ***             //
//                                                                            //
// ���� GeneralLib.pas                                                        //
//                                                                            //
// ������������������ ��������                                                //
//                                                                            //
//----------------------------------------------------------------------------//

unit GeneralLib;

interface

uses Math;

type

    //--- ������ ��������� ---
    TVector = record
    strict private
      //������ �������
      function ModulVector : extended;
  
      //���������� ���������� ������� �� ����������� ���������
      function BasisVector : TVector;
  
    public
      //--- ���������� ---
  
      var x, y, z : extended;
  
      //--- ������������� �������� ---

      class operator Add(A, B : TVector) : TVector;                 //�������� ���� �������� [ + ]
      class operator Subtract(A, B : TVector) : TVector;            //��������� ���� �������� [ - ]
      class operator Multiply(First, Second : TVector) : extended;  //��������� ��������� �������� [ * ]
      class operator Divide(First, Second : TVector) : TVector;     //��������� ��������� �������� [ / ]
      class operator Multiply(V : TVector; S : extended) : TVector; //��������� ������� �� ������ [ * ]
  
      //--- ���������������� ������ ---
  
      //�������������� ������ ������
      procedure Empty;
  
      //�������������� ������ ��������� ����������
      procedure Data(ValueX, ValueY, ValueZ : extended);
  
      //--- �������� ������ ��� ������ ---
  
      //���������� ������ �������
      property _Modul : extended read ModulVector;
  
      //���������� ��������� ������ �� ����������� ���������
      property _Basis : TVector read BasisVector;
    end;


    //--- ������� 3�3 ---
    TMatrix = record
    strict private
      //���������������� �������
      function TransposeMatrix : TMatrix;
  
      //�������� !!!
      //���������� �������� �������. ��� ��������� �������������. ���� ����, ����� ��� �������� ������� ������������
      // ����������� (������� ������ ���� ����������), � ���� ������� ����������. � ������: ��������� ���������
      // Count ���������� �� ������ �����������, �������� �������� ���������� ������� [0..Count-1,0..Count-1],
      // �� � �������� � ��������� ���������� FData �������� �������, � ����� �� FData ������� �������� �������
      function OppositeMatrix : TMatrix;
  
      //�������� !!!
      //���������� ������������ �������. ��� ��������� �������������, ����� �������� � ����������� ��������� �����
      // �����������. ������ ��� ����� � ���������� ����-���� ���������� ��� ��, ��� �������� �������
      function DetMatrix : extended;
  
    public
      //--- ���������� ---
  
      var FirstString, SecondString, ThirdString : TVector;
  
      //--- ������������� �������� ---
  
      class operator Multiply(M : TMatrix; V : TVector) : TVector; //������������ ������� �� ������ [ * ]
      class operator Add(A, B : TMatrix) : TMatrix;                //�������� ���� ������ [ + ]
      class operator Subtract(A, B : TMatrix) : TMatrix;           //��������� ���� ������ [ - ]
      class operator Multiply(A, B : TMatrix) : TMatrix;           //������������ ���� ������ [ * ]
  
      //--- ���������������� ������ ---
  
      //�������������� ������� ������
      procedure Empty;
  
      //�������������� ������� ��������� ���������� (������ �� �������)
      procedure Data(a, b, c, d, e, f, g, h, k : extended);
  
      //�������������� ������� ��������� ����������
      procedure DataVect(FirstStr, SecondStr, ThirdStr : TVector);
  
      //������� �������� ������ ��� OX �� �������� ����. ���� �������� ��������� �������������, ���� �� ����� ��
      // ����� ���, ������ ������� ���������� ��������, ������ ������� �������
      procedure OXMatrix(Angle : extended);
  
      //������� �������� ������ ��� OY �� �������� ����. ���� �������� ��������� �������������, ���� �� ����� ��
      // ����� ���, ������ ������� ���������� ��������, ������ ������� �������
      procedure OYMatrix(Angle : extended);
  
      //������� �������� ������ ��� OZ �� �������� ����. ���� �������� ��������� �������������, ���� �� ����� ��
      // ����� ���, ������ ������� ���������� ��������, ������ ������� �������
      procedure OZMatrix(Angle : extended);
  
      //�������� ������� �������� �� �������� ���� ����� �������� ������ ���� OX, OY, OZ. � ������ ����� ��������
      // ������ ����������� ��� ������� OXMatrix, OYMatrix, OZMatrix
      // Order ������ ������� �������� ������� ��������� ������ ������� ����
      // "xyz" - ������� ������ ��� OX, ����� ������ ��� OY, ����� ������ ��� OZ
      // "xzy" - ������� ������ ��� OX, ����� ������ ��� OZ, ����� ������ ��� OY
      // "yxz" - ������� ������ ��� OY, ����� ������ ��� OX, ����� ������ ��� OZ
      // "yzx" - ������� ������ ��� OY, ����� ������ ��� OZ, ����� ������ ��� OX
      // "zyx" - ������� ������ ��� OZ, ����� ������ ��� OY, ����� ������ ��� OX
      // "zxy" - ������� ������ ��� OZ, ����� ������ ��� OX, ����� ������ ��� OY
      procedure ThreeAnglesMatrix(OXAngle, OYAngle, OZAngle : extended;  Order : string);
  
      //--- �������� ������ ��� ������ ---
  
      //���������� ����������������� �������
      property _Trans : TMatrix read TransposeMatrix;
  
      //���������� �������� �������
      property _Opposite : TMatrix read OppositeMatrix;
  
      //���������� ������������ �������
      property _Det : extended read DetMatrix;
    end;


    //--- ���������� ---
    TQuaternion = record
    strict private
      //���������� ������ ���� �������� �� ����������� ��������
      function ModulAngleFromQuat : extended;
  
      //���������� ����� (������) �����������
      function NormQuat : extended;
  
      //���������� ���������� ����������� �� ����������� ���������
      function BasisQuat : TQuaternion;
  
      //�������� ����������
      function OppositeQuat : TQuaternion;
  
      //�������� ������� ��������� �� ����������� ��������
      function MatrixFromQuat : TMatrix;
  
    public
      //--- ���������� ---
  
      var
        q0 : extended; //��������� ������������ w
        q1 : extended; //��������� ������������ x
        q2 : extended; //��������� ������������ y
        q3 : extended; //��������� ������������ z
  
      //--- ������������� �������� ---
  
      //������� ������� � ������� ��������� �����������. ������������� ��������� �������, ����������� �� �������
      // ���������: ������� ����� ��������� ����������� ������� �����������, � �������� �� 90 �������� ������
      // ��������� ����������� �������������� �������� (�������� �� ������������� ����). ������������ ����������� ��
      // ������ [ * ]
      class operator Multiply(Q : TQuaternion; V : TVector) : TVector;
      class operator Add(A, B : TQuaternion) : TQuaternion;        //�������� ���� ������������ [ + ]
      class operator Subtract(A, B : TQuaternion) : TQuaternion;   //��������� ���� ������������ [ - ]
      class operator Multiply(Q1, Q2 : TQuaternion) : TQuaternion; //������������ ���� ������������ [ * ]
  
      //--- ���������������� ������ ---
  
      //�������������� ���������� ������
      procedure Empty;
  
      //�������������� ���������� ��������� ����������
      procedure Data(Valueq0, Valueq1, Valueq2, Valueq3 : extended);
  
      //������ ���������� �������� �� �������, ������ �������� ���� ��������� ��������, � ����, �� ������� ����
      // ��������� ��������. ���� �������� ���� ������������ �� ������� ���������
      procedure MakeQuat(Angle : extended; V : TVector);
  
      //�������� ���������� �������� �� ������� ��������� �� ��������� ������
      procedure QuatFromMatrixStanley(M : TMatrix);
  
      //�������� ���������� �� �������� ���� ����� �������� ������ ���� OX, OY, OZ. � ������ ����� ��������
      // ������ ����������� ��� ������� OXMatrix, OYMatrix, OZMatrix
      // Order ������ ������� �������� ������� ��������� ������ ������� ����
      // "xyz" - ������� ������ ��� OX, ����� ������ ��� OY, ����� ������ ��� OZ
      // "xzy" - ������� ������ ��� OX, ����� ������ ��� OZ, ����� ������ ��� OY
      // "yxz" - ������� ������ ��� OY, ����� ������ ��� OX, ����� ������ ��� OZ
      // "yzx" - ������� ������ ��� OY, ����� ������ ��� OZ, ����� ������ ��� OX
      // "zyx" - ������� ������ ��� OZ, ����� ������ ��� OY, ����� ������ ��� OX
      // "zxy" - ������� ������ ��� OZ, ����� ������ ��� OX, ����� ������ ��� OY
      procedure ThreeAnglesQuat(OXAngle, OYAngle, OZAngle : extended;  Order : string);
  
      //--- �������� ������ ��� ������ ---
  
      //���������� ������ ���� ��������
      property _ModulAngle : extended read ModulAngleFromQuat;
  
      //���������� ����� (������) �����������
      property _Norm : extended read NormQuat;
  
      //���������� ��������� ���������� �� ����������� ���������
      property _Basis : TQuaternion read BasisQuat;
  
      //���������� �������� ����������
      property _Opposite : TQuaternion read OppositeQuat;
  
      //���������� ������� ���������
      property _Matrix : TMatrix read MatrixFromQuat;
    end;


implementation


procedure TVector.Empty;
begin
  x := 0.0;
  y := 0.0;
  z := 0.0;
end;


function TVector.BasisVector : TVector;
var
  d : extended;
  R : TVector;
begin
  try
    d := ModulVector;

    if (d <> 0) then
    begin
      R.x := x / d;
      R.y := y / d;
      R.z := z / d;
    end
    else
    begin
      R.x := x;
      R.y := y;
      R.z := z;
    end;

    result := R;
  except
    result.x := 0.0;
    result.y := 0.0;
    result.z := 0.0;
  end;
end;


procedure TVector.Data(ValueX, ValueY, ValueZ : extended);
begin
  x := ValueX;
  y := ValueY;
  z := ValueZ;
end;


class operator TVector.Add(A, B: TVector): TVector;
var
  R : TVector;
begin
  try
    R.x := a.x + b.x;
    R.y := a.y + b.y;
    R.z := a.z + b.z;

    result := R;
  except
    result.x := 0.0;
    result.y := 0.0;
    result.z := 0.0;
  end;
end;


function TVector.ModulVector : extended;
begin
  try
    result := sqrt(x*x + y*y + z*z);
  except
    result := 0.0;
  end;
end;


class operator TVector.Multiply(V : TVector; S : extended): TVector;
var
  R : TVector;
begin
  try
    R.x := V.x * S;
    R.y := V.y * S;
    R.z := V.z * S;

    result := R;
  except
    result.x := 0.0;
    result.y := 0.0;
    result.z := 0.0;
  end;
end;


class operator TVector.Subtract(A, B: TVector): TVector;
var
  R : TVector;
begin
  try
    R.x := A.x - B.x;
    R.y := A.y - B.y;
    R.z := A.z - B.z;

    result := R;
  except
    result.x := 0.0;
    result.y := 0.0;
    result.z := 0.0;
  end;
end;


class operator TVector.Multiply(First, Second: TVector): extended;
begin
  try
    result := First.x*Second.x + First.y*Second.y + First.z*Second.z;
  except
    result := 0.0;
  end;
end;


class operator TVector.Divide(First, Second: TVector): TVector;
var
  R : TVector;
begin
  try
    R.x := First.y*Second.z - First.z*Second.y;
    R.y := First.z*Second.x - First.x*Second.z;
    R.z := First.x*Second.y - First.y*Second.x;

    result := R;
  except
    result.x := 0.0;
    result.y := 0.0;
    result.z := 0.0;
  end;
end;


//-----------------------------------------------------------------------------


class operator TMatrix.Add(A, B: TMatrix): TMatrix;
var
  R : TMatrix;
begin
  try
    R.FirstString  := A.FirstString + B.FirstString;
    R.SecondString := A.SecondString + B.SecondString;
    R.ThirdString  := A.ThirdString + B.ThirdString;

    result := R;
  except
    result.FirstString.x := 0.0;
    result.FirstString.y := 0.0;
    result.FirstString.z := 0.0;
    result.SecondString.x := 0.0;
    result.SecondString.y := 0.0;
    result.SecondString.z := 0.0;
    result.ThirdString.x := 0.0;
    result.ThirdString.y := 0.0;
    result.ThirdString.z := 0.0;
  end;
end;


procedure TMatrix.Data(a, b, c, d, e, f, g, h, k: extended);
begin
  FirstString.x := a;
  FirstString.y := b;
  FirstString.z := c;
  SecondString.x := d;
  SecondString.y := e;
  SecondString.z := f;
  ThirdString.x := g;
  ThirdString.y := h;
  ThirdString.z := k;
end;


procedure TMatrix.DataVect(FirstStr, SecondStr, ThirdStr: TVector);
begin
  FirstString := FirstStr;
  SecondString := SecondStr;
  ThirdString := ThirdStr;
end;


function TMatrix.DetMatrix: extended;
const
  Count : integer = 3;
label
  endd;
var
  Temp, A : array of array of extended;
  FData : array[0..2,0..2] of extended;
  Cols, Rows : Word;
  i, j, k : Integer;
begin
  try
    Result := 1.0; //��������� ����������. ��� �����

    FData[0,0] := FirstString.x;
    FData[0,1] := FirstString.y;
    FData[0,2] := FirstString.z;
    FData[1,0] := SecondString.x;
    FData[1,1] := SecondString.y;
    FData[1,2] := SecondString.z;
    FData[2,0] := ThirdString.x;
    FData[2,1] := ThirdString.y;
    FData[2,2] := ThirdString.z;

    SetLength(A, Count, Count);
    SetLength(Temp, 1, Count);
    for i := 0 to Count - 1 do
      for j := 0 to Count - 1 do
        A[i, j] := FData[i, j];
    for i := 0 to Count - 2 do  //������ �������������� � �������� ������������ ����
    begin
      for j := i to Count - 1 do                                 // �����    
      begin                                                      // �������  
        Rows := 0;                                               // �����    
        Cols := 0;                                               // �        
        for k := i to Count - 1 do                               // �������� 
        begin                                                    // �        
          Rows := Rows + Ord(A[j, k] = 0);                       // �������  
          Cols := Cols + Ord(A[k, j] = 0);                       //          
        end;                                                     //          
        if Rows + Cols = 0 then                                  //          
          Break;                                                 //          
        if (Cols = Count - i) or (Rows = Count - i) then         //
        begin
          //������� �����������. Ÿ ������������ ����� ����
          result := 0.0;
          goto endd;
        end;
      end;
      if A[i, i] = 0 then
        for j := i + 1 to Count - 1 do
          if A[j, i] <> 0 then
          begin
            Result := -Result;                // ������ ������ 
            Temp[0] := A[i];                  // �� ������ �   
            A[i] := A[j];                     // ������        
            A[j] := Temp[0];                  // ���������     
            Break                             // ���������
          end;
      for j := i + 1 to Count - 1 do
        if A[j, i] <> 0 then
        begin
          for k := i + 1 to Count - 1 do
            A[j, k] := A[j, k] - A[i, k] * A[j, i] / A[i, i];
          A[j, i] := 0
        end
    end; //����� ��������������
    for i := 0 to Count - 1 do     //������������ ��� ������������
      Result := Result * A[i, i];  // ��������� �� ������� ���������

endd:

  except
    result := 0.0;
  end;
end;


procedure TMatrix.Empty;
begin
  FirstString.x := 0.0;
  FirstString.y := 0.0;
  FirstString.z := 0.0;
  SecondString.x := 0.0;
  SecondString.y := 0.0;
  SecondString.z := 0.0;
  ThirdString.x := 0.0;
  ThirdString.y := 0.0;
  ThirdString.z := 0.0;
end;


class operator TMatrix.Multiply(A, B: TMatrix): TMatrix;
var
  FirstColumn, SecondColumn, ThirdColumn : TVector;
  R : TMatrix;
begin
  try
    FirstColumn.x := B.FirstString.x;
    FirstColumn.y := B.SecondString.x;
    FirstColumn.z := B.ThirdString.x;

    SecondColumn.x := B.FirstString.y;
    SecondColumn.y := B.SecondString.y;
    SecondColumn.z := B.ThirdString.y;

    ThirdColumn.x := B.FirstString.z;
    ThirdColumn.y := B.SecondString.z;
    ThirdColumn.z := B.ThirdString.z;

    R.FirstString.x :=  A.FirstString * FirstColumn;
    R.SecondString.x := A.SecondString * FirstColumn;
    R.ThirdString.x :=  A.ThirdString * FirstColumn;

    R.FirstString.y :=  A.FirstString * SecondColumn;
    R.SecondString.y := A.SecondString * SecondColumn;
    R.ThirdString.y :=  A.ThirdString * SecondColumn;

    R.FirstString.z :=  A.FirstString * ThirdColumn;
    R.SecondString.z := A.SecondString * ThirdColumn;
    R.ThirdString.z :=  A.ThirdString * ThirdColumn;

    result := R;
  except
    result.FirstString.x := 0.0;
    result.FirstString.y := 0.0;
    result.FirstString.z := 0.0;
    result.SecondString.x := 0.0;
    result.SecondString.y := 0.0;
    result.SecondString.z := 0.0;
    result.ThirdString.x := 0.0;
    result.ThirdString.y := 0.0;
    result.ThirdString.z := 0.0;
  end;
end;


class operator TMatrix.Multiply(M: TMatrix; V: TVector): TVector;
var
  R : TVector;
begin
  try
    R.x := M.FirstString.x*V.x + M.FirstString.y*V.y + M.FirstString.z*V.z;
    R.y := M.SecondString.x*V.x + M.SecondString.y*V.y + M.SecondString.z*V.z;
    R.z := M.ThirdString.x*V.x + M.ThirdString.y*V.y + M.ThirdString.z*V.z;
    result := R;
  except
    result.x := 0.0;
    result.y := 0.0;
    result.z := 0.0;
  end;
end;


function TMatrix.OppositeMatrix: TMatrix;
const
  Count : integer = 3;
label
  endd;
var
  Temp, A : array of array of extended;
  FData : array[0..2,0..2] of extended;
  Cols, Rows : Word;
  i, j, k : Integer;
begin
  try
    FData[0,0] := FirstString.x;
    FData[0,1] := FirstString.y;
    FData[0,2] := FirstString.z;
    FData[1,0] := SecondString.x;
    FData[1,1] := SecondString.y;
    FData[1,2] := SecondString.z;
    FData[2,0] := ThirdString.x;
    FData[2,1] := ThirdString.y;
    FData[2,2] := ThirdString.z;

    SetLength(A, Count, Count * 2);
    SetLength(Temp, 1, Count * 2);
    for i := 0 to Count - 1 do
    begin
      for j := 0 to Count - 1 do         //������ ������� ���� [A|E]
        A[i, j] := FData[i, j];
      for j := Count to Count * 2 - 1 do
        A[i, j] := Ord(i = (j - Count));
    end;

    for i := 0 to Count - 1 do //������ �������������� � ���� [E|B]
    begin
      for j := i to Count - 1 do                                 // �����    
      begin                                                      // �������  
        Rows := 0;                                               // �����    
        Cols := 0;                                               // �        
        for k := i to Count - 1 do                               // �������� 
        begin                                                    // �        
          Rows := Rows + Ord(A[j, k] = 0);                       // �������  
          Cols := Cols + Ord(A[k, j] = 0);                       //          
        end;                                                     //          
        if Rows + Cols = 0 then                                  //          
          Break;                                                 //          
        if (Cols = Count - i) or (Rows = Count - i) then         //
        begin
          //DescriptionOfErrors.Add('1009 ������� �����������. ���������� ��������� �������� �������');

          result.FirstString.x := 0.0;
          result.FirstString.y := 0.0;
          result.FirstString.z := 0.0;
          result.SecondString.x := 0.0;
          result.SecondString.y := 0.0;
          result.SecondString.z := 0.0;
          result.ThirdString.x := 0.0;
          result.ThirdString.y := 0.0;
          result.ThirdString.z := 0.0;

          goto endd;
        end;
      end;

      if A[i, i] = 0 then
        for j := i + 1 to Count - 1 do
          if A[j, i] <> 0 then
          begin
            Temp[0] := A[i];           //������ ������  �� ������ �
            A[i] := A[j];              // ������ ��������� ���������
            A[j] := Temp[0];
            Break
          end;

      for j := 0 to i - 1 do           //���������� ���� ��������������
        if A[j, i] <> 0 then
        begin
          for k := i + 1 to 2 * Count - 1 do
            A[j, k] := A[j, k] - A[i, k] * A[j, i] / A[i, i];
          A[j, i] := 0
        end;
      for j := i + 1 to Count - 1 do
        if A[j, i] <> 0 then
        begin
          for k := i + 1 to 2 * Count - 1 do
            A[j, k] := A[j, k] - A[i, k] * A[j, i] / A[i, i];
          A[j, i] := 0
        end;
    end; //����� ��������������
    for i := 0 to Count - 1 do              //�������� �������� �������� �������
      for j := 0 to Count - 1 do
        FData [i, j] := A[i, j + Count] / A[i, i];

    result.FirstString.x  := FData[0,0];
    result.FirstString.y  := FData[0,1];
    result.FirstString.z  := FData[0,2];
    result.SecondString.x := FData[1,0];
    result.SecondString.y := FData[1,1];
    result.SecondString.z := FData[1,2];
    result.ThirdString.x  := FData[2,0];
    result.ThirdString.y  := FData[2,1];
    result.ThirdString.z  := FData[2,2];

endd:

  except
    result.FirstString.x := 0.0;
    result.FirstString.y := 0.0;
    result.FirstString.z := 0.0;
    result.SecondString.x := 0.0;
    result.SecondString.y := 0.0;
    result.SecondString.z := 0.0;
    result.ThirdString.x := 0.0;
    result.ThirdString.y := 0.0;
    result.ThirdString.z := 0.0;
  end;
end;


procedure TMatrix.OXMatrix(Angle: extended);
begin
  try
    FirstString.x :=  1;  FirstString.y :=  0;           FirstString.z := 0;
    SecondString.x := 0;  SecondString.y := cos(Angle);  SecondString.z := -sin(Angle);
    ThirdString.x :=  0;  ThirdString.y :=  sin(Angle);  ThirdString.z :=  cos(Angle);
  except
    FirstString.x := 0.0;
    FirstString.y := 0.0;
    FirstString.z := 0.0;
    SecondString.x := 0.0;
    SecondString.y := 0.0;
    SecondString.z := 0.0;
    ThirdString.x := 0.0;
    ThirdString.y := 0.0;
    ThirdString.z := 0.0;
  end;
end;


procedure TMatrix.OYMatrix(Angle: extended);
begin
  try
    FirstString.x :=  cos(Angle);  FirstString.y :=  0;  FirstString.z := sin(Angle);
    SecondString.x := 0;           SecondString.y := 1;  SecondString.z := 0;
    ThirdString.x :=  -sin(Angle); ThirdString.y :=  0;  ThirdString.z := cos(Angle);
  except
    FirstString.x := 0.0;
    FirstString.y := 0.0;
    FirstString.z := 0.0;
    SecondString.x := 0.0;
    SecondString.y := 0.0;
    SecondString.z := 0.0;
    ThirdString.x := 0.0;
    ThirdString.y := 0.0;
    ThirdString.z := 0.0;
  end;
end;


procedure TMatrix.OZMatrix(Angle: extended);
begin
  try
    FirstString.x :=  cos(Angle);  FirstString.y :=  -sin(Angle);  FirstString.z :=  0;
    SecondString.x := sin(Angle);  SecondString.y := cos(Angle);   SecondString.z := 0;
    ThirdString.x :=  0;           ThirdString.y :=  0;            ThirdString.z :=  1;
  except
    FirstString.x := 0.0;
    FirstString.y := 0.0;
    FirstString.z := 0.0;
    SecondString.x := 0.0;
    SecondString.y := 0.0;
    SecondString.z := 0.0;
    ThirdString.x := 0.0;
    ThirdString.y := 0.0;
    ThirdString.z := 0.0;
  end;
end;


class operator TMatrix.Subtract(A, B: TMatrix): TMatrix;
var
  R : TMatrix;
begin
  try
    R.FirstString  := A.FirstString - B.FirstString;
    R.SecondString := A.SecondString - B.SecondString;
    R.ThirdString  := A.ThirdString - B.ThirdString;

    result := R;
  except
    result.FirstString.x := 0.0;
    result.FirstString.y := 0.0;
    result.FirstString.z := 0.0;
    result.SecondString.x := 0.0;
    result.SecondString.y := 0.0;
    result.SecondString.z := 0.0;
    result.ThirdString.x := 0.0;
    result.ThirdString.y := 0.0;
    result.ThirdString.z := 0.0;
  end;
end;


procedure TMatrix.ThreeAnglesMatrix(OXAngle, OYAngle, OZAngle: extended; Order: string);
var
  M, M1, M2, M3, M4 : TMatrix;
begin
  try
    M.FirstString.x := 0;  M.FirstString.y := 0;  M.FirstString.z := 0;
    M.SecondString.x := 0; M.SecondString.y := 0; M.SecondString.z := 0;
    M.ThirdString.x := 0;  M.ThirdString.y := 0;  M.ThirdString.z := 0;

    OXMatrix(OXAngle);

    M1.FirstString.x  := FirstString.x;
    M1.FirstString.y  := FirstString.y;
    M1.FirstString.z  := FirstString.z;
    M1.SecondString.x := SecondString.x;
    M1.SecondString.y := SecondString.y;
    M1.SecondString.z := SecondString.z;
    M1.ThirdString.x  := ThirdString.x;
    M1.ThirdString.y  := ThirdString.y;
    M1.ThirdString.z  := ThirdString.z;

    OYMatrix(OYAngle);

    M2.FirstString.x  := FirstString.x;
    M2.FirstString.y  := FirstString.y;
    M2.FirstString.z  := FirstString.z;
    M2.SecondString.x := SecondString.x;
    M2.SecondString.y := SecondString.y;
    M2.SecondString.z := SecondString.z;
    M2.ThirdString.x  := ThirdString.x;
    M2.ThirdString.y  := ThirdString.y;
    M2.ThirdString.z  := ThirdString.z;

    OZMatrix(OZAngle);

    M3.FirstString.x  := FirstString.x;
    M3.FirstString.y  := FirstString.y;
    M3.FirstString.z  := FirstString.z;
    M3.SecondString.x := SecondString.x;
    M3.SecondString.y := SecondString.y;
    M3.SecondString.z := SecondString.z;
    M3.ThirdString.x  := ThirdString.x;
    M3.ThirdString.y  := ThirdString.y;
    M3.ThirdString.z  := ThirdString.z;

    if (Order = 'xyz') then
    begin
      M4 := M3*M2;
      M := M4*M1;
    end;

    if (Order = 'xzy') then
    begin
      M4 := M2*M3;
      M := M4*M1;
    end;

    if (Order = 'yxz') then
    begin
      M4 := M3*M1;
      M := M4*M2;
    end;

    if (Order = 'yzx') then
    begin
      M4 := M1*M3;
      M := M4*M2;
    end;

    if (Order = 'zyx') then
    begin
      M4 := M1*M2;
      M := M4*M3;
    end;

    if (Order = 'zxy') then
    begin
      M4 := M2*M1;
      M := M4*M3;
    end;

    FirstString.x :=  M.FirstString.x;
    FirstString.y :=  M.FirstString.y;
    FirstString.z :=  M.FirstString.z;
    SecondString.x := M.SecondString.x;
    SecondString.y := M.SecondString.y;
    SecondString.z := M.SecondString.z;
    ThirdString.x :=  M.ThirdString.x;
    ThirdString.y :=  M.ThirdString.y;
    ThirdString.z :=  M.ThirdString.z;

  except
    FirstString.x := 0.0;
    FirstString.y := 0.0;
    FirstString.z := 0.0;
    SecondString.x := 0.0;
    SecondString.y := 0.0;
    SecondString.z := 0.0;
    ThirdString.x := 0.0;
    ThirdString.y := 0.0;
    ThirdString.z := 0.0;
  end;
end;


function TMatrix.TransposeMatrix: TMatrix;
var
  FirstColumn, SecondColumn, ThirdColumn : TVector;
  R : TMatrix;
begin
  try
    FirstColumn.x := FirstString.x;
    FirstColumn.y := SecondString.x;
    FirstColumn.z := ThirdString.x;

    SecondColumn.x := FirstString.y;
    SecondColumn.y := SecondString.y;
    SecondColumn.z := ThirdString.y;

    ThirdColumn.x := FirstString.z;
    ThirdColumn.y := SecondString.z;
    ThirdColumn.z := ThirdString.z;

    R.FirstString := FirstColumn;
    R.SecondString := SecondColumn;
    R.ThirdString := ThirdColumn;

    result := R;
  except
    result.FirstString.x := 0.0;
    result.FirstString.y := 0.0;
    result.FirstString.z := 0.0;
    result.SecondString.x := 0.0;
    result.SecondString.y := 0.0;
    result.SecondString.z := 0.0;
    result.ThirdString.x := 0.0;
    result.ThirdString.y := 0.0;
    result.ThirdString.z := 0.0;
  end;
end;


//-----------------------------------------------------------------------------


class operator TQuaternion.Add(A, B: TQuaternion): TQuaternion;
var
  R : TQuaternion;
begin
  try
    R.q0 := A.q0 + B.q0;
    R.q1 := A.q1 + B.q1;
    R.q2 := A.q2 + B.q2;
    R.q3 := A.q3 + B.q3;

    result := R;
  except
    result.q0 := 0.0;
    result.q1 := 0.0;
    result.q2 := 0.0;
    result.q3 := 0.0;
  end;
end;


function TQuaternion.BasisQuat: TQuaternion;
var
  N : extended;
  R : TQuaternion;
begin
  try
    N := NormQuat;

    R.q0 := q0 / N;
    R.q1 := q1 / N;
    R.q2 := q2 / N;
    R.q3 := q3 / N;

    result := R;
  except
    result.q0 := 0.0;
    result.q1 := 0.0;
    result.q2 := 0.0;
    result.q3 := 0.0;
  end;
end;


procedure TQuaternion.Data(Valueq0, Valueq1, Valueq2, Valueq3: extended);
begin
  q0 := Valueq0;
  q1 := Valueq1;
  q2 := Valueq2;
  q3 := Valueq3;
end;


procedure TQuaternion.Empty;
begin
  q0 := 0.0;
  q1 := 0.0;
  q2 := 0.0;
  q3 := 0.0;
end;


procedure TQuaternion.MakeQuat(Angle: extended; V: TVector);
var
  V_ : TVector;
  Q : TQuaternion;
begin
  try
    //�������� ��������� ������ � ����������� ��������� �������
    V_ := V._Basis;

    //������ ���������� (���� �� �� ������ �������, �� � ����������� ������������)
    Q.q0 := cos(Angle/2);
    Q.q1 := V_.x * sin(Angle/2);
    Q.q2 := V_.y * sin(Angle/2);
    Q.q3 := V_.z * sin(Angle/2);

    //������� ���������� � ������� (������ �� �� ����������� ������������)
    Q := Q.BasisQuat;

    q0 := Q.q0;
    q1 := Q.q1;
    q2 := Q.q2;
    q3 := Q.q3;
  except
    q0 := 0.0;
    q1 := 0.0;
    q2 := 0.0;
    q3 := 0.0;
  end;
end;


function TQuaternion.MatrixFromQuat: TMatrix;
var
  wx, wy, wz, xx, yy, yz, xy, xz, zz, x2, y2, z2 : extended;
  M : TMatrix;
begin
  try
    x2 := q1 + q1;
    y2 := q2 + q2;
    z2 := q3 + q3;

    xx := q1 * x2;
    yy := q2 * y2;
    wx := q0 * x2;

    xy := q1 * y2;
    yz := q2 * z2;
    wy := q0 * y2;

    xz := q1 * z2;
    zz := q3 * z2;
    wz := q0 * z2;

    M.FirstString.x  := 1.0-(yy+zz);
    M.SecondString.x := xy+wz;
    M.ThirdString.x  := xz-wy;

    M.FirstString.y  := xy-wz;
    M.SecondString.y := 1.0-(xx+zz);
    M.ThirdString.y  := yz+wx;

    M.FirstString.z  := xz+wy;
    M.SecondString.z := yz-wx;
    M.ThirdString.z  := 1.0-(xx+yy);
    result := M;
  except
    result.FirstString.x := 0.0;
    result.FirstString.y := 0.0;
    result.FirstString.z := 0.0;
    result.SecondString.x := 0.0;
    result.SecondString.y := 0.0;
    result.SecondString.z := 0.0;
    result.ThirdString.x := 0.0;
    result.ThirdString.y := 0.0;
    result.ThirdString.z := 0.0;
  end;
end;


function TQuaternion.ModulAngleFromQuat: extended;
var
  Angle : extended;
  P : TQuaternion;
begin
  try
    P := BasisQuat;
    Angle := Math.ArcCos(P.q0)*2.0;

    result := Angle;
  except
    result := 0.0;
  end;
end;


class operator TQuaternion.Multiply(Q1, Q2: TQuaternion): TQuaternion;
var
  A, B, C, D, E, F, G, H : extended;
  R : TQuaternion;
begin
  try
    A := (Q1.q0 + Q1.q1) * (Q2.q0 + Q2.q1);
    B := (Q1.q3 - Q1.q2) * (Q2.q2 - Q2.q3);
    C := (Q1.q1 - Q1.q0) * (Q2.q2 + Q2.q3);
    D := (Q1.q2 + Q1.q3) * (Q2.q1 - Q2.q0);
    E := (Q1.q1 + Q1.q3) * (Q2.q1 + Q2.q2);
    F := (Q1.q1 - Q1.q3) * (Q2.q1 - Q2.q2);
    G := (Q1.q0 + Q1.q2) * (Q2.q0 - Q2.q3);
    H := (Q1.q0 - Q1.q2) * (Q2.q0 + Q2.q3);

    R.q0 := B + (-E - F + G + H) * 0.5;
    R.q1 := A - ( E + F + G + H) * 0.5;
    R.q2 := -C + ( E - F + G - H) * 0.5;
    R.q3 := -D + ( E - F - G + H) * 0.5;
    result := R;
  except
    result.q0 := 0.0;
    result.q1 := 0.0;
    result.q2 := 0.0;
    result.q3 := 0.0;
  end;
end;


class operator TQuaternion.Multiply(Q: TQuaternion; V: TVector): TVector;
var
  A, B, C, D, E, F, G, H : extended;
  P : TQuaternion;
  R : TVector;
begin
  try
    P := Q.OppositeQuat;

    A := (Q.q0 + Q.q1) * (V.x);
    B := (Q.q3 - Q.q2) * (V.y - V.z);
    C := (Q.q1 - Q.q0) * (V.y + V.z);
    D := (Q.q2 + Q.q3) * (V.x);
    E := (Q.q1 + Q.q3) * (V.x + V.y);
    F := (Q.q1 - Q.q3) * (V.x - V.y);
    G := (Q.q0 + Q.q2) * (-V.z);
    H := (Q.q0 - Q.q2) * (V.z);

    Q.q0 :=  B + (-E - F + G + H) * 0.5;
    Q.q1 :=  A - ( E + F + G + H) * 0.5;
    Q.q2 := -C + ( E - F + G - H) * 0.5;
    Q.q3 := -D + ( E - F - G + H) * 0.5;

    A := (Q.q0 + Q.q1) * (P.q0 + P.q1);
    C := (Q.q1 - Q.q0) * (P.q2 + P.q3);
    D := (Q.q2 + Q.q3) * (P.q1 - P.q0);
    E := (Q.q1 + Q.q3) * (P.q1 + P.q2);
    F := (Q.q1 - Q.q3) * (P.q1 - P.q2);
    G := (Q.q0 + Q.q2) * (P.q0 - P.q3);
    H := (Q.q0 - Q.q2) * (P.q0 + P.q3);

    R.x :=  A - ( E + F + G + H) * 0.5;
    R.y := -C + ( E - F + G - H) * 0.5;
    R.z := -D + ( E - F - G + H) * 0.5;
    result := R;
  except
    result.x := 0.0;
    result.y := 0.0;
    result.z := 0.0;
  end;
end;


function TQuaternion.NormQuat: extended;
var
  N : extended;
begin
  try
    N := sqrt(q0*q0 + q1*q1 + q2*q2 + q3*q3);
    result := N;
  except
    result := 0.0;
  end;
end;


function TQuaternion.OppositeQuat: TQuaternion;
var
  N : extended;
  P : TQuaternion;
begin
  try
    N := NormQuat;
    P.q0 := q0 / N;
    P.q1 := -q1 / N;
    P.q2 := -q2 / N;
    P.q3 := -q3 / N;
    result := P;
  except
    result.q0 := 0.0;
    result.q1 := 0.0;
    result.q2 := 0.0;
    result.q3 := 0.0;
  end;
end;


procedure TQuaternion.QuatFromMatrixStanley(M: TMatrix);
var
  Q : TQuaternion;
  T : extended;
  Valueq0, Valueq1, Valueq2, Valueq3 : extended;
begin
  try
    Q.q0 := 0;
    Q.q1 := 0;
    Q.q2 := 0;
    Q.q3 := 0;

    T := M.FirstString.x + M.SecondString.y + M.ThirdString.z;

    Valueq0 := (1 + T)/4;
    Valueq1 := (1 + 2*M.FirstString.x - T)/4;
    Valueq2 := (1 + 2*M.SecondString.y - T)/4;
    Valueq3 := (1 + 2*M.ThirdString.z - T)/4;

    if ((Valueq0 >= Valueq1) and (Valueq0 >= Valueq2) and (Valueq0 >= Valueq3)) then
    begin
      Q.q0 := sqrt(Valueq0);
      Q.q1 := (M.SecondString.z - M.ThirdString.y)  / (4 * Q.q0);
      Q.q2 := (M.ThirdString.x  - M.FirstString.z)  / (4 * Q.q0);
      Q.q3 := (M.FirstString.y  - M.SecondString.x) / (4 * Q.q0);
    end;

    if ((Valueq1 >= Valueq0) and (Valueq1 >= Valueq2) and (Valueq1 >= Valueq3)) then
    begin
      Q.q1 := sqrt(Valueq1);
      Q.q0 := (M.SecondString.z - M.ThirdString.y)  / (4 * Q.q1);
      Q.q2 := (M.FirstString.y  + M.SecondString.x) / (4 * Q.q1);
      Q.q3 := (M.ThirdString.x  + M.FirstString.z)  / (4 * Q.q1);
    end;

    if ((Valueq2 >= Valueq0) and (Valueq2 >= Valueq1) and (Valueq2 >= Valueq3)) then
    begin
      Q.q2 := sqrt(Valueq2);
      Q.q0 := (M.ThirdString.x - M.FirstString.z) / (4 * Q.q2);
      Q.q1 := (M.FirstString.y + M.SecondString.x) / (4 * Q.q2);
      Q.q3 := (M.SecondString.z + M.ThirdString.y) / (4 * Q.q2);
    end;

    if ((Valueq3 >= Valueq1) and (Valueq3 >= Valueq2) and (Valueq3 >= Valueq0)) then
    begin
      Q.q3 := sqrt(Valueq3);
      Q.q0 := (M.FirstString.y  - M.SecondString.x) / (4 * Q.q3);
      Q.q1 := (M.ThirdString.x  + M.FirstString.z)  / (4 * Q.q3);
      Q.q2 := (M.SecondString.z + M.ThirdString.y)  / (4 * Q.q3);
    end;

    Q := Q.BasisQuat;

    Q := Q.OppositeQuat;

    q0 := Q.q0;
    q1 := Q.q1;
    q2 := Q.q2;
    q3 := Q.q3;
  except
    q0 := 0.0;
    q1 := 0.0;
    q2 := 0.0;
    q3 := 0.0;
  end;
end;


class operator TQuaternion.Subtract(A, B: TQuaternion): TQuaternion;
var
  R : TQuaternion;
begin
  try
    R.q0 := A.q0 - B.q0;
    R.q1 := A.q1 - B.q1;
    R.q2 := A.q2 - B.q2;
    R.q3 := A.q3 - B.q3;

    result := R;
  except
    result.q0 := 0.0;
    result.q1 := 0.0;
    result.q2 := 0.0;
    result.q3 := 0.0;
  end;
end;


procedure TQuaternion.ThreeAnglesQuat(OXAngle, OYAngle, OZAngle: extended; Order: string);
var
  Q, P1, P2, P3, P4 : TQuaternion;
  V : TVector;
begin
  try
    Q.q0 := 0;
    Q.q1 := 0;
    Q.q2 := 0;
    Q.q3 := 0;

    V.x := 1;
    V.y := 0;
    V.z := 0;
    P1.MakeQuat(OXAngle,V);

    V.x := 0;
    V.y := 1;
    V.z := 0;
    P2.MakeQuat(OYAngle,V);

    V.x := 0;
    V.y := 0;
    V.z := 1;
    P3.MakeQuat(OZAngle,V);


    if (Order = 'xyz') then
    begin
      P4 := P3*P2;
      Q := P4*P1;
    end;

    if (Order = 'xzy') then
    begin
      P4 := P2*P3;
      Q := P4*P1;
    end;

    if (Order = 'yxz') then
    begin
      P4 := P3*P1;
      Q := P4*P2;
    end;

    if (Order = 'yzx') then
    begin
      P4 := P1*P3;
      Q := P4*P2;
    end;

    if (Order = 'zyx') then
    begin
      P4 := P1*P2;
      Q := P4*P3;
    end;

    if (Order = 'zxy') then
    begin
      P4 := P2*P1;
      Q := P4*P3;
    end;

    q0 := Q.q0;
    q1 := Q.q1;
    q2 := Q.q2;
    q3 := Q.q3;
  except
    q0 := 0.0;
    q1 := 0.0;
    q2 := 0.0;
    q3 := 0.0;
  end;
end;


end.
