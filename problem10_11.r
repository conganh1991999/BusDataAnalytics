-------Cau 10: Diem thong thoang: la diem khong he bi un tac hay ket xe
# Nam: C.Anh luu y t co su dung ket qua bai 8
# Trong bai 8, t co gan l <- unique(gop_test), tong so phan tu trong l chinh la tong tat ca cac cell
# Va co su dung ket qua bai 9, diemketxe
# va day la bai lam:
#Lay cot Lat va Long cua ket qua bai 8
> colen7 <- colen6[,1:2]
#Lay cot Lat va Long cua ket qua bai 9
> bai9 <- diemketxe[,2:3]
#gop 2 file lai
> bai10 <- rbind(bai9, colen7)
#luu y: se co nhung diem trung lap (vua ket xe, vua un tac), nen ta phai lay unique
> bai10_1 <- unique(bai10)
#lay tat ca nhung diem thuoc l nhung khong thuoc bai10_1 la ra diem thong thoang
> bai10_2 <- NULL
> for(i in 1:559){
+     bai10_2 <- subset(l, l$Lat != bai10_1$Lat[[i]] & l$Long != bai10_1$Long[[i]])}
> View(bai10_2)
# bai10_2 chinh la ket qua (diemthongthoang)
-------------------------------------------------------------------------------
--------Cau 11: diem bat thuong la diem thuong xuyen bi un tac hoac ket xe
# bai nay thi t lay 1 vai ket qua cua bai 8, 9 de tinh
# tim so lan bi un tac trong cac cell cua cau 8:
> colen8 <- colen5[,1:2]                                # Lay cot Lat, Long cua colen5
> colen9 <- unique(colen8)                              # Lay unique colen8
# tim so lan lap cua cac cell trong cau 8
> a <- NULL
> colen9$Freq = 0
> for (i in 1:nrow(colen9)){
+     a <- subset(colen8, colen8$Lat == colen9$Lat[[i]] & colen8$Long == colen9$Long[[i]])
+     colen9$Freq[[i]] = nrow(a)}
# trich cac cell hay bi un tac (neu nhu lan lap lon hon 2 duoc cho la hay bi un tac)
> colen10 <- subset(colen9, colen9$Freq > 2)
> colen10 <- colen10[,1:2]
# colen10 la cac cell thuong xuyen un tac
# diemketxe2 la cac cell thuong xuyen ket xe
# hop cua colen10 va diemketxe2 la ket qua cau 11, nhung diem bat thuong
> bai11 <- rbind(colen10, diemketxe2) 
> bai11 <- unique(bai11)
# bai11 chinh la tap hop cac cell la nhung diem bat thuong, cung la dap an cau 11
-------------------------------------------------------------------------------
--------Cau12: diem can quan sat la diem cac xe di chuyen co do chenh lech lon ve van toc
