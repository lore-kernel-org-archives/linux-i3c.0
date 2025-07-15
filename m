Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91006C83F2D
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Jul 2025 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++S0vJxWrT0LbXv3SCmmAtZLyMX0TgBi8u9UDFdtYkM=; b=4AemKJdRV573AD
	sagkLUWATL7U5vOuYjAnJPz6CqhfTToFRU/5hUHmhcbpnkfge+gxPqzIgBf4MJWs5iSEJLVP7R1c2
	VCtoW1T3+Chv8IGH8KmcE3+s6kwZfY3fQaXr1iCch/nZFdoOCc+TRHT2q/fbCSAsb0uX6AyxZhNBE
	AsOwPfdpi2+D22hH1sQxWz2+2glIzLGeDaR3XmUZBWQzYIRMH32osQrKAbJMbJDmyZ5r8l56LwuM2
	8A4bBtcuNOgdchEpv8bvmDxxVr7DTBxj9h+QAnDen9M3gffT8WcgcC0tpscsIRjd9ILDfDin1X6pb
	3glFC3C8JwKmPuykq77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubc8o-00000004ifp-1KK2;
	Tue, 15 Jul 2025 09:40:02 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbT5-00000004axi-0V2B
	for linux-i3c@lists.infradead.org;
	Tue, 15 Jul 2025 08:56:56 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F7HBv0021930;
	Tue, 15 Jul 2025 04:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ubRYq
	BIjCj3mZbT9HxemmEuCm6A1jj1svN9C6SKA9QA=; b=Cq4PjwR+9/RQDYxDXHXZC
	7ysfEB6cvjlPvq5BTbOXJE47AAtx+EcgIn7iygtChvWMY1LbeSs8ClaosxR6SVHp
	3P/tBqy/yO9/5DXvl5T2yHq9AhtwdL5DBMPbIlt23d1GGaob6ejpU2LVXxwQC/6z
	X0Wv3OVEOuvwp1hShW9tJX/kLoUpHInVUp+B620J8jblLoyNcyhUVlomqarwLUNF
	6QMcv4tE4PZ05UfWWbNp6S8D6x5/QvJwCGsQM3436pj8RFQl5PwlK5P9Ze1USCCF
	XjOQ3XEhTGGi/JHsFB7YGfsf087SPEn6Q7wFY/Ck/LfX1/YOpXhe9GTqliYe49Nk
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47uq0ccecp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 04:56:42 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 56F8ufel062538
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Jul 2025 04:56:41 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 15 Jul 2025 04:56:41 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 15 Jul 2025 04:56:41 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 15 Jul 2025 04:56:41 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.81])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 56F8uRA5019186;
	Tue, 15 Jul 2025 04:56:37 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Tue, 15 Jul 2025 10:56:03 +0200
Subject: [PATCH v5 1/2] dt-bindings: i3c: Add adi-i3c-master
MIME-Version: 1.0
Message-ID: <20250715-adi-i3c-master-v5-1-c89434cbaf5e@analog.com>
References: <20250715-adi-i3c-master-v5-0-c89434cbaf5e@analog.com>
In-Reply-To: <20250715-adi-i3c-master-v5-0-c89434cbaf5e@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752569787; l=2966;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=hos6iVk11QyXI+zX7kx2DTvqzJd8iugClhi7esuRW5c=;
 b=4cCLBSVuE6YbUTTcJZfcVVvQ1HRFEvsne2s01vvu9eenPfjjX5/2MMclusjE/A6iqya+NBnfP
 6f269oC5J3eBniBPBm1VD5n5s2Deau2Hm1Oy6yWII6a3jBI2LdgPMK5
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA4MCBTYWx0ZWRfX3cKHhppdFAgb
 5D8oMdaL1zADYGu5Bh37+wEsbHasJ6MIL3JBsDTAfp77a2ho1ZVhFrwwCLi2otqM3AaUXtBWNv/
 R5oYdnc/akkiK/SRZJqDS8DTqY7fIanejikZraVWslz8B8Urd9ootHsTl9JE9lbEUTWZrIUt/DX
 FEjnOCHWWZJG/n8KtFn7Qk2M5UI0tKbi5gM8zBP8afeYl+HSPm7JCoNf5OliWSs7kZnhD3dBu60
 CuQW65zpi1ERkaPZFUF4MeoudZaJDLPOouyMqpkxxQpq0QhSwtGRxizNwZjajo6GF0bWW4FdOv9
 Ostfk72sHjI8w5J/V+B2upordvi8h9x7bDVxzpWa/TIpuPZhemZ6vRJ5YJJI3Jc/j86gDhRXEps
 mGeKUKBwahBrgk2bva37Fw1QXU2zuCRYkbqkPAvX1U04GXvhAv3NT+CjodzrBDyGA18nrAB7
X-Authority-Analysis: v=2.4 cv=MohS63ae c=1 sm=1 tr=0 ts=687617ca cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=wI1k2SEZAAAA:8
 a=gAnH3GRIAAAA:8 a=Br2UW1UjAAAA:8 a=Q2ZsWLbW85TiznQkgggA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=6HWbV-4b7c7AdzY24d_u:22
 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-GUID: CtmzXqIjPMtc-VHzcipkRrLjbSi_8jUm
X-Proofpoint-ORIG-GUID: CtmzXqIjPMtc-VHzcipkRrLjbSi_8jUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=860
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_015655_162382_D2ED5091 
X-CRM114-Status: GOOD (  14.30  )
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
L2FkaSxpM2MtbWFzdGVyLnlhbWwgICAgfCA2NyArKysrKysrKysrKysrKysrKysrKysrCiBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrCiAy
IGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMC4uOGY1MzIzODZkZTJjMDVkM2Q1MTRkNDFmZjRkNmEzN2VjODQwNjc0YwotLS0gL2Rldi9u
dWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1t
YXN0ZXIueWFtbApAQCAtMCwwICsxLDY3IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbCMKKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTog
QW5hbG9nIERldmljZXMgSTNDIENvbnRyb2xsZXIKKworZGVzY3JpcHRpb246IHwKKyAgRlBHQS1i
YXNlZCBJM0MgY29udHJvbGxlciBkZXNpZ25lZCB0byBpbnRlcmZhY2Ugd2l0aCBJM0MgYW5kIEky
QyBwZXJpcGhlcmFscywKKyAgaW1wbGVtZW50aW5nIGEgc3Vic2V0IG9mIHRoZSBJM0MtYmFzaWMg
c3BlY2lmaWNhdGlvbi4gVGhlIElQIGNvcmUgaXMgdGVzdGVkCisgIG9uIGFybSwgbWljcm9ibGF6
ZSwgYW5kIGFybTY0IGFyY2hpdGVjdHVyZXMuCisKKyAgaHR0cHM6Ly9hbmFsb2dkZXZpY2VzaW5j
LmdpdGh1Yi5pby9oZGwvbGlicmFyeS9pM2NfY29udHJvbGxlcgorCittYWludGFpbmVyczoKKyAg
LSBKb3JnZSBNYXJxdWVzIDxqb3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+CisKK3Byb3BlcnRpZXM6
CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IGFkaSxpM2MtbWFzdGVyLXYxCisKKyAgcmVnOgor
ICAgIG1heEl0ZW1zOiAxCisKKyAgY2xvY2tzOgorICAgIG1pbkl0ZW1zOiAxCisgICAgaXRlbXM6
CisgICAgICAtIGRlc2NyaXB0aW9uOiBUaGUgQVhJIGludGVyY29ubmVjdCBjbG9jaywgZHJpdmVz
IHRoZSByZWdpc3RlciBtYXAuCisgICAgICAtIGRlc2NyaXB0aW9uOiBUaGUgSTNDIGNvbnRyb2xs
ZXIgY2xvY2suIEFYSSBjbG9jayBkcml2ZXMgYWxsIGxvZ2ljIGlmIG5vdCBwcm92aWRlZC4KKwor
ICBjbG9jay1uYW1lczoKKyAgICBtaW5JdGVtczogMQorICAgIGl0ZW1zOgorICAgICAgLSBjb25z
dDogYXhpCisgICAgICAtIGNvbnN0OiBpM2MKKworICBpbnRlcnJ1cHRzOgorICAgIG1heEl0ZW1z
OiAxCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSBjbG9ja3MKKyAg
LSBjbG9jay1uYW1lcworICAtIGludGVycnVwdHMKKworYWxsT2Y6CisgIC0gJHJlZjogaTNjLnlh
bWwjCisKK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAor
ICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KKwor
ICAgIGkzY0A0NGEwMDAwMCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiYWRpLGkzYy1tYXN0ZXIt
djEiOworICAgICAgICByZWcgPSA8MHg0NGEwMDAwMCAweDEwMDA+OworICAgICAgICBpbnRlcnJ1
cHRzID0gPDMgSVJRX1RZUEVfTEVWRUxfSElHSD47CisgICAgICAgIGNsb2NrcyA9IDwmY2xrYyAx
NT4sIDwmY2xrYyAxNT47CisgICAgICAgIGNsb2NrLW5hbWVzID0gImF4aSIsICJpM2MiOworICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwzPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisK
KyAgICAgICAgLyogSTNDIGFuZCBJMkMgZGV2aWNlcyAqLworICAgIH07CmRpZmYgLS1naXQgYS9N
QUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGQ1YTE3M2U5ODdjMDZkNzU4NDhkMTEyMzM5
ZTM5OTY2ZjJiNzFjZWEuLjFmMjEyNTI5Mjc2ZjRhYjI4ZjRiN2QxNmI0MTA1YThjZjlmZjVlMmUg
MTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xMTQ1Miw2ICsx
MTQ1MiwxMSBAQCBTOglNYWludGFpbmVkCiBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaTNjL2FzcGVlZCxhc3QyNjAwLWkzYy55YW1sCiBGOglkcml2ZXJzL2kzYy9tYXN0ZXIv
YXN0MjYwMC1pM2MtbWFzdGVyLmMKIAorSTNDIERSSVZFUiBGT1IgQU5BTE9HIERFVklDRVMgSTND
IENPTlRST0xMRVIgSVAKK006CUpvcmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1ZXNAYW5hbG9nLmNv
bT4KK1M6CU1haW50YWluZWQKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
M2MvYWRpLGkzYy1tYXN0ZXIueWFtbAorCiBJM0MgRFJJVkVSIEZPUiBDQURFTkNFIEkzQyBNQVNU
RVIgSVAKIE06CVByemVteXPFgmF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4KIFM6CU1haW50YWlu
ZWQKCi0tIAoyLjQ5LjAKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWkzYwo=
