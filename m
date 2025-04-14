Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DAAC54755
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PM8uVYXDsCBWSBANpae/rC8KEUEadgGtDypFHrOYymc=; b=Tim1TiibpNQxBY
	DeAZKVRRieSlWaYo7rLiGk3CQzCVjGlzu03hIRVgvr1eF8arTclb97bgIlISTaP6T4585ocRKJhj9
	+bO7fDIWZ3/00MkX1XXqvJMhp0G67kxrd+FYun6AqCMIV06XghVPvtivMIap+rcdNcDNODG5C8Fi7
	ePnpAC8VvpOhexG2+jK0GVafF6FBxiy6TsqUm7nT681ZQEfr/2RV2qdqIFR5itPaEf3hGR5XpuU85
	QHqgeqbp/GdftZ5FiWOFLsIkKm8JuuOSsVGU8swB1hg8jQvItvNsqOJQvonJWq2n93xMayZJ8Vdom
	wiHgYjH4pm+08Btu6jyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUla-000000008Ry-0yzk;
	Thu, 15 May 2025 09:20:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Fx9-00000001Fet-0Afr
	for linux-i3c@lists.infradead.org;
	Mon, 14 Apr 2025 09:18:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99mri028974
	for <linux-i3c@lists.infradead.org>; Mon, 14 Apr 2025 09:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9n6fUwx7dsdIHqmGM9lTq0LMxBs5RvxrZgMfBBeiHZw=; b=IVhNOIRCd08r00/4
	Xq1isB6u2/D2jXogCcMM9qAiKSwQHsiU2fEq7dqq6A8oz7sP6iMEjW5kSEyXbX3Z
	1KrJjn5sBGMmr7QoVGRdji+qi6c/hOQ7nro/EHopuFstrTVVJTWG0Foh/Iy8JN9/
	Hd2FKJs6kZCy1V42LvA6TjzLMB9abrdm34/+mI3hyvfgbs3TtD1/5/8HgV3jeRaF
	sqC9qOD6vVDvoG5Alf5gFK+/HFHO3nGlaQ9DBthp4fL+roPuhH+oh32m4mISWf2D
	KHpa/HQDNcQ8a2C7amplFyrG7m7P/cdhwY77OSYEp5jTuPPezBmqLikd8zf9Zs+y
	ilXYVQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs141x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Mon, 14 Apr 2025 09:18:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeeaf707b0so2556946d6.0
        for <linux-i3c@lists.infradead.org>; Mon, 14 Apr 2025 02:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744622284; x=1745227084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9n6fUwx7dsdIHqmGM9lTq0LMxBs5RvxrZgMfBBeiHZw=;
        b=Un7PR4Qfj9kFsCojlQYDTQL9ThPvc/92tsnsSeR8/yToz/V3dssnpdD0tE4HuEEIGc
         xaBwJPcEfU94fvD0iRg0C6O3vPeenHS3Kvv4hYsbe08JlwYdqZzc/PtH+RoHMqTpS4hD
         ERlyN9LCPrPIlADDGDxRLkY+t3M0v+QziC8sw9tlnmDDQT2wvyJXlqpJTDGB4rOh9P4b
         DMKvbhJJHQ813iiqZLFIS2kYvRDl8kldH1bz0FIC6dUth1XCZKB6k035f1Qh79YqZFyI
         JUgmsBwwtvhKYyL7/hFiMxyFI8gD+fIxPDbd5MwhlEWoBIDxQOxQb2BZueUNu2l0Osql
         GhPw==
X-Forwarded-Encrypted: i=1; AJvYcCUkgKcSB7IHIXUYDp6J2Ywe2cGGLYbnDt6CYocUeGosRjs/FTdPJpTSgYuxH+VsIJ3Uvi++8bY/UL0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLWrdjtfBbLnTM06T8eSmCyq8rySpOalAQ8hSDvqF85Uvab4Hc
	XbdqFTRA9/j8Yltcvdal8wmSY5KR4EDMVSvj+t+Wm3ActGzRkg8hVXwsQZkOn1rN98/bwBe2E1g
	uHojjoCZUAp07At4bNbbBq725XIFNaWQvlz09j6QL4lIEEkH4yB69VBqBOXOG2euG
X-Gm-Gg: ASbGnctCA4M4j+S+95G5erscx5RYXCIRCREvwTqx4ORiARjn5mQIY7fYxvn1yo1lcgU
	nWgINyYOmHYsw/KR8AioDLZ29g1C7GdSCFVa8W76iTS3E7fpN7+grjL4HqzkMXIaD/Ke+e6Sqs3
	xzpxjzThcKYMMED6cZogCr22oHVKS2kPKVGiiItkiNXju1VR8/3ka9pPf4iFQwx8/yQ+U/IfR2K
	boER7Yr874VF01tbKyy3LoM8X5kerU3QJDx+tf6KLGSGEViOcCth9mRXJ77DV62r7zc3P4EXvjG
	4BnC0OXtD12+yIZXpOH7BeazudtOY40XK9IcoF0W+udrjC+PDx/qsqpvZ3Sk11tI7A==
X-Received: by 2002:a05:6214:627:b0:6e4:29f8:1e9e with SMTP id 6a1803df08f44-6f223228651mr69610206d6.0.1744622283489;
        Mon, 14 Apr 2025 02:18:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFluLUS0n50qcCegrTq8Pm42HzMF5shZXnI+wDunODqc0e6WM8+H5gnO9csrzFiy43bwKo2CQ==
X-Received: by 2002:a05:6214:627:b0:6e4:29f8:1e9e with SMTP id 6a1803df08f44-6f223228651mr69610026d6.0.1744622283016;
        Mon, 14 Apr 2025 02:18:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9152sm860014966b.42.2025.04.14.02.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:18:02 -0700 (PDT)
Message-ID: <04ed2ec1-9393-4d02-b7c8-54d6b0aecabc@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 11:18:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add Qualcomm i3c controller driver support
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <eb6e8452-db37-47f7-9265-fd47d4cb69b8@oss.qualcomm.com>
 <84c07b53-a564-4c71-b172-676303700314@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <84c07b53-a564-4c71-b172-676303700314@quicinc.com>
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fcd2cc cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Nc8cXWw94qvZg0M5jZYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 100HgxvzhZT9uZp9qpuApj_CB2Aw3Tyx
X-Proofpoint-ORIG-GUID: 100HgxvzhZT9uZp9qpuApj_CB2Aw3Tyx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_021807_202698_C25674A7 
X-CRM114-Status: GOOD (  12.62  )
X-Mailman-Approved-At: Thu, 15 May 2025 02:17:27 -0700
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

T24gNC8xMy8yNSA5OjI4IEFNLCBNdWtlc2ggS3VtYXIgU2F2YWxpeWEgd3JvdGU6Cj4gCj4gCj4g
T24gNC8xMi8yMDI1IDQ6NTAgQU0sIEtvbnJhZCBEeWJjaW8gd3JvdGU6Cj4+IE9uIDQvMTEvMjUg
MTozNSBQTSwgTXVrZXNoIEt1bWFyIFNhdmFsaXlhIHdyb3RlOgo+Pj4gVGhpcyBwYXRjaHNldCBh
ZGRzIGkzYyBjb250cm9sbGVyIHN1cHBvcnQgZm9yIHRoZSBxdWFsY29tbSdzIFFVUFYzIGJhc2Vk
Cj4+PiBTZXJpYWwgZW5naW5lIChTRSkgaGFyZHdhcmUgY29udHJvbGxlci4KPj4+Cj4+PiBUaGUg
STNDIFNFKFNlcmlhbCBFbmdpbmUpIGNvbnRyb2xsZXIgaW1wbGVtZW50cyBJM0MgbWFzdGVyIGZ1
bmN0aW9uYWxpdHkKPj4+IGFzIGRlZmluZWQgaW4gdGhlIE1JUEkgU3BlY2lmaWNhdGlvbnMgZm9y
IEkzQywgVmVyc2lvbiAxLjAuCj4+Pgo+Pj4gVGhpcyBwYXRjaHNldCB3YXMgdGVzdGVkIG9uIEth
aWx1YSBTTTg1NTAgTVRQIGRldmljZSBhbmQgZGF0YSB0cmFuc2Zlcgo+Pj4gaGFzIGJlZW4gdGVz
dGVkIGluIEkzQyBTRFIgbW9kZS4KPj4+Cj4+PiBGZWF0dXJlcyB0ZXN0ZWQgYW5kIHN1cHBvcnRl
ZCA6Cj4+PiDCoMKgIFN0YW5kYXJkIENDQyBjb21tYW5kcy4KPj4+IMKgwqAgSTNDIFNEUiBtb2Rl
IHByaXZhdGUgdHJhbnNmZXJzIGluIFBJTyBtb2RlLgo+Pj4gwqDCoCBJMkMgdHJhbnNmZXJzIGlu
IFBJTyBtb2RlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE11a2VzaCBLdW1hciBTYXZhbGl5YSA8
cXVpY19tc2F2YWxpeUBxdWljaW5jLmNvbT4KPj4+IC0tLS0KPj4+IExpbmsgdG8gVjM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNTA0MDMxMzQ2NDQuMzkzNTk4My0xLXF1aWNfbXNh
dmFsaXlAcXVpY2luYy5jb20vVC8KPj4+IHYzLT52NDoKPj4+IMKgIC0gRHJvcHBlZCAiY2xvY2st
bmFtZXMiIHByb3BlcnR5IGZyb20gZHQtYmluZGluZ3MgYXMgc3VnZ2VzdGVkIGJ5IGtyenlzenRv
Zi4KPj4+IMKgIC0gTWFrZWZpbGU6IENvcnJlY3Qgb3JkZXIgc2VxdWVuY2UgZm9yIGkzYy1xY29t
LWdlbmkuYy4KPj4+IMKgIC0gSW5kZW50YXRpb24gY29ycmVjdGVkIGFyb3VuZCBwcmludCBzdGF0
ZW1lbnQuCj4+PiDCoCAtIGdlbmlfaTNjX3Byb2JlKCkgOiBFeGl0IHdpdGggcmV0dXJuIDAgaW5z
dGVhZCBvZiByZXQgZm9yIHN1Y2Nlc3MuCj4+PiDCoCAtIEFkZGVkIHNwYXJzZSBhbm5vdGF0aW9u
cyBhcm91bmQgaTNjX2dlbmlfcnVudGltZV9nZXRfbXV0ZXhfbG9jaygpL191bmxvY2soKS4KPj4K
Pj4gU28gdGhpcyBpcyB0aGUgdGhpcmQgdGltZSBJIGdvdCB0aGlzIHJldmlzaW9uIGluIG15IGlu
Ym94LCBwcmV2aW91cyB3ZXJlCj4+IDwyMDI1MDQxMDA4NDgxMy4zNTk0NDM2LTEtcXVpY19tc2F2
YWxpeUBxdWljaW5jLmNvbT4gMTAuMDQKPj4gPDIwMjUwMzMxMTY0NjQ4LjIzMjE4OTktMS1xdWlj
X21zYXZhbGl5QHF1aWNpbmMuY29tPiAzMS4wMwo+Pgo+PiBiNCBzaG91bGQgYmUgYXV0b21hdGlj
YWxseSB1cHRpY2tpbmcgdGhlIHJldmlzaW9uIGNvdW50ZXIsIHBsZWFzZSBkb24ndCBtZXNzCj4+
IHdpdGggaXQgbWFudWFsbHkKPiBTb3JyeSBLb25yYWQsIGkgY291bGQgbm90IHVuZGVyc3RhbmQg
d2hhdCdzIHRoZSBwcm9ibGVtIG9yIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gc2F5Lgo+IAo+IERv
IHlvdSBzdXNwZWN0IHNvbWV0aGluZyAoV2hpY2ggaSBkaWRudCBnZXQpIGlzIHNlZW4gYXMgbWFu
dWFsbHkgY2hhbmdlZCA/CgpZZXMsIG5vcm1hbGx5IGVhY2ggJ2I0IHNlbmQnIHVwdGlja3MgdGhl
IHJldmlzaW9uIGNvdW50ZXIsIGJ1dCBoZXJlIHdlIGdvdAphIGNvdXBsZSBzdWJtaXNzaW9ucyBh
bGwgd2l0aCB2NAoKS29ucmFkCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWkzYwo=
