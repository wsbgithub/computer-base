<update id="mergeData" parameterType="java.util.List">
     <foreach collection="list" item="item" separator=";">
     MERGE INTO MyTable AS target
     USING (VALUES
    (#{item.keyColumn}, #{item.column1})
     ) AS source (KeyColumn, Column1)
 ON target.KeyColumn = source.KeyColumn
     WHEN MATCHED THEN
UPDATE SET Column1 = source.Column1
    WHEN NOT MATCHED THEN
INSERT (KeyColumn, Column1)
VALUES (source.KeyColumn, source.Column1);
</foreach>
</update>
