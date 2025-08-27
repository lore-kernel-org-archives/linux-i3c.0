Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DD6CA0FED
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Aug 2025 15:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRiv8T2Q6B5rMakL0xPFC7BtjSlw1BNDPVyELBQQd3I=; b=L4RFy0Zb7Yig0I
	QgtQSsDbw8ck0d+xsvNBTwFVijFqEkiBpMmHbOWbpW8Uu/2I6hV/+27tmdI/UjVYNKdpdcLgA3gdv
	cGNEhnoiKe5OUwfsT9DyuOqm2Kh6LC5TYPDUScdJkvUzfN4ai2OJbEY2MqUaqSE7UqfM3nVfXa/Gc
	VJJFzSWxDs8zY3UzVMGhKsZ8lwDwio1ewhcfp4Ssx00AxKF2DVRVcZ8H6EDhCcVZYd03SuRjAssaC
	ty7tH7XO8oZHOyK5gf+sX5U6f9SHts83MSpvr5OvPpIhPAbfBQd+KbDIFq9u93MdYKhp/oKGbFZ9p
	T8GH7pf9KJRL4i4qb8tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIUL-0000000G4kd-2HZZ;
	Wed, 27 Aug 2025 15:55:05 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGZa-0000000Fdzm-0Yxn
	for linux-i3c@lists.infradead.org;
	Wed, 27 Aug 2025 13:52:23 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RDE5oE029675;
	Wed, 27 Aug 2025 09:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=TLxEk
	krlNSdM2GD+Qgsu39aEeaFNmy2H3B/gtkYE/18=; b=qe+MKsQuqhxsYnOHqTk0q
	qGuvf2u4ItGAZpTXd69jSdZ2FX46i4FNvg0uDW4vRfQ2SIj4R2d4uiPfYD8way9A
	3ilxBREK21yBFh+2edeQ1nO2nMKFLCus27HQlnC96MCV77DZmW0iQ5bYwN9hSJoG
	RCBZUXM3zlG3R8xrJUaLnIU6KrRabJGL0zu/LW6Qmyv1j0v0fdrf3oOT6kQ8OJvN
	Em0Ww4DoxLvr8jFonFbGnrAT9bqTceqBcaQ646DGHn01syD2ubH1QP3UqTMe1Dvo
	xfwYQIAiYdb1UXSrDMDdDwfWBIcdzKLv5YykK5bwXp5c/RjxtlUnezURrNvnWPMU
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 48sq8gkggr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 09:52:16 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 57RDqFkH058165
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Aug 2025 09:52:15 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 27 Aug
 2025 09:52:15 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 27 Aug 2025 09:52:15 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.69])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 57RDpw2R006762;
	Wed, 27 Aug 2025 09:52:09 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Wed, 27 Aug 2025 15:51:58 +0200
Subject: [PATCH v9 1/2] dt-bindings: i3c: Add adi-i3c-master
MIME-Version: 1.0
Message-ID: <20250827-adi-i3c-master-v9-1-04413925abe1@analog.com>
References: <20250827-adi-i3c-master-v9-0-04413925abe1@analog.com>
In-Reply-To: <20250827-adi-i3c-master-v9-0-04413925abe1@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <gastmaier@gmail.com>,
        <linux-hardening@vger.kernel.org>,
        Jorge Marques <jorge.marques@analog.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756302718; l=3433;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=Dujc9e62zVFeI4FhqxBAWrZDgKDoIMeNFu4rfRoQRMM=;
 b=RmzP0nmW1rKml3drHvwuuGbYYS/TnYTFf0eydNSPP8Vl2F67v6J93c80ajpQlH7X7VJV84XBG
 gC5/zoGBZzEDo8txj1l9tzPXZ5oNr28VTY6gGeUgWPVLWk7U5pvdXbd
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=XOEwSRhE c=1 sm=1 tr=0 ts=68af0d90 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=wI1k2SEZAAAA:8
 a=XYAwZIGsAAAA:8 a=gAnH3GRIAAAA:8 a=Br2UW1UjAAAA:8 a=cxqr8dddGolBAesk1vsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=6HWbV-4b7c7AdzY24d_u:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-ORIG-GUID: eK8ab3mHSeP0TlanF9kWF50icL4c3PYH
X-Proofpoint-GUID: eK8ab3mHSeP0TlanF9kWF50icL4c3PYH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDIxMiBTYWx0ZWRfX9zgAVSkjyiye
 9r/WD89/OjuM7uvXr/T+Nm2pg8IZivNdxbDLy2nivzFzlE1wvMI++BDufzCO8/7TnZksH+mGleA
 fio7Ji79EPm9H7Qo4+u5KtY9gld7f4Pse1D7FkrU3egUu1D+xO1qeKUHEOYmuWHt9tgV4QORBlA
 p/Nu3re8nrYSTRzeaB+oPZ2Fqm2CssVZiarWanjp9uPFdl8b4MRL/CsEfGhdIMyUxJ7ltzHOnCS
 xVotrp2FAtBmr7D91+hzlDWZDp2lacbKalBpJF6Wad2x8IEfFCR3STeFIEonSPOKF0RdT8DwbLQ
 9S17mbuptW+V0cNKbIlyMt5E92DqP7VFsliRBwTSG8dw2415oKTjzSqNx0b6igFwq/9hrLobM1A
 M2MlRI1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_03,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_065222_188358_442A186A 
X-CRM114-Status: GOOD (  15.42  )
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
b250cm9sbGVyIHNwZWNpZmljYXRpb24uClRoZSBJUCBDb3JlIGlzIHZlcnNpb25lZCBmb2xsb3dp
bmcgU2VtYW50aWMgVmVyc2lvbmluZyAyLjAuMCBhbmQKQURJJ3Mgb3Blbi1zb3VyY2UgSERMIGd1
aWRlbGluZXMgZm9yIGRldmljZXRyZWUgYmluZGluZ3MgYW5kIGRyaXZlcnMuCgpSZXZpZXdlZC1i
eTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KU2lnbmVkLW9mZi1i
eTogSm9yZ2UgTWFycXVlcyA8am9yZ2UubWFycXVlc0BhbmFsb2cuY29tPgotLS0KIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1sICAgIHwgNzIgKysrKysrKysr
KysrKysrKysrKysrKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNSArKwogMiBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1h
c3Rlci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNj
LW1hc3Rlci55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjI0OTg2NzJkMjY1NDg4ODUyNTEyMGM0NGY0ZmI3NGQ1
MDU1MzU4OTEKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwKQEAgLTAsMCArMSw3MiBAQAorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQorJVlBTUwgMS4y
CistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaTNjL2FkaSxpM2MtbWFz
dGVyLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMKKwordGl0bGU6IEFuYWxvZyBEZXZpY2VzIEkzQyBDb250cm9sbGVyCisKK2Rlc2Ny
aXB0aW9uOgorICBGUEdBLWJhc2VkIEkzQyBjb250cm9sbGVyIGRlc2lnbmVkIHRvIGludGVyZmFj
ZSB3aXRoIEkzQyBhbmQgSTJDIHBlcmlwaGVyYWxzLAorICBpbXBsZW1lbnRpbmcgYSBzdWJzZXQg
b2YgdGhlIEkzQy1iYXNpYyBzcGVjaWZpY2F0aW9uLiBUaGUgSVAgY29yZSBpcyB0ZXN0ZWQKKyAg
b24gYXJtLCBtaWNyb2JsYXplLCBhbmQgYXJtNjQgYXJjaGl0ZWN0dXJlcy4KKworICBodHRwczov
L2FuYWxvZ2RldmljZXNpbmMuZ2l0aHViLmlvL2hkbC9saWJyYXJ5L2kzY19jb250cm9sbGVyCisK
K21haW50YWluZXJzOgorICAtIEpvcmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1ZXNAYW5hbG9nLmNv
bT4KKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogYWRpLGkzYy1tYXN0
ZXItdjEKKworICByZWc6CisgICAgbWF4SXRlbXM6IDEKKworICBjbG9ja3M6CisgICAgbWluSXRl
bXM6IDEKKyAgICBpdGVtczoKKyAgICAgIC0gZGVzY3JpcHRpb246IFRoZSBBWEkgaW50ZXJjb25u
ZWN0IGNsb2NrLCBkcml2ZXMgdGhlIHJlZ2lzdGVyIG1hcC4KKyAgICAgIC0gZGVzY3JpcHRpb246
CisgICAgICAgICAgVGhlIHNlY29uZGFyeSBjbG9jaywgZHJpdmVzIHRoZSBpbnRlcm5hbCBsb2dp
YyBhc3luY2hyb25vdXNseSB0byB0aGUKKyAgICAgICAgICByZWdpc3RlciBtYXAuIFRoZSBwcmVz
ZW5jZSBvZiB0aGlzIGVudHJ5IHN0YXRlcyB0aGF0IHRoZSBJUCBDb3JlIHdhcworICAgICAgICAg
IHN5bnRoZXNpemVkIHdpdGggYSBzZWNvbmQgY2xvY2sgaW5wdXQsIGFuZCB0aGUgYWJzZW5jZSBv
ZiB0aGlzIGVudHJ5CisgICAgICAgICAgaW5kaWNhdGVzIGEgdG9wb2xvZ3kgd2hlcmUgYSBzaW5n
bGUgY2xvY2sgaW5wdXQgZHJpdmVzIGFsbCB0aGUKKyAgICAgICAgICBpbnRlcm5hbCBsb2dpYy4K
KworICBjbG9jay1uYW1lczoKKyAgICBtaW5JdGVtczogMQorICAgIGl0ZW1zOgorICAgICAgLSBj
b25zdDogYXhpCisgICAgICAtIGNvbnN0OiBpM2MKKworICBpbnRlcnJ1cHRzOgorICAgIG1heEl0
ZW1zOiAxCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSBjbG9ja3MK
KyAgLSBjbG9jay1uYW1lcworICAtIGludGVycnVwdHMKKworYWxsT2Y6CisgIC0gJHJlZjogaTNj
LnlhbWwjCisKK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0g
fAorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4K
KworICAgIGkzY0A0NGEwMDAwMCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiYWRpLGkzYy1tYXN0
ZXItdjEiOworICAgICAgICByZWcgPSA8MHg0NGEwMDAwMCAweDEwMDA+OworICAgICAgICBpbnRl
cnJ1cHRzID0gPDMgSVJRX1RZUEVfTEVWRUxfSElHSD47CisgICAgICAgIGNsb2NrcyA9IDwmY2xr
YyAxNT4sIDwmY2xrYyAxNT47CisgICAgICAgIGNsb2NrLW5hbWVzID0gImF4aSIsICJpM2MiOwor
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwzPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
CisKKyAgICAgICAgLyogSTNDIGFuZCBJMkMgZGV2aWNlcyAqLworICAgIH07CmRpZmYgLS1naXQg
YS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDM1ZWQ4NDk4YWIxZTliOTJiNGJjZTVk
YjliYjY0MDA0ZDgwZTRiMWEuLmZhYTUwNTM1YjUxNDAzN2RkZjk3MzA5ODc0ZWM2NGFhYzIwMTNj
YjYgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xMTQ1Miw2
ICsxMTQ1MiwxMSBAQCBTOglNYWludGFpbmVkCiBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaTNjL2FzcGVlZCxhc3QyNjAwLWkzYy55YW1sCiBGOglkcml2ZXJzL2kzYy9tYXN0
ZXIvYXN0MjYwMC1pM2MtbWFzdGVyLmMKIAorSTNDIERSSVZFUiBGT1IgQU5BTE9HIERFVklDRVMg
STNDIENPTlRST0xMRVIgSVAKK006CUpvcmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1ZXNAYW5hbG9n
LmNvbT4KK1M6CU1haW50YWluZWQKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbAorCiBJM0MgRFJJVkVSIEZPUiBDQURFTkNFIEkzQyBN
QVNURVIgSVAKIE06CVByemVteXPFgmF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4KIFM6CU1haW50
YWluZWQKCi0tIAoyLjQ5LjAKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWkzYwo=
