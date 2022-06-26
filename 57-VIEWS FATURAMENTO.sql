--V_FATURAMENTO
--NOTA_FISCAL, NOTA_FISCAL_ITENS,MATERIAL,CLIENTES, CIDADES,
--SELECT * FROM MATERIAL
--SELECT * FROM CLIENTES
--SELECT * FROM CIDADES

    CREATE OR REPLACE VIEW V_FATURAMENTO
    AS
    SELECT A.COD_EMPRESA,
           A.NUM_NF,
           A.ID_CLIFOR,
           A.DATA_EMISSAO,
           B.COD_MAT,
           C.DESCRICAO,
           D.RAZAO_CLIENTE,
           E.NOME_CIDADE,
           B.QTD,
           B.VAL_UNIT,
           B.QTD*B.VAL_UNIT as  TOTAL
    FROM NOTA_FISCAL A 
    INNER JOIN NOTA_FISCAL_ITENS B
    ON A.NUM_NF=B.NUM_NF
    AND A.COD_EMPRESA=B.COD_EMPRESA
    
    INNER JOIN MATERIAL C
    ON B.COD_MAT=C.COD_MAT
    AND A.COD_EMPRESA=C.COD_EMPRESA
    
    INNER JOIN CLIENTES D
    ON A.ID_CLIFOR=D.ID_CLIENTE
    AND A.COD_EMPRESA=D.COD_EMPRESA
    
    INNER JOIN CIDADES E
    ON D.COD_CIDADE=E.COD_CIDADE
    WHERE A.TIP_NF='S';
    
    --TESTANDO A VIEW
    SELECT * FROM V_FATURAMENTO
    where COD_EMPRESA=1
    ORDER BY NUM_NF;


--CRIAMOS INDICE PARA MELHORAR PERFORMANCE
--CREATE INDEX IX_FAT1 ON NOTA_FISCAL(TIP_NF)




