DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_show_all_albums_final`()
SELECT album.albumID,
              album.albumName AS albumName,
              artist.artistName AS artistName
FROM artist
INNER JOIN album ON artist.artistID = album.fk_artistID$$
DELIMITER ;