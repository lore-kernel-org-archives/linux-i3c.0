Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18822C71157
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Jun 2025 07:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dzed6z3at5JSo9uJPAPknz4tpx5hCR5rIPt+q0HZhsU=; b=g7Nec67n5e9ogS
	jWiCz8md3NcUEApf+VNRdY95F9xSW4gx0aRNrBiL71pjqPvKUiFD2eLy0jii6G9xwaeHroGLPSXrK
	Sy22e2hRyt4NltQMpqcx8RAC7Zt/Lv1AK+XLwFXh5lxcUvWB3G7WRRY7A3zqETj51OYUZDMIjzcAC
	19wN/rLh/GdnaHQt89Tw64ySbA4YCkMD1hbqGFbi+HP/2rc5fmv8FaOWE9T+lCvO6FfXYlRuoTsuF
	1bZMDy02rc/oA0EuBIge/jaJK43gof25LMffSTREdYQQuRcH8QwRuT6RUlhe0WsfoQPxDDEG2KLL4
	waN+O9abzMgpsSboX7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRn2r-00000009H93-3b3o;
	Wed, 18 Jun 2025 07:17:17 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRn2o-00000009H78-1x77
	for linux-i3c@lists.infradead.org;
	Wed, 18 Jun 2025 07:17:16 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I60Bx6001422;
	Wed, 18 Jun 2025 03:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=flUZl
	HXzkcaGwxuDSeXBch5tcaQ56/ZOPOqxwAslb6s=; b=Krra2AO1WcOSQqk+JdUTi
	zjfLxN5Yu1jGnZudTT+OhW/Kzjy6R9GBobepraZvbsijfOdUyf6Ko0n1p8SbwPBl
	YK8RvdJp88XZ2bRodSwAU0Zrr4RKbrSeKdxUKRuCFHYkK5p9IjoEJ9gbpy6p+Bn/
	1wma1XsgoxENcc8lxb0zw5E8A60y3i8thejTvZR8ERxD7Ru1XHj1XayX9AW7zu2A
	p2P+OzwEDXrAqeyWmWJmz6O8dqEaAU5rSme5i83E2Pu23V6C4eiTrdQtEweAlI9q
	H0vGJD8niqj51Mr9MEmmCAenFt3BvNoDD5/3OCUiIe5vHoJgx8R8qXvJHc7UQTcA
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 47bfsqjd12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 03:17:00 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 55I7Gxuo031034
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Jun 2025 03:16:59 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Jun 2025 03:16:59 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Jun 2025 03:16:59 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 18 Jun 2025 03:16:59 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.56] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55I7GkPf027550;
	Wed, 18 Jun 2025 03:16:55 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Wed, 18 Jun 2025 09:16:43 +0200
Subject: [PATCH v3 1/2] dt-bindings: i3c: Add adi-i3c-master
MIME-Version: 1.0
Message-ID: <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
In-Reply-To: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <gastmaier@gmail.com>,
        Jorge Marques
	<jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750231006; l=2735;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=OxcJIOubdThp/od04BP7j+lpLRH0YfmJ04jgzmTq8D8=;
 b=dSthwIDzsuefUtoxI/iqjqyoHhHQdPD0i+Ei7LcNPb7L7BYAfqXDb9BgWwBolYc/Y16NkUV2l
 sF7ixuOzEOUCPW+Lc9zlnzZtcU3BhObMQ+9RtEz3QOAabIMN9vyYKvY
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 0M2dK_CBMR1A6wXZO6ryvxn_EcxdOk9i
X-Proofpoint-GUID: 0M2dK_CBMR1A6wXZO6ryvxn_EcxdOk9i
X-Authority-Analysis: v=2.4 cv=d9L1yQjE c=1 sm=1 tr=0 ts=685267ed cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=wI1k2SEZAAAA:8
 a=gAnH3GRIAAAA:8 a=Br2UW1UjAAAA:8 a=BiVzJI_yISUpa7ZiZSMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=6HWbV-4b7c7AdzY24d_u:22
 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MSBTYWx0ZWRfX+G9qvLTFXheq
 IlHiWIP9qwz6ZmxqeoH/uzHOL3lQQYQnVVrbd1OjkvbGtQLY+boDrpIulb222A7FCRLaNxfC7dI
 BFViPrAeyC/Slle9Dd2obcP2xTwDq8YRFm+SyHJW2U9Oz0a4VS7tV42EDo8Lv8MyNNZUMC1SyCA
 awGWsXtugOa7vD175p466NR1BWjMcSsoQZ+HtwbdpRXTFpqDFqZAVujsGNH+yueJTUexhaOIjLM
 0c+QIjwjYAQ0tqbPJXIOt3olMPopNFpPtTwxCIbrb11cEuShvU6g9SJT/A+A82Nz2zz+tIgwPB+
 Sre0AgNfSKTSvWde0GJ8ROdux9JoIZUTug0Bz50lxID+U7ekgggki5ru8pDS+Hycrb9ElA1lmh4
 enUUxfd7L87T8aWem20Pi1TPF511MBXfEy/RdHetjHCOz/4Zw24FGOv641CU/hqJHrlDJJHw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 mlxlogscore=921 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_001714_508883_6294044E 
X-CRM114-Status: GOOD (  14.91  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

QWRkIGJpbmRpbmdzIGRvYyBmb3IgQURJIEkzQyBDb250cm9sbGVyIElQIGNvcmUsIGEgRlBHQSBz
eW50aGVzaXphYmxlIElQCmNvcmUgdGhhdCBpbXBsZW1lbnRzIHRoZSBNSVBJIEkzQyBCYXNpYyBj
b250cm9sbGVyIHNwZWNpZmljYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKb3JnZSBNYXJxdWVzIDxq
b3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaTNj
L2FkaSxpM2MtbWFzdGVyLnlhbWwgICAgfCA2MyArKysrKysrKysrKysrKysrKysrKysrCiBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrCiAy
IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMC4uNzE4NzMzYmJiNDUwYzM0YzVkNDkyNDA1MGNjNmY4NWQ4YTgwZmU0YgotLS0gL2Rldi9u
dWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1t
YXN0ZXIueWFtbApAQCAtMCwwICsxLDYzIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbCMKKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTog
QW5hbG9nIERldmljZXMgSTNDIENvbnRyb2xsZXIKKworZGVzY3JpcHRpb246IHwKKyAgRlBHQS1i
YXNlZCBJM0MgY29udHJvbGxlciBkZXNpZ25lZCB0byBpbnRlcmZhY2Ugd2l0aCBJM0MgYW5kIEky
QyBwZXJpcGhlcmFscywKKyAgaW1wbGVtZW50aW5nIGEgc3Vic2V0IG9mIHRoZSBJM0MtYmFzaWMg
c3BlY2lmaWNhdGlvbi4KKworICBodHRwczovL2FuYWxvZ2RldmljZXNpbmMuZ2l0aHViLmlvL2hk
bC9saWJyYXJ5L2kzY19jb250cm9sbGVyCisKK21haW50YWluZXJzOgorICAtIEpvcmdlIE1hcnF1
ZXMgPGpvcmdlLm1hcnF1ZXNAYW5hbG9nLmNvbT4KKworcHJvcGVydGllczoKKyAgY29tcGF0aWJs
ZToKKyAgICBjb25zdDogYWRpLGkzYy1tYXN0ZXItMS4wMC5hCisKKyAgcmVnOgorICAgIG1heEl0
ZW1zOiAxCisKKyAgY2xvY2tzOgorICAgIG1pbkl0ZW1zOiAxCisgICAgaXRlbXM6CisgICAgICAt
IGRlc2NyaXB0aW9uOiBUaGUgQVhJIGludGVyY29ubmVjdCBjbG9jay4KKyAgICAgIC0gZGVzY3Jp
cHRpb246IFRoZSBJM0MgY29udHJvbGxlciBjbG9jay4KKworICBjbG9jay1uYW1lczoKKyAgICBp
dGVtczoKKyAgICAgIC0gY29uc3Q6IGF4aQorICAgICAgLSBjb25zdDogaTNjCisKKyAgaW50ZXJy
dXB0czoKKyAgICBtYXhJdGVtczogMQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0g
cmVnCisgIC0gY2xvY2tzCisgIC0gY2xvY2stbmFtZXMKKyAgLSBpbnRlcnJ1cHRzCisKK2FsbE9m
OgorICAtICRyZWY6IGkzYy55YW1sIworCit1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisK
K2V4YW1wbGVzOgorICAtIHwKKyAgICBpM2NANDRhMDAwMDAgeworICAgICAgICBjb21wYXRpYmxl
ID0gImFkaSxpM2MtbWFzdGVyIjsKKyAgICAgICAgcmVnID0gPDB4NDRhMDAwMDAgMHgxMDAwPjsK
KyAgICAgICAgaW50ZXJydXB0cyA9IDwwIDU2IDQ+OworICAgICAgICBjbG9ja3MgPSA8JmNsa2Mg
MTU+LCA8JmNsa2MgMTU+OworICAgICAgICBjbG9jay1uYW1lcyA9ICJheGkiLCAiaTNjIjsKKyAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mz47CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owor
CisgICAgICAgIC8qIEkzQyBhbmQgSTJDIGRldmljZXMgKi8KKyAgICB9OwpkaWZmIC0tZ2l0IGEv
TUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA5NmI4MjcwNDk1MDE4NGJkNzE2MjNmZjQx
ZmM0ZGYzMWU0YzdmZTg3Li42ZjU2ZTE3ZGNlY2Y5MDJjNjgxMjgyN2MxZWMzZTA2N2M2NWU5ODk0
IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTEyNDMsNiAr
MTEyNDMsMTEgQEAgUzoJTWFpbnRhaW5lZAogRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2kzYy9hc3BlZWQsYXN0MjYwMC1pM2MueWFtbAogRjoJZHJpdmVycy9pM2MvbWFzdGVy
L2FzdDI2MDAtaTNjLW1hc3Rlci5jCiAKK0kzQyBEUklWRVIgRk9SIEFOQUxPRyBERVZJQ0VTIEkz
QyBDT05UUk9MTEVSIElQCitNOglKb3JnZSBNYXJxdWVzIDxqb3JnZS5tYXJxdWVzQGFuYWxvZy5j
b20+CitTOglNYWludGFpbmVkCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwKKwogSTNDIERSSVZFUiBGT1IgQ0FERU5DRSBJM0MgTUFT
VEVSIElQCiBNOglQcnplbXlzxYJhdyBHYWogPHBnYWpAY2FkZW5jZS5jb20+CiBTOglNYWludGFp
bmVkCgotLSAKMi40OS4wCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1pM2MK
