Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6711ED60CEF
	for <linux-i3c@archiver.kernel.org>; Tue, 19 Nov 2024 04:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/d+r2IyD7MOnkG8/gtoBW5kazdPsm4cwKyt2qwtHRE=; b=AAHCuNqpL/eiRTYraqCZdpn6y0
	3nYBhcINK/zh2mASO6kvS/GJ3wsfWT/um8QFX6kyEQYWnRHgchDLJiutGoYznEvsgFtisUbwVM1a4
	frE758fz+8GCAcJSvNfdtDLGliPcj5+5RLIBqpdu/vDlYKX9Fymm1CKI8bwr4Z8cI+DKgnrRb6NC3
	OEn1gIhapspKgV6Wb0kja/TsgB9rd4cF1dCHXXkS0Tc4lsfydFBj1qXjd7RB7kZYbIShp3HZwkFdK
	PW4yeI7CqqoxlZNfrvht+hSpXuBnSNsjVaCR9LWFAWA+DDOvhDRRhNBgiVYk3yWtPz9MVPRah597y
	fj2n7+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDG4a-0000000BNOJ-0NbN;
	Tue, 19 Nov 2024 04:42:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDG4X-0000000BNNg-1qyk
	for linux-i3c@lists.infradead.org;
	Tue, 19 Nov 2024 04:42:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGH9kG027204;
	Tue, 19 Nov 2024 04:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eh8Y9L9V3iFNVFUpFkbt3+kz6wiJz27MP+CjT5/hXfI=; b=AzjtzrjjcNdIYnYr
	txOTnUgdoOonT9LBhGegNausm295RgKWFVknNWrCzQsvK5JWYyeKKYNtlz5lmRQr
	NsNdCvllQvNFqnT12UBDYMksgMlb8Dke2dGndC7SH2Yiz8rDoh0DJmXwn7TNyp13
	NJzRe2FqKmn3u60CUbaLFjlfAm2pa4wx2T9CHlYLK1UZ6Q/blB8KidAA9NafrPL9
	D4b6VfDwtXFphoDnMTy/4Ex+puMQnbT/ZLj/x0xE3/saPUxzYeAqDQgWgQ0eZEXZ
	bvNQFyP8yVVV592y3aJWeyDRg90HYHhyIWz492fuknBjsseAzkvl1lQwQx2jubRn
	92lfNQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7seqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 04:42:38 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ4gHhC027528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 04:42:17 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 20:42:05 -0800
Message-ID: <05803e88-f66d-4cc9-8737-e3b49790b85b@quicinc.com>
Date: Tue, 19 Nov 2024 10:12:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Looking for USB<->I3C adapter
To: Guenter Roeck <linux@roeck-us.net>, <linux-i3c@lists.infradead.org>
References: <d2e42b5f-7108-4752-b16b-3a8ff7c22079@roeck-us.net>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <d2e42b5f-7108-4752-b16b-3a8ff7c22079@roeck-us.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qfYqPbJNekFYKO6GPHdD9gUyB4tNFN2f
X-Proofpoint-GUID: qfYqPbJNekFYKO6GPHdD9gUyB4tNFN2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=964 clxscore=1011 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411190037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_204241_597860_3CA37C17 
X-CRM114-Status: GOOD (  10.84  )
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

CgpPbiAxMS85LzIwMjQgOTo0MiBQTSwgR3VlbnRlciBSb2VjayB3cm90ZToKPiBIaSBhbGwsCj4g
Cj4gSSBhbSBsb29raW5nIGZvciBhbiBhZGFwdGVyIHdoaWNoIHdvdWxkIGxldCBtZSB0ZXN0IEkz
QyBkcml2ZXJzIGZvciBMaW51eC4KPiBGb3IgSTJDLCBJIHVzZSB0aGUgRGV2YW50ZWNoIFVTQi1J
U1MgYWRhcHRlci7CoCBUaGUgb25seSBwcm9kdWN0IEkgZm91bmQKPiBzbyBmYXIgZm9yIEkzQyBp
cyB0aGUgQmluaG8gU3VwZXJub3ZhIEhvc3QgQWRhcHRlciBjb21iaW5lZCB3aXRoIHRoZWlyIEkz
Qwo+IHRhcmdldCBib2FyZCwgYnV0IHRoYXQgaGFzIGEgcHJpY2UgdGFnIG9mIGFsbW9zdCAkMSw2
MDAgdG9nZXRoZXIuIFRoYXQKPiBpcyBhIGJpdCBvdXQgb2YgcmVhY2ggZm9yIG1lLgo+IAo+IElz
IGFueW9uZSBhd2FyZSBvZiBhbiBVU0ItSTNDIGFkYXB0ZXIgd2l0aCBhIGRlY2VudCBwcmljZSBw
b2ludCA/Ck1heSB0YWtlIGEgbG9vayBpZiB0aGlzIGhlbHBzIHlvdSAtIApodHRwczovL2dpdGh1
Yi5jb20veHlwaHJvL0kzQ0JsYXN0ZXIvdHJlZS9tYWluP3RhYj1yZWFkbWUtb3YtZmlsZQo+IAo+
IFRoYW5rcywKPiBHdWVudGVyCj4gCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
