Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB4BC982EA
	for <linux-i3c@archiver.kernel.org>; Wed, 23 Sep 2026 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mai6SEUf2bmq6hsIFFZikRwPukCvfgBeTWSCP7GBavM=; b=Gzr3KN62XLEgqP
	I8DKRsAyNZp7Up93gdGqG4FvfY3g3QVm/5nO/nN2k3DiknQDAOG+3ww/RQef9PY6NcZjADVzVfK18
	WNvTmDFK34+qmSxIquNMzAfNnh+d4PIvlTNXpVzJHUeGeX0I11pYV+hlHDIoik+CjtvuGj103tD7c
	C4Dx9Ap3XARWj4LTesao2SVgRL3Iq/hkseBDkWaS0ksjWhApISQUZtzhYnILb43luw2acbRs8+7Tj
	+9dIzm0mxsqpqA4GPFbVJyVshxkGIZfblNGcLSiSDYIlVfp3Wm5imwd43pzEDEYqs7qkp9nxPemCh
	7NgM3vDq7iHC7uwiLuXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JOQ-00000007kC5-2vDQ;
	Wed, 23 Sep 2026 09:35:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JOK-00000007k9g-25dK
	for linux-i3c@lists.infradead.org;
	Wed, 23 Sep 2026 09:35:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JX7t3701427
	for <linux-i3c@lists.infradead.org>; Wed, 23 Sep 2026 09:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/a7Kn8oE8KuU854oCdPtjGIYeAUtLJH8vkgql5qoro=; b=c+C/TsF7cSGi9D2Q
	X1+ySLNeZJ3+T4oMFCW2pyPq5LDZmZTgBImcmKCK4TwpWva/teTWpRWGjXIacv+I
	R5OfyyESvvu/OfjanPzg6VIWeNdhcE9RY9391/M/fKUlsY1Ls2WgGFn7CYb+4Y9c
	hZib5Fuu/VC3QYrBjCB/riheYb/BgXR5fvzrharNjmkraZueaOzbaVgs8rWNV6QO
	ynKLHIKSE5nBXdFAWzJa6LxTWa+DHMnBQM+sC1/uW3JLyn7+z0MsOwlPfT9Lg8GE
	DrrcbRe4UjSdpjiP+Upj53PJfe3GR8QRkaPNw77bEwwO8V/OYdDnhHXnWy5FUglC
	Ug39KA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428t0f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Wed, 23 Sep 2026 09:35:51 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so968394c88.1
        for <linux-i3c@lists.infradead.org>; Wed, 23 Sep 2026 02:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790156151; x=1790760951; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/a7Kn8oE8KuU854oCdPtjGIYeAUtLJH8vkgql5qoro=;
        b=OsvgiaRErjgW4uvMPWu1woNhm/1OylO+fHRpZ87EeivHVO9jsI0BtMriacCooNdN7Q
         Pr9izlRToa1v3EqMhoPEjftz/vYlv0CLYt5mGZ8oRNSGXXGgZZZ/R9XEUYD9eSVw8yXv
         yk6NpAK2Wd5IUCGERCpp8zv/EOqZL23ke3O2a9wK3N6OvQHPwdysXO/pIRy2DaMuTKSc
         cf/iHc1qEql5DrUMzGxOcFy2xYIdu/ElLIsvIFUkEy3RktyLtyfopOI6mF+fyr97ejqw
         +MwbZfI0ziiTzSoYncSUuXmq/KXBvW5hJgtXDOR7alZRH/JUX6aVVAT+ZT/uv1LX/Yds
         mnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156151; x=1790760951;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/a7Kn8oE8KuU854oCdPtjGIYeAUtLJH8vkgql5qoro=;
        b=TmLhWcQLqan7OdJAUrVXv7kUJ76Ql9hPwpS0zMUSluGDeqQXWkIS62vBe0jznPSjNJ
         5ifG5mjLQqD/8qw9H504ZiQeKHuMIdTIRAvOFGB20/rOnFpqzzjR1knsGcAppJq0wxiy
         iLUU2xcLncXN8P013oGhIJmX9ZUycAiwfTIB3GpbVz0xdjWM9UpqjwUz9V8ZNsAU1v7J
         d39hZEMwa9cZCmUdg9EqcBe4c06SY0IWQqx92eR/iTkcuoHB0p9ki7uQeFJ9JofZjE+f
         1zNjr+4n7MSK4N8LiITtOmvF+MZc9mR5p6koVPXWMxi3DPqezgC0y7+xxP9+geSxYUvP
         0ngw==
X-Forwarded-Encrypted: i=1; AKwUvBx03tnmTFUB7tI8DmqSNYt0Tb4JIWBE7IH73P2nWh3juzJ5g4d7X6HaChNqSrfIba8L3FW6OWfvrKU=@lists.infradead.org
X-Gm-Message-State: AFuF++mdDEVdlR/uEO+IQMZvu2R2eImAMFJifedH4piq1fDkUavVcz6v
	pYGyNlKybhR0UO+sOwDCCN2dgSjxEvrrO72vhQfindO1smYXZcClE4sBb5XinsRYmxmT4RV2TZ0
	HAkA2dqwRUQ2+oW7lKo2a2PdpQc+rG0LPzjCmh6TmJC6YsLFSa4Cn0ephyBwMcsmViVHF
X-Gm-Gg: AYBFou0FDxGy/gRsejatPZsVg6t+BnsIOnrXAsaL+K+H7F5WWwmVflzsvTMqxVCV758
	L2KZdyR0hNusjSbpxPwL66EjOKHX8dgJTATFRHW/xSzUAKfgtHKrNKzkNqS4coaPPHIn9n1WDps
	Q0ze4UTpW7rulew5dTmfWkyJYJqbBZC9hLE2FAW2871DCAFMWpE1P3MEV6vDj1A4qD5OT3+0lpn
	4Qf4rR/SOqqQkjUHfrY8Pfv5PhMxeG1p81RP2cYB3RK3GQpZ1fhuXpHe4N58DXGy6IRP/2xThyO
	JqhuhyEIh8j6hQym1bs1CBeFAaIfVu15OFj71JspLgXBpQbPGIpTK/nCf8JoktW10pEgAS/POKf
	saeu8IQDp78Fi3EjlNQb/Wi1bESdjlnYS
X-Received: by 2002:a05:7022:f902:20b0:143:298c:924e with SMTP id a92af1059eb24-144f92ed2ffmr1965395c88.45.1790156150577;
        Wed, 23 Sep 2026 02:35:50 -0700 (PDT)
X-Received: by 2002:a05:7022:f902:20b0:143:298c:924e with SMTP id a92af1059eb24-144f92ed2ffmr1965365c88.45.1790156149790;
        Wed, 23 Sep 2026 02:35:49 -0700 (PDT)
Received: from [10.217.219.38] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f982089fsm5080325c88.5.2026.09.23.02.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:35:49 -0700 (PDT)
Message-ID: <7a452005-ad63-4687-8cd2-6dbd054cb4f3@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:05:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
 <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
 <c9c9c069-d8e8-4921-8007-6c6386c8da7c@oss.qualcomm.com>
 <a3eaf9e3-5c18-42ba-a645-2efdfe161fd5@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <a3eaf9e3-5c18-42ba-a645-2efdfe161fd5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab39d77 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qXHdgDUTi1Lqi5hRQc8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: p2knp7Mezu_uW3VtqM2ufW38DOqQq4wT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX6j0DLiUeweEg
 UkfA7rRjOKWBzOVxmvnZ5j3das3gBAsXNY/NhrxnjVCA6AFIL+lar6dw1arQ/dp4EUTkrKInDJz
 pqveNUDHhiSlhVgYmN6+CAWsm5sf6CmiZ7Al84n63cZWSkgORJyMceGBAkLMuuRjmWwv6baqz21
 Y0NMByDdKPz1jG0eHIrIJayEnyMUblvddUYO+xNiCaVx33yjV4DpvcgN92Qv7/2ywZDmEM4CCpg
 XTgUFqL3CZiBMmnJO7c7tGk97pAaVsx+zRCtF8oEj5su3Zn6F55yjTSlYbB+0GcSVLY6Alz1cZ+
 O4AM0pWcvEwqOwSlGGvAuZ8OU8ZbpuRhebUySttk2xGEx+uDO5xgfTrYfwWi+AtuEGahNag8kdY
 uMCANraESbKeAbvBFM1dR+9RkURXSaB0BHbB1rQhlrNrWFy23IoEmgSR+13UdAyiXgy6/zhwurd
 Womiybsa+XntryLH2BQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfXyTw9fVLHwWbb
 yqm/IXsJhuzO9zyY+Nr/I2uK1LUeE68vymH55lvp+2jpAi5HaTGwN5QHA/tdeDkxTA6s5DCKb9H
 dkRKsVp5EDY8LW5L88fCyzJo8DK2Eo0=
X-Proofpoint-GUID: p2knp7Mezu_uW3VtqM2ufW38DOqQq4wT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_023552_548630_C37E224D 
X-CRM114-Status: GOOD (  17.35  )
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

CgpPbiA5LzIyLzIwMjYgMzo0MCBQTSwgS29ucmFkIER5YmNpbyB3cm90ZToKPiBPbiA5LzIxLzI2
IDEwOjI4IFBNLCBNdWtlc2ggU2F2YWxpeWEgd3JvdGU6Cj4+IEhpIEtvbnJhZCwgQXBvbG9naWVz
IGZvciB0aGUgZGVsYXllZCByZXNwb25zZS4gSSB3YXMgd2FpdGluZyB0byB2ZXJpZnkgdGhlIGNo
YW5nZXMgYW5kIGVuc3VyZSBhbGwgdGhlIHN1Z2dlc3RlZCB1cGRhdGVzIHdlcmUgcHJvcGVybHkg
aW5jb3Jwb3JhdGVkLiBUaGUgZWZmb3J0IHdhcyBmdXJ0aGVyIGRlbGF5ZWQgZHVlIHRvIHNvbWUg
c2xhdmUtc2lkZSBzZXR1cCBpc3N1ZXMuCj4+Cj4+IEkgaGF2ZSBub3cgYWRkcmVzc2VkIGFuZCB2
YWxpZGF0ZWQgYWxsIHRoZSBzdWdnZXN0ZWQgY2hhbmdlcyBleGNlcHQgb25lLCB3aGljaCBJIGhh
dmUgcmVzcG9uZGVkIHRvIHNlcGFyYXRlbHkgYmVsb3cuCj4+Cj4+IE9uIDcvMTgvMjAyNSAyOjIx
IEFNLCBLb25yYWQgRHliY2lvIHdyb3RlOgo+Pj4gT24gNy8xLzI1IDk6MTggQU0sIE11a2VzaCBL
dW1hciBTYXZhbGl5YSB3cm90ZToKPj4+PiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRo
ZSBRdWFsY29tbSBJM0MgY29udHJvbGxlci4gVGhpcyBpbmNsdWRlcwo+Pj4+IHRoZSBuZWNlc3Nh
cnkgZG9jdW1lbnRhdGlvbiBhbmQgcHJvcGVydGllcyByZXF1aXJlZCB0byBkZXNjcmliZSB0aGUK
Pj4+PiBoYXJkd2FyZSBpbiB0aGUgZGV2aWNlIHRyZWUuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBNdWtlc2ggS3VtYXIgU2F2YWxpeWEgPG11a2VzaC5zYXZhbGl5YUBvc3MucXVhbGNvbW0uY29t
Pgo+Pj4+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+
Pj4+IC0tLQo+Pj4KPj4+IFsuLi5dCj4+Pgo+Pj4+ICtwcm9wZXJ0aWVzOgo+Pj4+ICvCoCBjb21w
YXRpYmxlOgo+Pj4+ICvCoMKgwqAgY29uc3Q6IHFjb20sZ2VuaS1pM2MKPj4+PiArCj4+Pj4gK8Kg
IHJlZzoKPj4+PiArwqDCoMKgIG1heEl0ZW1zOiAxCj4+Pgo+Pj4gSW4gYW5vdGhlciBwYXRjaHNl
dCwgeW91IGV4cGFuZGVkICdyZWcnLCBjYW4geW91IGNvYWxlc2NlIHRoYXQgY2hhbmdlCj4+PiBp
bnRvIGhlcmUsIHNvIHRoYXQgd2UgZG9uJ3QgaGF2ZSB0byB3b3JyeSBhYm91dCBiYWNrd2FyZHMg
Y29tcGF0Pwo+Pj4KPj4gRG8geW91IG1lYW4gYXMgYmVsb3cgPwo+PiByZWc6Cj4+ICDCoCBtaW5J
dGVtczogMQo+PiAgwqAgbWF4SXRlbXM6IDIKPiAKPiBObywgSSBtZWFudCB0aGF0IHNpbmNlIHlv
dSBrbm93IGluIGFkdmFuY2UgeW91J2xsIG5lZWQgdGhlIGJpbmRpbmdzCj4gdG8gYmUgYWx0ZXJl
ZCwgc2ltcGx5IHNxdWFzaCB0aGUgdHdvIGJpbmRpbmdzIHBhdGNoZXMgdG9nZXRoZXIgYW5kCj4g
c3VibWl0IGFzIG9uZQo+IAo+IEtvbnJhZAo+IAoKU3VyZSwgd2lsbCBwdWJsaXNoIGZ1bGwgZHQt
YmluZGluZyBkZXNjcmliaW5nIEkzQyBoYXJkd2FyZSBpbmNsdWRpbmcgSUJJIApyZWxhdGVkIGlu
Zm9ybWF0aW9uIGFuZCBhY2NvcmRpbmdseSB1cGRhdGUgdGhlIGNvbW1pdCBsb2cuCgo+Pgo+PiBJ
IGRpZCBpdCBlYXJsaWVyIHRvIGFkZCBzdXBwb3J0IG9mIElCSSBmZWF0dXJlLCBidXQgaSBwbGFu
IHRvIGRvIGl0IGxhdGVyLiBSaWdodCBub3csIGkgb25seSB3YW50IHRvIGFkZCBwbGFpbiBpM2Mg
Y29udHJvbGxlciBzdXBwb3J0IHdpdGhvdXQgSUJJIGhlbmNlLgo+Pgo+PiBJIHNoYWxsIGFkZCBl
eHBhbmRlZCByZWcgd2hpbGUgYWRkaW5nIGkzYyBzdXBwb3J0LiBGb3Igbm93LCBpdHMgbm90IHJl
cXVpcmVkLiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhpcyBpcyBmaW5lIGZvciBub3cuCj4+Cj4+
PiBLb25yYWQKPj4KCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
