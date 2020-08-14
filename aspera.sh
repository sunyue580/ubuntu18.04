-------------------------------------------------------EBI------------------------------------------------------------------

##ENA数据库下载fastq文件
ascp -QT -l 300m -P33001 -i $HOME/.aspera/connect/etc/asperaweb_id_dsa.openssh era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/SRR391/SRR391033/SRR391033.fastq.gz ./ 
或
ascp -QT -l 300m -P33001 -i $HOME/.aspera/connect/etc/asperaweb_id_dsa.openssh \
 --host=fasp.sra.ebi.ac.uk --user=era-fasp --mode=recv \
 vol1/fastq/SRR391/SRR391033/SRR391033.fastq.gz ./

##ENA数据库批量下载fastq文件
nohup bash download.sh    #download.sh见github文件

-v verbose mode 唠叨模式，能让你实时知道程序在干啥，方便查错。有些作者的程序缺乏人性化，运行之后，只见光标闪，压根不知道运行到哪了
-T 取消加密，否则有时候数据下载不了
-i 提供私钥文件的地址，我也不知道干嘛的，反正不能少，地址一般是~/.aspera/connect/etc中的asperaweb_id_dsa.openssh文件
-l 设置最大传输速度，一般200m到500m，如果不设置，反而速度会比较低，可能有个较低的默认值
-k 断点续传，一般设置为值1
-Q 不懂，一般加上它
-P 提供SSH port，一般是33001
--host=string     ftp的host名，NCBI的为ftp-private.ncbi.nlm.nih.gov；EBI的为fasp.sra.ebi.ac.uk。
--user=string     用户名，NCBI的为anonftp，EBI的为era-fasp。
--mode=string     选择模式，上传为 send，下载为 recv。
-QT   禁用进度显示
-L    Creates an error log
-r    recursive copy

##Ensembl下载人类基因组文件：不能用aspera下载,用迅雷下载较快
基因组文件网址如下:下方第一个网址是ensembl官网网址下载,推荐
ftp://ftp.ensembl.org/pub/release-100/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
ftp://ftp.sra.ebi.ac.uk/ensemblorg/pub/release-100/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
ftp://ftp.ebi.ac.uk/ensemblorg/pub/release-100/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz

相关网址：
ftp://ftp.ebi.ac.uk/
ftp://ftp.ensembl.org/pub/
ftp://ftp.sra.ebi.ac.uk
ftp://ftp.ega.ebi.ac.uk/    要密码？
ftp软件链接：主机名：ftp://ftp.ensembl.org    端口：21



--------------------------------------------------------NCBI--------------------------------------------------------------

##NCBi下载sra数据
ascp -QT -l 300M -i -P33001 -i $HOME/.aspera/connect/etc/asperaweb_id_dsa.openssh anonftp@ftp-private.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByRun/sra/ERR/ERR105/ERR105009/ERR105009.sra ./
或
ascp -QT -l 300M -i -P33001 -i $HOME/.aspera/connect/etc/asperaweb_id_dsa.openssh \
  --host=ftp-private.ncbi.nlm.nih.gov --user=anonftp --mode=recv \
  /sra/sra-instant/reads/ByRun/sra/ERR/ERR105/ERR105009/ERR105009.sra ./

其他地址如下：
sra/sra-instant/reads/ByStudy/sra/SRP/SRP018/SRP018998/SRR799575/SRR799575.sra
sra/sra-instant/reads/ByRun/sra/SRR/SRR949/SRR949627/SRR949627.sra 

####下载人类基因组和注释文件：
##下载人类基因组文件(.fa)：
ascp -v -i ~/.aspera/connect/etc/asperaweb_id_dsa.openssh -k 1 -T -l 200m anonftp@ftp.ncbi.nlm.nih.gov:/genomes/all/GCF/000/001/405/GCF_000001405.38_GRCh38.p12/GCF_000001405.38_GRCh38.p12_genomic.fna.gz .
##下载基因组注释文件(.gtf)：
ascp -v -i ~/.aspera/connect/etc/asperaweb_id_dsa.openssh -k 1 -T -l 200m anonftp@ftp.ncbi.nlm.nih.gov:/genomes/all/GCF/000/001/405/GCF_000001405.38_GRCh38.p12/GCF_000001405.38_GRCh38.p12_genomic.gtf.gz .
#相关网址如下：
https://www.ncbi.nlm.nih.gov/projects/faspftp/
https://www.ncbi.nlm.nih.gov/public/
ftp://ftp.ncbi.nlm.nih.gov/
ftp软件链接：主机名：ftp://ftp.ncbi.nlm.nih.gov    端口：21


####下载ncbi三个数据库
# nt库下载
.aspera/connect/bin/ascp -i .aspera/connect/etc/asperaweb_id_dsa.openssh --overwrite=diff -QTr -l6000m anonftp@ftp.ncbi.nlm.nih.gov:blast/db/FASTA/nt.gz ./
# nr库下载
.aspera/connect/bin/ascp -i .aspera/connect/etc/asperaweb_id_dsa.openssh --overwrite=diff -QTr -l6000m anonftp@ftp.ncbi.nlm.nih.gov:blast/db/FASTA/nr.gz ./
# swissprot库下载
.aspera/connect/bin/ascp -i .aspera/connect/etc/asperaweb_id_dsa.openssh --overwrite=diff -QTr -l6000m anonftp@ftp.ncbi.nlm.nih.gov:blast/db/swissprot.tar.gz ./




-----------------------------------------------------------其他--------------------------------------------------------------
genconde下载：ftp://ftp.ebi.ac.uk/pub/databases/gencode/

提供Aspera的数据库：
1、NCBI的Sequence Read Archive (SRA), dbGaP.
2、1000genomes – EBI Aspera site, the NCBI Aspera site
(1)EBI Aspera site：http://www.internationalgenome.org/aspera
(2)NCBI Aspera site：https://www.ncbi.nlm.nih.gov/projects/faspftp/1000genomes/

UCSC       NCBI         ensembl
hg18 =    GRCh36 = ENSEMBL release_52
hg19 =    GRCh37 = ENSEMBL release_59/61/64/68/69/75
hg38 =    GRCh38 = ENSEMBL  release_76/77/78/80/81/82

高速下载方法：
1、aspera
2、axel      axel -n 500 ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR391/SRR391033/SRR391033.fastq.gz
3、迅雷




