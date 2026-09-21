Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAD6C982EE
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Sep 2026 20:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgQJzBwC3D8zvLQw9bL7EXodnYwWql1XQwTUcG399So=; b=tMRXAu7bIwqZyG
	mQRLYa4WV1hkI0b6trrlPqFzt7H9RttKbZOPEibocs/gFuuggFyigYuzqP7cZA9Hx21uS+tbjnIdz
	rCQ3Iq/0eYEECvVfO3LYBgMzjlK1zX/SK3jrV3X6GjIuxqwUO5rj/5PqxGA3vulbpPTzFDwx5fUP3
	EL2+jpZ3f6aW1QEJ7cwaRpY7nb9Jfs5qlxxh+wTvzaPglo6GKTszvYeTU9nMmhW/3V9HwOPkpTiwG
	XnS0hSdWXWE+3xB4AFcTbN8YqKgpu7aGEGeW782c9UEkeTZcGCVESYMOc8ytWCLw4R47RnhnvePKV
	8fze1Nyncqsl77JBaOiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kfQ-00000003LSy-2ubF;
	Mon, 21 Sep 2026 20:31:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kfO-00000003LSN-1D0N
	for linux-i3c@lists.infradead.org;
	Mon, 21 Sep 2026 20:31:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LJnlNi2050701
	for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 20:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/CXT2/U+CRIw/4TV1GykFykopBE/d4y1YwwzQgX0jw=; b=BLssMX+fya6Qb+r2
	qOR3FAbpv7hF1J5bOOV/WTEfUk0LBwwTMDDx9/nqyimDBSP/HMMuTjLuSMCeatIJ
	UNv3mNnYhH42bSOTGv9fMjtzrH3S5NtdRViKSA+UK6Vrh4ibTypEgmKSlL/svvAN
	6eiZ4G9dJ9WgUA+1UJODKrqqpZhxDhRXaJsVDKGerLa3ocxPqING4NT9C3CZwo/f
	qfew/EkyV7OjhOr30gpRwISh2LW4ZkaLD/Amnebr869azBQcyVFePydiWzjYHXB0
	TvCZZ319C04oPRM9szIHcNf+E418RXOdF7Wkxe2ohWb56T84+GYrv6HHMbeR+oO2
	cd5zSQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gub3284pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 20:31:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc52c77089bso4994116a12.3
        for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 13:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790022668; x=1790627468; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/CXT2/U+CRIw/4TV1GykFykopBE/d4y1YwwzQgX0jw=;
        b=HZa3UXim/mk6a6HD1yYk46jxSAAROJ8gK0Ixgp2ffs+A10Ew4p3QAnOkQKy7KyhtzE
         zfIhHwTiRnppJkcE/m40qA9JkWAFIkNW6SWQl6o3lmyJ22+ESy7Iv40VxD99bj6c8RUG
         q8gMilJM11knLj/Vu8elkLvji8B3N27C/zMxzPxJCZmuQtLodabZlQIxRpRbriC18mc/
         wU9FC6xiUYS5QcDmGvCn3GXC+eXLICGQ2lT+bxDLUYb96C/kxoeh25Vcf8BPF5bzBWkK
         uFNX5xmQbJsj102FW9thkk6Sku395r4vGb9IBSfLzN4gabiuM8lD+X06voTKkPqoDOuV
         IRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022668; x=1790627468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/CXT2/U+CRIw/4TV1GykFykopBE/d4y1YwwzQgX0jw=;
        b=zzAubCZ8LJHQZwokuu4whUIg6jcBTSXLkn9xwtYyTtNd3Pgzu8uVoKrCGKKujpcJFu
         jI+h7Oey/1R8UenWecn1MJBKRWtHtdkumgXvaja9XyouMgXvcktPe52715cB5+vAC50V
         x+d0JI2Y54Nj26BNPAnqq5ZZJ9I4GpxnX61D5e0zMvQJDB8ZBdzCPs40XO7UAxRmN+Ya
         /Wmjva3AOBNBpeBioZdU4yFPaBZtcsVGdeY/+I8AFnvwrLz9KN/g+eusz/0DAVECYq2w
         aaA150/HzqpzCtq7KI6FjZVaBQoJJgrCfOftmdz1IUgmixdVQE/penEbaYn6O8Wq39RZ
         2Kag==
X-Forwarded-Encrypted: i=1; AKwUvByDQ8H4Q8koJW9D4X1KNdojwRXiEi/dg+O2/RzNWoxGGMlA5STIuLuEU8pZB3qJ/Rf4MU28XAJwfkg=@lists.infradead.org
X-Gm-Message-State: AFuF++lEi3k5tJ+iT0ox14LR9jjgCtfwgvjfENSGGXxEYjoP2BL5pRuH
	sSZl2fOEbH70HnhpbCs1lAsVRaqOI25oNM659HqVvBH527y9WIUSIpeD1DRzjR2SzFIylrq+89w
	aW0kR7895TKNoh7Vi5pXpshSJA6+Mxz1I4zVPISyvnl34lDSjVByxf3p3+3Nvy5vWXO6i
X-Gm-Gg: AYBFou3kcsFtEQJxjQqBCdFE/ZeOO90uqSv12chB0/wIMzTyQBkp5bwL1828RmiXLc9
	Us80dI8PJHfjP2y2ke0UndU8nZ65MWQbztfOJfz+8E6OZ4KfB0KVSDOR/4mjOVjifkXwoobw4Vo
	KhqoJZ9ZwVyZwmuALPiYGsD+cB7OAQDrTT+fIfK/a57LNyIMErLqyj8NfM1nd+ECMuDBzcEiZ1c
	TrHTyPlekxmSBkTFXyVDFtvITQwJB0h3Uzw0vQF83zJStbU7RdjOEz1qPI1hTbP9rJO8lxU2zYm
	vla9w1FPAiYABVLZ1pNitbxStljXwsyw2NixFGC0RB1GVdY/HTbUIJu6T2Y3Jzq1Grak8toGUxt
	Xkv2zFgJo8s+6wFnbcX/pJ/TkQSuY1s65Qw==
X-Received: by 2002:a05:6300:4049:b0:3da:c10c:6aa6 with SMTP id adf61e73a8af0-3dd8c2dc837mr20393374637.1.1790022667452;
        Mon, 21 Sep 2026 13:31:07 -0700 (PDT)
X-Received: by 2002:a05:6300:4049:b0:3da:c10c:6aa6 with SMTP id adf61e73a8af0-3dd8c2dc837mr20393344637.1.1790022667022;
        Mon, 21 Sep 2026 13:31:07 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f0c96f8bsm172225c88.11.2026.09.21.13.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:31:06 -0700 (PDT)
Message-ID: <ea53d79c-4aa9-4e98-b829-cdf6f43cab66@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 02:01:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, alexandre.belloni@bootlin.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Frank.Li@nxp.com,
        wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
 <0f77f41d-589f-48da-a013-48f48f1dbbff@kernel.org>
 <b7d120c8-1215-4923-8810-83cc0d7cdc36@quicinc.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <b7d120c8-1215-4923-8810-83cc0d7cdc36@quicinc.com>
X-Authority-Analysis: v=2.4 cv=B8ssQ+tM c=1 sm=1 tr=0 ts=6ab1940d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=jzypiudHYq9u_h9wWJAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5chutPpr-jvhNygPFN85KnwlQBAWwzWh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMwMCBTYWx0ZWRfX9tPg/WK8azhA
 WYSHKmShCaFWmqfmrUL9XM14TUDlk5U+Hc2Rt8kDRAXYG4L1GjJaDhwzP+pDnqRsaTRkZ12OQ/n
 KvqhkVe39F0Go4WPd4s7wN1l13CbAGcYoSPELNWynD6TLycOx7j+m78Z9KbXZGBdfao/2xxpgcW
 NM+AdKwC7aHTiFHqhXR6j6+PHcbJ7UL0oxzRKBR5BHgWrergHACY/hn62bQLEq09w/bRfwCYlHK
 DAIZ+fl3aSDAOOxtsrFE7SsSEdROj9M1RNwkPu7VQ1QEpAxMkTa9FCsWMsH+mezB3t6FbdIpXdd
 oTM6iGnXjS2qOC2gp64J+jHFztp18xcKUZqrMSp78NwGzt1vI2Pj2+iyI4wWJI6cHO3l0QnQHCQ
 dnlVys79VS8OqbKX7bleG3yzAFmWUIomwl8b/WLcpR1mqEyiaSto2JvgX2YF5Ly8AIQ2EsHqex5
 CSVEWkR26kvecKt73zA==
X-Proofpoint-GUID: 5chutPpr-jvhNygPFN85KnwlQBAWwzWh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMwMCBTYWx0ZWRfX6lLjcEiYw9Uy
 pdxv/v1FOKKVuXnNMAqMke024XOEY3Dbwi2qh6wzkhXFegB/z+soSDwxTIbb8WZb2HmNL4Ck/hn
 eZ6h2uatXLnkBMBcHFrGW09ixjJmph8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_133110_444580_A7C943A8 
X-CRM114-Status: GOOD (  17.26  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgS3J6eXN6dG9mICwgQXBvbG9naWVzIGZvciB0aGUgZGVsYXllZCByZXNwb25zZS4gSSB3YXMg
d2FpdGluZyB0byAKdmVyaWZ5IHRoZSBjaGFuZ2VzIGFuZCBlbnN1cmUgYWxsIHRoZSBzdWdnZXN0
ZWQgdXBkYXRlcyB3ZXJlIHByb3Blcmx5IAppbmNvcnBvcmF0ZWQuIFRoZSBlZmZvcnQgd2FzIGZ1
cnRoZXIgZGVsYXllZCBkdWUgdG8gc29tZSBzbGF2ZS1zaWRlIApzZXR1cCBpc3N1ZXMuCgpTaW5j
ZSwgSSBtaWdyYXRlZCBmcm9tIG15IEBxdWljaW5jLmNvbSBlbWFpbCBhZGRyZXNzIHRvIApAb3Nz
LnF1YWxjb21tLmNvbSBhbmQgY291bGQgbm90IGxvY2F0ZSB0aGUgb3JpZ2luYWwgZW1haWwgdGhy
ZWFkLiBUaGUgCnJlcGxpZXMgYmVsb3cgYXJlIGZyb20gYSBkcmFmdCBJIGhhZCBzYXZlZCBlYXJs
aWVyLgoKSSBoYXZlIG5vdyBhZGRyZXNzZWQgYW5kIHZhbGlkYXRlZCBhbGwgdGhlIHN1Z2dlc3Rl
ZCBjaGFuZ2VzIGV4Y2VwdCBvbmUsIAp3aGljaCBJIGhhdmUgcmVzcG9uZGVkIHRvIHNlcGFyYXRl
bHkgYmVsb3cuICBJIHNoYWxsIHVwbG9hZCBWNyBjbGVhbmx5IHNvb24uCj4gT24gNy8xLzIwMjUg
MjowMyBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMDEvMDcvMjAyNSAwOTox
OCwgTXVrZXNoIEt1bWFyIFNhdmFsaXlhIHdyb3RlOgo+Pj4gQWRkIGRldmljZSB0cmVlIGJpbmRp
bmdzIGZvciB0aGUgUXVhbGNvbW0gSTNDIGNvbnRyb2xsZXIuIFRoaXMgaW5jbHVkZXMKPj4+IHRo
ZSBuZWNlc3NhcnkgZG9jdW1lbnRhdGlvbiBhbmQgcHJvcGVydGllcyByZXF1aXJlZCB0byBkZXNj
cmliZSB0aGUKPj4+IGhhcmR3YXJlIGluIHRoZSBkZXZpY2UgdHJlZS4KPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBNdWtlc2ggS3VtYXIgU2F2YWxpeWEgPG11a2VzaC5zYXZhbGl5YUBvc3MucXVhbGNv
bW0uY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5v
cmc+Cj4+PiAtLS0KPj4+IMKgIC4uLi9iaW5kaW5ncy9pM2MvcWNvbSxnZW5pLWkzYy55YW1swqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCA1OSArKysrKysrKysrKysrKysrKysrCj4+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKQo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvcWNvbSxnZW5pLSAKPj4+IGkzYy55YW1s
Cj4+Pgo+Pgo+PiBJdCdzIHY2LCB5b3UgcmVhbGx5IHNob3VsZCBoYXZlIHN0YXJ0ZWQgdGVzdGlu
ZyB5b3VyIGNoYW5nZXMgYnkgdGhhdAo+PiB0aW1lLiA6Lwo+PgoKeWVzLCBjbG9jay1uYW1lcyAt
IEdvdCBhZGRlZCBieSBtaXN0YWtlIHdoaWxlIHVwbG9hZGluZywgd2lsbCByZW1vdmUgaXQKaW4g
bmV4dCBwYXRjaC4gV2lsbCBydW4gYm90aCBkdGJzX2NoZWNrIGFuZCBkdF9iaW5kaW5nX2NoZWNr
IGJlZm9yZSBuZXh0IAogIHBhdGNoLgoKCj4+IE5vdGhpbmcgaW4gdGhlIGNoYW5nZWxvZyBleHBs
YWlucyB0aGUgY2hhbmdlIG1hZGUgaGVyZSwgc28geW91IGp1c3QKPj4gc25lYWtlZCBzb21ldGhp
bmcgd2hpY2ggZGlkIG5vdCB3b3JrLgo+PgoKSSBkaWRuJ3QgbWFkZSBhbnkgY2hhbmdlIGludG8g
dGhpcyBiaW5kaW5nIGZpbGUuIEkgd291bGQgaGF2ZSBhZGRlZCBpbgpjaGFuZ2UgbG9nIFY1IHRv
IFY2IGlmIHRoZXJlIHdhcyBhbnkgY2hhbmdlIGluIHRoaXMgeWFtbCBmaWxlLgoKSWYgeW91IGZp
bmQgYW55dGhpbmcgZWxzZSBnZXR0aW5nIGFkZGVkLCBleGNlcHQgImNsb2NrLW5hbWVzIiwgcGxl
YXNlCmxldCBtZSBrbm93LgoKPiAKPj4gQmVzdCByZWdhcmRzLAo+PiBLcnp5c3p0b2YKPj4KPiAK
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
