Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71961C982F1
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Sep 2026 10:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T31epUZo1RLk1n9aBx+pU+p+q0z/oYwkE0OYIZ/dvNY=; b=wpQ51IHqNVQ0UA
	/zylR+8X48COWzz09WNQuhMuk656glL9VHcFIQ5/d1oMr8iozNCyk41cOlBGzjnpaGy6aO2ZdxpA1
	wen1HUGYU5KgFRn5eec6ULZ1idGg75DpRNVpzU5Ckb0Scqailbs+OY7fby+cEUIMNgkZtYc+sIkKZ
	kSzCQJjRwiHA5L/IcJMTSs1ftpo9GC/aZWSEqAtrIjPpuZ6+7lkC2dv2emfvrBt0z387sb3MXWmTY
	gW0Hc/KFurmjIvqySOnQtunPQna3YU0PHQx+C+jESYZhss0oUMS840ep6jLQLc/IcKWEP2prFY13m
	/vKTFMEuwwpVh+18QS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xSF-000000050yM-0day;
	Tue, 22 Sep 2026 10:10:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xSD-000000050xo-0nqH
	for linux-i3c@lists.infradead.org;
	Tue, 22 Sep 2026 10:10:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9BdO01842272
	for <linux-i3c@lists.infradead.org>; Tue, 22 Sep 2026 10:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5QTGNRnNGOU9Olniee3WOkSX3E9TIdQQscCKIDdT/k0=; b=hB2KeA+tD077GQeP
	9yydTU2bHdO/++SZajAN3/vj0KChQTa88elpk3cMfxk6sU8GFRaDE8oD+/oRxQv8
	04MJ1rxFTRGQd00UQpEtMpY4fmYXY3incC2U8F5p8xiigoivnxSUdB0jRMRwV3lu
	F3vrkwB/vUCQzkA/yZrW5TTrGdYmws9/Sou7evSNb6rnjjsBgJYtQwb981xiWlWT
	q74PmrBOweSuSHosqZTDAB43aUy4qnJacjzUwPApopscg9PEZ9scrGJZkD1wSfFl
	CnzNfYMy3VSN8DnSXGTiw30vsoGCvqTon32P9eiVsg/GoB4++M9XNt4jhY6M99X/
	HZn98g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj111de2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Tue, 22 Sep 2026 10:10:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91240299f0bso9067016d6.3
        for <linux-i3c@lists.infradead.org>; Tue, 22 Sep 2026 03:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790071823; x=1790676623; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QTGNRnNGOU9Olniee3WOkSX3E9TIdQQscCKIDdT/k0=;
        b=EM0WVWR8UpXRI8/AIG/LI6trq6BciKJbvGOIDrhjjdk2M3XMvBVwY6G94oTl5eD+0V
         xDkcy6vlpk/YSX4xAaPV6CdImyK0lPGb9oj6/raA0rsfrU6WaArc72+1ggFmzvb+XtMz
         CJj8puN+hajqYjd7zH/V+4Yl0Iqf1hNQmHOAyE/rUxRK9MIDNLyvfkqLSWM8VMLVHYp5
         zHvnS0IoZcdtwWDYQzVvlk1Kiy38ktVr0NxGMHs3EsFAMkCDI+k7bGtzP9mZNn0zKTco
         R0SUHLaKyJePhFUi6sJAP/e6z8C0LkvGYVagDhl01yqvMA/aKW74wR1SxfwK03ZZG2Jx
         vlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071823; x=1790676623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QTGNRnNGOU9Olniee3WOkSX3E9TIdQQscCKIDdT/k0=;
        b=YBg79xeXaGp9zUmwThiXXEypDT5xPLvQr2gxkz6v+YqQCoIcAM2Cl8I81Okb7f0P8T
         Rf1bKCrR8t8FoVa4KtziHbixkALQnIXICfQvl1RSOiIyoimYUEc/9H+ezjcUuat33eOb
         fzsTxqG0JCN3ie4DSOXQO86v+xPIqcC2gLNjDRqyz0V7oR7GVfuKw+vqfwtnV4gdZ7be
         L34eQoU0A+KCCAv6i4cVDkc2XyHhxY4aKfX8oQwEyrT1Qs4ZQURIUlGdG4Ho/CVkdvyZ
         IOp2N9l32+oUNpfNZE7I7gSdGVfY2BDXVp5jHBddPcdFIub23yMpKmu5mvPLUpPy6nME
         E5mA==
X-Forwarded-Encrypted: i=1; AKwUvBwxsQyGs5/4tSenJc9wf5mpjOoexssJfOkOEZaeAWRHM9EPx74rIExNll3BSPcbrC7Lt4x8DG/kaYg=@lists.infradead.org
X-Gm-Message-State: AFuF++lshyArI2AM6ffdD86G9T7anGXK7CAwFUnrq/DUBAN2TC0b4WBJ
	NR3u7U45F+utunTptnf6naLJAqoZ0w0tb2Jqa0dDpbvVlQoov8/n3zAALOIFmS3ZVVroXPuaScF
	p4PN78zvOPKGlEmz/HgCX2CGcWEkHJ1WFoz7B+WUR0WYvhZL3EQMpeGcVB5F6gR51APUS
X-Gm-Gg: AYBFou3HM80QIvzgMcD6Eu3/f50m7quksalbzIotb8j+gkoWG2vXKqWvpndVZWpDrLO
	++SCXA5D6FC7VJCpADj66N8aFYjp1iNMJ5CDExM7wEz1WgIXxaDYPZtfhVITe0l3Qy7PaTu7tgZ
	QXDLgnS0hHCJSJoEaodHMiYOukudzqXvf/TnpW1kd64Pj0JeADXeQwM4YyiaxbT0MyA5y+N7T77
	z/TyGXjhqKQLAUp6DabFs0omLbSWo4erXy01YyF84c8sMffJTO7zYNWaD2R8gfhs7oAst4fe/fb
	mvjJ5rwuediRPBMW29/Dihrhtpf2GrncmZx3uLKr3rWRw8S0L6ZsWH8HRdWx8zv04mXz+063xFz
	1ZQGndTpKok6FQpu6xWj8Zw==
X-Received: by 2002:a05:6214:c25:b0:908:2053:b57b with SMTP id 6a1803df08f44-913fc9aae15mr47552356d6.5.1790071822871;
        Tue, 22 Sep 2026 03:10:22 -0700 (PDT)
X-Received: by 2002:a05:6214:c25:b0:908:2053:b57b with SMTP id 6a1803df08f44-913fc9aae15mr47552076d6.5.1790071822402;
        Tue, 22 Sep 2026 03:10:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f163sm61730966b.11.2026.09.22.03.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:10:21 -0700 (PDT)
Message-ID: <a3eaf9e3-5c18-42ba-a645-2efdfe161fd5@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:10:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c9c9c069-d8e8-4921-8007-6c6386c8da7c@oss.qualcomm.com>
X-Proofpoint-GUID: kwXnCRuMNEBgqzLlI8byF6GFzY91LC3h
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX/3t9hWuEYnU5
 OW4SoZHAeu2QNr/cjgdpEFBFR7zdnwymaS9ZI24/taqbZn8kZ7L5ucLgY08swePvRuJilhgkMCx
 +pmCj5lEhFbK30h0aEiXyewRgv9BqSM=
X-Proofpoint-ORIG-GUID: kwXnCRuMNEBgqzLlI8byF6GFzY91LC3h
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2540f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qXHdgDUTi1Lqi5hRQc8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX4HZ/t+iA3zPf
 YDhPHIDxD1NGRDci00qwbql5tE3aoRWDsKiSeaLjnekKyQP0ditkSD6k1gcf1uFhMofu9SDoKOZ
 kGbOZAYBbUez0Hbjg7QdAZbxSB62VfmUozkBi43K8F+ECe6ulr0GLdInm+tpROJAzvMAvMGGHsF
 nuAGH3mSY21RlOPJiFfUlIEFiZYDQRqaWBTUXk92DpKFTyXLVuvTchrrQswxuZPHU/QNaqth2Qi
 e2NpckoU7wtijsgDj7LEq/2w2IlYP9nTkG1ZK7EW22yDb4LRkjIHFFz48KzPtc811sTnumOJSEa
 GszuI6C5UHQWA1ivUMUxM8hbJ3ZTdnbLjYucQnvKyZc2E0SauZucR8NcMjGukadO2TddsBe7Blt
 CebTJU5LywQf+9qhyYPwUb9OGGdFwmxAbkscYHsvVYHgKXZbF6TVL4ZZ551HQ9FJZRvvStsb16P
 EsJfDfnCNBH7RR9YcUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_031025_248123_270BD334 
X-CRM114-Status: GOOD (  17.93  )
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

T24gOS8yMS8yNiAxMDoyOCBQTSwgTXVrZXNoIFNhdmFsaXlhIHdyb3RlOgo+IEhpIEtvbnJhZCwg
QXBvbG9naWVzIGZvciB0aGUgZGVsYXllZCByZXNwb25zZS4gSSB3YXMgd2FpdGluZyB0byB2ZXJp
ZnkgdGhlIGNoYW5nZXMgYW5kIGVuc3VyZSBhbGwgdGhlIHN1Z2dlc3RlZCB1cGRhdGVzIHdlcmUg
cHJvcGVybHkgaW5jb3Jwb3JhdGVkLiBUaGUgZWZmb3J0IHdhcyBmdXJ0aGVyIGRlbGF5ZWQgZHVl
IHRvIHNvbWUgc2xhdmUtc2lkZSBzZXR1cCBpc3N1ZXMuCj4gCj4gSSBoYXZlIG5vdyBhZGRyZXNz
ZWQgYW5kIHZhbGlkYXRlZCBhbGwgdGhlIHN1Z2dlc3RlZCBjaGFuZ2VzIGV4Y2VwdCBvbmUsIHdo
aWNoIEkgaGF2ZSByZXNwb25kZWQgdG8gc2VwYXJhdGVseSBiZWxvdy4KPiAKPiBPbiA3LzE4LzIw
MjUgMjoyMSBBTSwgS29ucmFkIER5YmNpbyB3cm90ZToKPj4gT24gNy8xLzI1IDk6MTggQU0sIE11
a2VzaCBLdW1hciBTYXZhbGl5YSB3cm90ZToKPj4+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBm
b3IgdGhlIFF1YWxjb21tIEkzQyBjb250cm9sbGVyLiBUaGlzIGluY2x1ZGVzCj4+PiB0aGUgbmVj
ZXNzYXJ5IGRvY3VtZW50YXRpb24gYW5kIHByb3BlcnRpZXMgcmVxdWlyZWQgdG8gZGVzY3JpYmUg
dGhlCj4+PiBoYXJkd2FyZSBpbiB0aGUgZGV2aWNlIHRyZWUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogTXVrZXNoIEt1bWFyIFNhdmFsaXlhIDxtdWtlc2guc2F2YWxpeWFAb3NzLnF1YWxjb21tLmNv
bT4KPj4+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+
Pj4gLS0tCj4+Cj4+IFsuLi5dCj4+Cj4+PiArcHJvcGVydGllczoKPj4+ICvCoCBjb21wYXRpYmxl
Ogo+Pj4gK8KgwqDCoCBjb25zdDogcWNvbSxnZW5pLWkzYwo+Pj4gKwo+Pj4gK8KgIHJlZzoKPj4+
ICvCoMKgwqAgbWF4SXRlbXM6IDEKPj4KPj4gSW4gYW5vdGhlciBwYXRjaHNldCwgeW91IGV4cGFu
ZGVkICdyZWcnLCBjYW4geW91IGNvYWxlc2NlIHRoYXQgY2hhbmdlCj4+IGludG8gaGVyZSwgc28g
dGhhdCB3ZSBkb24ndCBoYXZlIHRvIHdvcnJ5IGFib3V0IGJhY2t3YXJkcyBjb21wYXQ/Cj4+Cj4g
RG8geW91IG1lYW4gYXMgYmVsb3cgPwo+IHJlZzoKPiDCoCBtaW5JdGVtczogMQo+IMKgIG1heEl0
ZW1zOiAyCgpObywgSSBtZWFudCB0aGF0IHNpbmNlIHlvdSBrbm93IGluIGFkdmFuY2UgeW91J2xs
IG5lZWQgdGhlIGJpbmRpbmdzCnRvIGJlIGFsdGVyZWQsIHNpbXBseSBzcXVhc2ggdGhlIHR3byBi
aW5kaW5ncyBwYXRjaGVzIHRvZ2V0aGVyIGFuZApzdWJtaXQgYXMgb25lCgpLb25yYWQKCj4gCj4g
SSBkaWQgaXQgZWFybGllciB0byBhZGQgc3VwcG9ydCBvZiBJQkkgZmVhdHVyZSwgYnV0IGkgcGxh
biB0byBkbyBpdCBsYXRlci4gUmlnaHQgbm93LCBpIG9ubHkgd2FudCB0byBhZGQgcGxhaW4gaTNj
IGNvbnRyb2xsZXIgc3VwcG9ydCB3aXRob3V0IElCSSBoZW5jZS4KPiAKPiBJIHNoYWxsIGFkZCBl
eHBhbmRlZCByZWcgd2hpbGUgYWRkaW5nIGkzYyBzdXBwb3J0LiBGb3Igbm93LCBpdHMgbm90IHJl
cXVpcmVkLiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhpcyBpcyBmaW5lIGZvciBub3cuCj4gCj4+
IEtvbnJhZAo+IAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1pM2MK
