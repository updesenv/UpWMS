object dmWMS: TdmWMS
  OldCreateOrder = False
  Height = 481
  Width = 780
  object dtsUsuario: TDataSource
    DataSet = adodtsUsuario
    Left = 40
    Top = 24
  end
  object adodtsUsuario: TADODataSet
    Connection = UniMainModule.ADOConnection
    CursorType = ctStatic
    CommandText = 'SELECT * FROM WMS_USUARIOS_LOGIN WITH(NOLOCK)'
    Parameters = <>
    Left = 104
    Top = 24
    object adodtsUsuarioID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adodtsUsuarioNOME: TStringField
      FieldName = 'NOME'
      Size = 255
    end
    object adodtsUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 255
    end
    object adodtsUsuarioATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object adodtsEtiqueta: TADODataSet
    Connection = UniMainModule.ADOConnection
    CursorType = ctStatic
    CommandText = 
      'SELECT PROD.DESCRICAO,ETI.QTD,ETI.PESO,ETI.DT_FABRIC,ETI.DT_VALI' +
      'DADE,ETI.LOTE_FORN FROM LG_CODEBAR_ETIQUETA ETI WITH(NOLOCK)'#13#10'IN' +
      'NER JOIN LG_CODEBAR_UA UA WITH(NOLOCK) ON(ETI.COD_ETIQUETA = UA.' +
      'COD_ETIQUETA_UF) '#13#10'INNER JOIN CE_PRODUTOS PROD WITH(NOLOCK) ON(E' +
      'TI.COD_PROD = PROD.COD_PROD)'#13#10'WHERE COD_ETIQUETA = :@ETIQUETA AN' +
      'D TIPO_OPERACAO = '#39'D'#39' AND DINAMICA_VALIDADA = '#39'N'#39
    Parameters = <
      item
        Name = '@ETIQUETA'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 60
        Value = Null
      end>
    Left = 112
    Top = 120
    object adodtsEtiquetaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object adodtsEtiquetaQTD: TBCDField
      FieldName = 'QTD'
      Precision = 15
      Size = 3
    end
    object adodtsEtiquetaPESO: TBCDField
      FieldName = 'PESO'
      Precision = 15
      Size = 3
    end
    object adodtsEtiquetaDT_FABRIC: TDateTimeField
      FieldName = 'DT_FABRIC'
    end
    object adodtsEtiquetaDT_VALIDADE: TDateTimeField
      FieldName = 'DT_VALIDADE'
    end
    object adodtsEtiquetaLOTE_FORN: TStringField
      FieldName = 'LOTE_FORN'
      Size = 200
    end
  end
  object dtsEtiqueta: TDataSource
    DataSet = adodtsEtiqueta
    Left = 48
    Top = 120
  end
  object adoprcAlteracaoEtiquetaDinamica: TADOStoredProc
    Connection = UniMainModule.ADOConnection
    ProcedureName = 'PRC_ERP_UPDATE_ETIQUETA_DINAMICA;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@QTD'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
      end
      item
        Name = '@PESO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
      end
      item
        Name = '@LOTE_FORN'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@USUARIO_ALTERACAO_DINAMICA'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@ETIQUETA'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
      end
      item
        Name = '@FABRICACAO'
        Attributes = [paNullable]
        DataType = ftDateTime
      end
      item
        Name = '@VALIDADE'
        Attributes = [paNullable]
        DataType = ftDateTime
      end
      item
        Name = '@DT_ALTERACAO_DINAMICA'
        Attributes = [paNullable]
        DataType = ftDateTime
      end>
    Left = 264
    Top = 24
  end
end
