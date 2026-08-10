Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C661CC5B567
	for <linux-i3c@archiver.kernel.org>; Mon, 10 Aug 2026 18:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOAbGNXOjvKei8FjxEevtl8EiK5fCEqch/78b1qPrdQ=; b=YAvX+iD/DXaUBw
	PcyYjuMTyMuiGVE/ECVE7ATLRKwQQFtFd9j/JyS2BhneTqoXwqeztQ598ccgU0Y76pZkKH63xuL4f
	GpelD0Wy4QozUpe7QuDqzjH6npP0oal9BS0m22E8QDoqmmR+qe50IXuylLKWbDtOhBunrrCREfaWX
	XMQlxfW6SI738oKXh1G0/kv3A2SSHtPm0yhj8Chj5h3PGpfEb4cojSBGF7u0op563eobTglHN1FJW
	1OPkOC9NHRvnxyZzITpOoyz+eJ2sIuheoJY6z+VWR4Jps1Krd/hnJVa+NoKOFuq+eODaHSKLKi72K
	o5LfP2x2E5URE43WZmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUj8-0000000CdJw-0qWH;
	Mon, 10 Aug 2026 18:27:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUj4-0000000CdJ7-2AC7
	for linux-i3c@lists.infradead.org;
	Mon, 10 Aug 2026 18:27:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AHLChx2279064
	for <linux-i3c@lists.infradead.org>; Mon, 10 Aug 2026 18:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2O8FxR7lrAEjoX7u/9TIYcjqIEX5JTXw9wgl/N7/Nl4=; b=X5BrowNFVBP3pjKV
	Zwqsn3pRgU3LrhXOzmEW8jLf3oglJwORNGyeBG5TlTqpS/tbno4Lm5GzPoqOiLZG
	0LRQwdl9t9iXZ8SQJguRERX9cVMbA5zn6z7wXY/+jm9MJvEbE4JhQNJR1R88TC12
	UmdZr+rDaa4JdhqTSciO+/qumLQA+fLtvPz0tSqhecwPOJhmIYVGuoQB2wdJsm9B
	eKqPvZdvh6UVIiFj8feQJmGaNOSi/9UmTRnTJaY+MpPnYmWvnBV26qDTUbnoUu6x
	ODNJZF4HhZ/t6UXhGTjwrCMLgMaPCws/jcktzcwhtLaRJrR37hjXAcBhj089Accm
	uwdvNQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyf09as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Mon, 10 Aug 2026 18:27:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9c26587e67so194945a12.0
        for <linux-i3c@lists.infradead.org>; Mon, 10 Aug 2026 11:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786386472; x=1786991272; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2O8FxR7lrAEjoX7u/9TIYcjqIEX5JTXw9wgl/N7/Nl4=;
        b=Jldt4kaaWyIBayaS1DxW/Q9Z9NMTTyAoKnVhHTRxekbMgJcT7iiRF/nHB7U534JpK8
         cNAlzIxgtmuJcJVN0VFMPxOH4aObrZpcoH4gzkOtHjbj2gjIelRzL82+v+nV7hwW0Q39
         IUu/f95R124fY3Dvl0EL6mtm4J/oNUz6d6nrTpBQjxxQBGWy6om1KjdnRwNfNtUA1Flt
         FURcNdu1QWdQ4vb/e1VBHCER62ye4fQO+aFpEjuYfZmeAzmSetRqcFMMH7hdOztQVtRu
         7k1fy/ApiJwe0XE4IyDT8ZQJz+JuTpc2agxOvSnOuqDQUSsgkcHciL53tmjk/Aw1bEVG
         gLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786386472; x=1786991272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2O8FxR7lrAEjoX7u/9TIYcjqIEX5JTXw9wgl/N7/Nl4=;
        b=ZbPzuDGwqfhpjsJuGgfXnBUDZVppx4duANyXb5YRxl6eK0TF2tF0aVgYw67u/cZLXX
         V64pWglyzYX4MUqSKeFEZEVAX41aeZjVfxcnjCV/f1vKj20OiEbfekvpblypgn79Xt0L
         oruKpDiOogF5MxryVzbCZcBQgFNEP5zjha0UK6Oh+Z+lCo4Ju0/WN0BSYBcRicNoAxkm
         A6vQmjqBnQ8bLoNoEVo6UDeKwOMJbVT+1FwqYB66suI8tLbgNr5nY80EbqH5qp/9crku
         hvr0EfOZ8TLLDnoO6aNdMRwXGt7l+3wD+om2DPG+yzYJmGLyM51aCMp67X2SnirIDbF5
         KLuA==
X-Forwarded-Encrypted: i=1; AHgh+RoqgtMwsdrCni6dOtddPZvGYlidi988n2Vt0VcADxD1ijMLDO7Ub+bT28tbwGnVPUyNSWzaFbAC46c=@lists.infradead.org
X-Gm-Message-State: AOJu0YzH66fs3CqCywyiwMjV+TYluvGhmshVvTpS6unoJHVzpl1wqLAv
	jdrA+YtZ7YbJeC3oomKiw63X/Gu/aJ+n8ZyTAUbWNlh8+MvygsF7oDdQIkcBf6ehN12sCBs9wbM
	AjWqGt/L62q94vA5qezZ5mGkwIjTqdAokpoP58LVPPYOH+BsfGtveBaqO37yeoW+5Na10
X-Gm-Gg: AR+sD12SpRCG9gsRjvDNm6GLoq4ii+L8ISBkYVySIRAWvDfykYCV+tRlxKtsui2H5/T
	vEroUZja17wQ5vz+QpvwX7hosoNLYH0uNGRptg4dscGGg5lnuxkpBMPsSnNaP2M/d+qJIciqhX7
	T2kcJdjbZnYRnPI8d4cbADV09qrVomwSU+kIBKjqz+aH/CpNcCgl/pekCvkYurKHDY2nsghGZza
	jcU1r26Gf6tnHFrkA+KyAovkCRP9FeAQs+LsbbsM6YrgjlQQiK0hFVdzxFVRJ69ODhLV7cFbPUV
	GwDPnVOJBQx0yTsfYyvlXyijsy21maXERBWQNezv9OxbnhZrWIiHPWBm8B6U0i3VfdAxIcMEAaE
	sxWwgfFUhO7LIubDbHJs1o2omVa3dXsZt7+Q=
X-Received: by 2002:a05:6a20:3ca3:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3cc22d69259mr563620637.2.1786386471559;
        Mon, 10 Aug 2026 11:27:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca3:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3cc22d69259mr563551637.2.1786386471002;
        Mon, 10 Aug 2026 11:27:51 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.230.104])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7ad29sm36569895c88.13.2026.08.10.11.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 11:27:50 -0700 (PDT)
Message-ID: <f2fb2f98-dafb-46ac-bd69-627b8bf0322a@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 23:57:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i3c: master: allocate IBI workqueue with WQ_HIGHPRI
To: Stanley Chu <stanley.chuys@gmail.com>, frank.li@nxp.com,
        miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
        linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, tomer.maimon@nuvoton.com, kwliu@nuvoton.com,
        yschu@nuvoton.com
References: <20260810013059.3055787-1-yschu@nuvoton.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260810013059.3055787-1-yschu@nuvoton.com>
X-Proofpoint-ORIG-GUID: xvIwRml-WjRcbcSYnxO0kibir0RaPq5n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE1OCBTYWx0ZWRfX1swSYj5s2HVA
 PYVGMsQrMFucCTwvF4pFN8y9Y88QOzASiSreNbOCe7eA5GJfJaTc2X+4YhqbYjMbM/7A2nZE/tc
 mY2OAZYeMlW62XlYQNabAKjGMIqA4tA=
X-Proofpoint-GUID: xvIwRml-WjRcbcSYnxO0kibir0RaPq5n
X-Authority-Analysis: v=2.4 cv=NqnhtcdJ c=1 sm=1 tr=0 ts=6a7a1828 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=hsRoOqe6K9Dtf6G3Ghy1+w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=BxgfbMJPAAAA:8 a=EUspDBNiAAAA:8 a=pP_cOjKy0jrMBpLy9EEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=-j4ASRGczZqhCHD74e4j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE1OCBTYWx0ZWRfX1dWQ4dyNtUpa
 +5nLjkA4CR0HBi3wB5kETXyAbHPgDvsfyLCPanrGXNXjG7OKSufsQPlev7VCzuQOERDPaOHlOW8
 XNxwRugHhnsY0UFd7/fW3lXVg5+Wjfsyht+og+ltowhbgx2AJ0jaBlo5/XHdom17pV/NU4/g0w2
 CIaaSm7gGFJygAkYuCwilKo1100HX2rTEMuwCiGJ2JeCQuEbKCzrY3Vbfin43KKJSK6h9uu+rgf
 awcJ7Lsd6ggiijUU1HxV0AwZD7f/JX3NDANeA6JBw9W3/ukyK9x77pV1uXD0ugGKmGCYADYAoPD
 xl/j2yUsH8kmA0Qu6vcfGO6MZgsyflEbCLDAF6GRnWbetglHyZxgmBEWRl4j2DrTzHCxkPVULKN
 gapo1gDU9GvY3cSQm6eFw9fAF4wktwKCqOHsW101+HkWIK5k95Bct2R96k4T1JwzTbrCiubcaKx
 w9RzFhic6SkUtAKqTtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_112754_685106_935E5F1A 
X-CRM114-Status: GOOD (  12.36  )
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

CgpPbiA4LzEwLzIwMjYgNzowMCBBTSwgU3RhbmxleSBDaHUgd3JvdGU6Cj4gRnJvbTogU3Rhbmxl
eSBDaHUgPHlzY2h1QG51dm90b24uY29tPgo+IAo+IFRoZSBJQkkgKEluLUJhbmQgSW50ZXJydXB0
KSB3b3JrcXVldWUgaXMgYWxsb2NhdGVkIHdpdGggb25seQo+IFdRX01FTV9SRUNMQUlNLCB3aGlj
aCBwbGFjZXMgSUJJIHBheWxvYWQgcHJvY2Vzc2luZyBhdCBub3JtYWwKPiB3b3JrZXIgcHJpb3Jp
dHkuIFRoaXMgaXMgaW5hZGVxdWF0ZSBnaXZlbiB0aGUgdGltZS1zZW5zaXRpdmUKPiBuYXR1cmUg
b2YgSUJJIGhhbmRsaW5nLgo+IAo+IEluIHRoZSBJM0MgcHJvdG9jb2wsIHdoZW4gYSB0YXJnZXQg
YXNzZXJ0cyBhbiBJQkksIHRoZSBTREEgbGluZQo+IGlzIGhlbGQgbG93IHVudGlsIHRoZSBtYXN0
ZXIgYWNrbm93bGVkZ2VzIGFuZCBjb21wbGV0ZXMgdGhlCj4gZXhjaGFuZ2UuIFRoZSBJUlEgaGFu
ZGxlciAodG9wIGhhbGYpIEFDS3MgdGhlIElCSSwgcmVhZHMgdGhlCj4gcGF5bG9hZCwgZW1pdHMg
YSBTVE9QLCBhbmQgaW1tZWRpYXRlbHkgcXVldWVzIHRoZSBwYXlsb2FkCj4gcHJvY2Vzc2luZyB0
byB0aGUgcGVyLWRldmljZSBvcmRlcmVkIHdvcmtxdWV1ZSB2aWEKPiBpM2NfbWFzdGVyX3F1ZXVl
X2liaSgpIOKAlCBlZmZlY3RpdmVseSB0aGUgYm90dG9tIGhhbGYgb2YgdGhlCj4gSUJJIGludGVy
cnVwdCBwYXRoLgo+IAo+IElmIHRoaXMgd29ya3F1ZXVlIHdvcmtlciBpcyBkZWxheWVkIGJ5IGNv
bXBldGluZyBub3JtYWwtcHJpb3JpdHkKPiB0YXNrcywgdGhlIElCSSBub3RpZmljYXRpb24gcmVh
Y2hlcyB0aGUgY2xpZW50IGRyaXZlciBsYXRlLiBGb3IKPiBsYXRlbmN5LXNlbnNpdGl2ZSBjbGll
bnRzIChlLmcuIHNlbnNvcnMgcmVwb3J0aW5nIGFsZXJ0cywKPiBob3RwbHVnIGV2ZW50cyksIHRo
aXMgZGVmZWF0cyB0aGUgcHVycG9zZSBvZiB1c2luZyBJQkkgb3Zlcgo+IHBvbGxpbmcuIEZ1cnRo
ZXJtb3JlLCBiZWNhdXNlIHRoZSBvcmRlcmVkIHdvcmtxdWV1ZSBzZXJpYWxpc2VzCj4gc2xvdHMs
IGEgYmFja2xvZyBvZiBkZWxheWVkIHNsb3RzIGNhbiBleGhhdXN0IHRoZSBwcmUtYWxsb2NhdGVk
Cj4gSUJJIHNsb3QgcG9vbCwgY2F1c2luZyBzdWJzZXF1ZW50IElCSXMgdG8gYmUgZHJvcHBlZCBh
dCB0aGUKPiBoYXJkd2FyZSBsZXZlbC4KPiAKPiBBZGQgV1FfSElHSFBSSSB0byBlbnN1cmUgSUJJ
IGJvdHRvbS1oYWxmIHdvcmsgaXMgc2NoZWR1bGVkCj4gcHJvbXB0bHkgYWZ0ZXIgdGhlIHRvcC1o
YWxmIElSUSBoYW5kbGVyIGVucXVldWVzIGl0LCBrZWVwaW5nCj4gdGhlIElCSSBwcm9jZXNzaW5n
IHBpcGVsaW5lIGNvbnNpc3RlbnQgd2l0aCB0aGUgaW50ZXJydXB0LWxpa2UKPiBzZW1hbnRpY3Mg
dGhlIHByb3RvY29sIGRlbWFuZHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RhbmxleSBDaHUgPHlz
Y2h1QG51dm90b24uY29tPgo+IC0tLQoKQWNrZWQtYnk6IE11a2VzaCBLdW1hciBTYXZhbGl5YSA8
bXVrZXNoLnNhdmFsaXlhQG9zcy5xdWFsY29tbS5jb20+CgotLSAKbGludXgtaTNjIG1haWxpbmcg
bGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
