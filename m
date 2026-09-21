Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753B0C982EE
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Sep 2026 20:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2t8pwsaqi4/v7wz6qiOiFjZbD72gxasX9hk8ZefV6vo=; b=EQn6WC7ZEamD2+
	XwCMwZBCpwSXJComtI53xr9M9XwX0/6ubBScjuxwaFLxlX7GIa1Ey2mP1Zb9bPe2vegmST9/HLd9o
	VQp3+vA44saP/Hevik/7TpC2+8YJ30fQpHxSB2+I6YwKucRrhy0+C0W9MZw8wC/CxQFBTI5Lowo5+
	qqBcEP4UynqaO5G8fB09QlEnBZL6jgiPcx0F4/joCjKCQAz4FQpgk+bjNIerEjZcocEnjbz/0fw2h
	ytkOyrM1YG0mSV29hcRDHLi7hGIwnjZdSBE3vEId7G9wNUvpamRAlL7EGXOECmpM5+uukzV1zhaTu
	ztaeOonlJGVB974S/Xzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kkE-00000003N3w-0dEf;
	Mon, 21 Sep 2026 20:36:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kkB-00000003N37-1FUq
	for linux-i3c@lists.infradead.org;
	Mon, 21 Sep 2026 20:36:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAmov2164058
	for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 20:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5AIKP1mP34Wx9dw84lO7Zn0zSS/9x6lk1WSUH1MKxg=; b=VefK8UL62syGlWw0
	C4PlvfAlL6cxbSmQ9Cjig+H6SMW6jZDpQrSNe8cl9xZJMri2zT8KEcHjenoxv3g7
	A/segX7gVa9yKyiJ6HkHE4Bxf/7m7oGiZsHJ2uWaBkAWxvlYKbwzmJ+me1u1+X+x
	Nm6KzRnJVDJ7i68qlZ7jpPWXnpd3vd8rHTCIQEdQ/KFVMBy8q6hRRr51gNSenr1P
	h8fbALFHlQTT8tS0oOd1qM411ZdXGstdEHzSfMobUNZa+mQ/cdZ8M9L008vEwKC/
	JKAM6Ad4myRowaZEO32frdAHpZjMRCeY+d6mjSn5xaJJsvXb9Vp+23eAm6N6I5n/
	YSZKFQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw39hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 20:36:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so4647023a91.3
        for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 13:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790022965; x=1790627765; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5AIKP1mP34Wx9dw84lO7Zn0zSS/9x6lk1WSUH1MKxg=;
        b=ArC52fyYE1GVgrqyjPrq9AbGijgOu+RX8SoABrIX+RJWZ/FxyAwPJ2J1Xju9YZ9jE7
         plJVGzyBeGcymozYJSMdnm9jna/AXF0F8i4YAg0fO11WfZzZW6YELAueSfvcJVV/ZFWZ
         /Rfrj0o+JbXzphO2S9JzwdNLlZcCnZRc/SGX9/Li5kF77mCdwHbaScZR59aX1+3UkRPj
         NeNx23Gh5jegy9jkBVqKGZmFBOsRssG+1cFFCSkD6A4UVFYHVU8GTHI0wU0UirxmWbVf
         Kpe4lgFCGvDIZDu2XV+7NdWzQ9OrPe/Fcr4k2za87gJL5Z3CKJOkRncB42NrTHZJLGhv
         26Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022965; x=1790627765;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5AIKP1mP34Wx9dw84lO7Zn0zSS/9x6lk1WSUH1MKxg=;
        b=hEckRLVjNBiN9F8KL2sEWZiu1dOL7SLwFu34J+FgP+lJYPM3VAP40sFrZ+x8cHKZiY
         q3Wn8orr+qIdP5+7oFrFQhjJ1cQfeXEHYUcu2VypTSC65XHmNoKfTaLaoEb3qyBzHZKx
         jyKwlGP1cBBuFDcNlYw0t9nPe5wt+wH1VM03XyiT4+x+4WP/SgfwPgIHt5yZKapSzQxE
         LWwJ7HEJH34FZOKxWHTNpEH9B0tSL5Ze43EWNgmX4aDrJuV4nNSf4t5eqLNJUs0O78zz
         A6vP6kg5W2RSsNFc8Jw7nMQMy1JlfOyNreqLfVHoWy/NPgGNh0pTbjzfmcL4CbUybu+v
         KsAw==
X-Forwarded-Encrypted: i=1; AKwUvByDOXCFmTa7cd4ZAdF/nfvlwtzSu6aXtQcAFf0DhTvnKKFKVuUkZks8Y6ODBZu+UfQu26pdBvF9TXc=@lists.infradead.org
X-Gm-Message-State: AFuF++mEXUBaqtEOfEj0RPW7QawKke+rvRs7PRpVs/cbN+6DLIOiPi86
	Zd2pK2KMBPSwOyFSFtxamWqfLG47nxsDb4Imd1QfWIQwJzQ9G9oOPzHyhc8CrIgj1YX5ZNEEiFY
	5j6oHec4MWlyNu1tcOnA/YzoRm8JNXj8d/mGMpN/og+VEK1zmQn6ed+Gf/ohY59yYQxiX
X-Gm-Gg: AYBFou3amBVwy9PmZehn6z7PRsOk0cTEvYtytMySpcIqYF3WvUVcQK6sjA9q95bsq9s
	pYiTDb+BOdrvU9la+CM1yHgkxsQF4lUdaQ4ENA1wMdfMp5USF+KYlzV2KUHfmlz6zqjumQooDYC
	woxfSgmyyoTCoSGXjlgvvFrOh7w/dOu4UNnPDO/KfPPauWDb6J28GMJ7t++hxmFRXazgHbQcmcv
	ajPEaauCKovxEDH5e6jdn8Dse9IzIZnI9oXTeAjEB0eYmMRRfnY/3dFuPjACIHZ2ZMXo0NCNQUJ
	akb2xdY6gLbyzg8bNGgk/B4y3bJ+HssYCC4uASMcqTmvbJxGvbW7jG+8BahkTBnO91q6VfJTOTf
	JswUFeC6TuqkiqqBkukj+DjVC30N5e94lwg==
X-Received: by 2002:a17:90b:17c2:b0:39e:6c69:f471 with SMTP id 98e67ed59e1d1-39e6c69f552mr11786902a91.48.1790022964917;
        Mon, 21 Sep 2026 13:36:04 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:39e:6c69:f471 with SMTP id 98e67ed59e1d1-39e6c69f552mr11786876a91.48.1790022964357;
        Mon, 21 Sep 2026 13:36:04 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0696b0d1fsm470437a91.1.2026.09.21.13.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:36:03 -0700 (PDT)
Message-ID: <9fc5a569-003b-4d5e-a943-04ebfdd1e9bd@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 02:05:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
 <h4c5oybkuxf2wmja2osm73ntpolx2ap3csskipbuyoks6xtdsi@5ihhj6ztn7mq>
 <9e3da313-ab1f-435d-8e3c-1a0c946a7790@quicinc.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <9e3da313-ab1f-435d-8e3c-1a0c946a7790@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMwMSBTYWx0ZWRfXwHsZjfy6AfFC
 SE0td6m3qQD9fYBOeODxDMB2gCLoAKGXAa3Ygx/8dW+0OHevHfGM4W1VtKFrn8MFHM7eh9nNTd9
 AUz/zgXk7yYZ6RCbiWIPNt8JllW+3idSOfE/KHNlkuAFdeRPR9e9llx5FqnKQgaoxQJy/ApjJ5j
 nHNNF9EJ0fbCFxeG8LJcz4dWQsQrPqL0wdPHWrucuAxH2YaY9G9jeUZTsDgv3nO9BQu4EPQAgR8
 gPK72b4UoigS6FfnqdnPubJYy9iFfGmByVeT6y0QZCSyeIMP8sjiy7QrgMB7p4M8GkI19/xJMW8
 /ZrMa0Bh1aYrJKuRAvrUanIWxY1TCE+Uory22boecNes72VxvOie33MqtBF9Z9UmNJ2byTFEWHo
 jwOPK4ct8+9mQkGkWYEF2cRYMMPB5fdBkWWb0xMJv6r8xTqGrLL4LpJKzBSwvCyjCdK6J6PRJZY
 e4FnzYbnmLrRSx0QqbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMwMSBTYWx0ZWRfX8XgYW/PlC/qR
 6DICza4PVKtjYSW9+QIhQa0d3MpPGqxxKP4dweXM6m7cV1psBGDVG/beyz/0CjNlJsACVq76N1L
 NWoX59fdcIu3ykjuZQVUmC1WFCZ8lag=
X-Proofpoint-ORIG-GUID: nyeyil-UBarK0HfK3QVa6qh8rc7ahbby
X-Proofpoint-GUID: nyeyil-UBarK0HfK3QVa6qh8rc7ahbby
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab19536 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mqtUebdMckNC0E4VJ4YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_133607_558023_4232CD0F 
X-CRM114-Status: GOOD (  35.03  )
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

SGkgQmpvcm4sIFBsZWFzZSBmaW5kIG15IHJlc3BvbnNlcyBpbmxpbmUgYmVsb3cuIEkgaGF2ZSBt
aWdyYXRlZCBmcm9tIG15IApAcXVpY2luYy5jb20gZW1haWwgYWRkcmVzcyB0byBAb3NzLnF1YWxj
b21tLmNvbSBhbmQgY291bGQgbm90IGxvY2F0ZSB0aGUgCm9yaWdpbmFsIGVtYWlsIHRocmVhZC4K
ClRoZSByZXBsaWVzIGJlbG93IGFyZSBmcm9tIGEgZHJhZnQgSSBoYWQgc2F2ZWQgZWFybGllci4g
SSBhbSBzZW5kaW5nIAp0aGVtIG5vdyBmcm9tIG15IE9TUyBhY2NvdW50IGFmdGVyIHJlc29sdmlu
ZyB0aGUgc2xhdmUgc2V0dXAgYW5kIAp2YWxpZGF0aW9uIGlzc3VlcyB0aGF0IGhhZCBkZWxheWVk
IHRoZSByZXNwb25zZS4gSSBzaGFsbCB1cGxvYWQgVjcgCmNsZWFubHkgd2l0aCBPU1MgSUQuCgpP
biAzLzUvMjAyNiA5OjEyIFBNLCBNdWtlc2ggS3VtYXIgU2F2YWxpeWEgd3JvdGU6Cj4gVGhhbmtz
IEJqb3JuICEKPiBJIGFtIHNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSwgaSB3YXMgY29tcGxldGVs
eSBvZmYgZnJvbSB0aGlzIHdvcmsuIEkgCj4gaGF2ZSByZXN0YXJ0ZWQgdGhpcyBzZXJpZXMgd29y
ayBhbmQgd2lsbCBjb250aW51ZSBub3cgb253YXJkcy4KPiAKPiBPbiA3LzIvMjAyNSAyOjI2IEFN
LCBCam9ybiBBbmRlcnNzb24gd3JvdGU6Cj4+IE9uIFR1ZSwgSnVsIDAxLCAyMDI1IGF0IDEyOjQ4
OjUxUE0gKzA1MzAsIE11a2VzaCBLdW1hciBTYXZhbGl5YSB3cm90ZToKPj4+IEFkZCBzdXBwb3J0
IGZvciB0aGUgUXVhbGNvbW0gSTNDIGNvbnRyb2xsZXIgZHJpdmVyLCB3aGljaCBpbXBsZW1lbnRz
Cj4+PiBJM0MgbWFzdGVyIGZ1bmN0aW9uYWxpdHkgYXMgZGVmaW5lZCBpbiB0aGUgTUlQSSBBbGxp
YW5jZSBTcGVjaWZpY2F0aW9uCj4+PiBmb3IgSTNDLCBWZXJzaW9uIDEuMC4KPj4+Cj4+PiBUaGlz
IGRyaXZlciBzdXBwb3J0cyBtYXN0ZXIgcm9sZSBpbiBTRFIgbW9kZS4KPj4+Cj4+PiBVbmxpa2Ug
c29tZSBvdGhlciBJM0MgbWFzdGVyIGNvbnRyb2xsZXJzLCB0aGlzIGltcGxlbWVudGF0aW9uCj4+
PiBkb2VzIG5vdCBzdXBwb3J0IEluLUJhbmQgSW50ZXJydXB0cyAoSUJJKSBhbmQgSG90LWpvaW4g
cmVxdWVzdHMuCj4+Cj4+IEkgYmVsaWV2ZSB0aGUgY2FwaXRhbGl6YXRpb24gb2YgdGhlIGxhc3Qg
ZmVhdHVyZSBpcyAiSG90LUpvaW4iCj4+Cj4+IEl0J3Mgbm90IGVudGlyZWx5IGNsZWFyIGZyb20g
dGhpcyBzZW50ZW5jZSBpZiBpdCdzIHRoZSBjb250cm9sbGVyIG9yIHRoZQo+PiBkcml2ZXIgdGhh
dCBkb2Vzbid0IHN1cHBvcnQgdGhlc2UgZmVhdHVyZXMuIFBsZWFzZSB1cGRhdGUgdG8gbWFrZSBp
dAo+PiBjbGVhci4KPj4KPiBTdXJlLCBsZXQgbWUgY2xhcmlmeSBpdCBhbmQgdXBkYXRlIHRoZSBj
b21taXQgbG9nLgo+IEl0J3MgdGhlIGRyaXZlciB3aGljaCBkb2Vzbid0IHN1cHBvcnQgSG90LUpv
aW4gZm9yIG5vdywgd2UgcGxhbiB0byBhZGQgCj4gaXQgaW4gZnV0dXJlLgo+IAo+IEkgd291bGQg
cmVjdGlmeSBjaXRpbmcgY29udHJvbGxlciBkcml2ZXIgZG9lc24ndCBzdXBwb3J0IHRoZXNlIGZl
YXR1cmVzLgo+PiBbLi5dCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL01ha2Vm
aWxlIGIvZHJpdmVycy9pM2MvbWFzdGVyL01ha2VmaWxlCj4+PiBpbmRleCAzZTk3OTYwMTYwYmMu
LjBlM2FkOWQ5NjQyNCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9NYWtlZmls
ZQo+Pj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL01ha2VmaWxlCj4+PiBAQCAtMSw1ICsxLDYg
QEAKPj4+IMKgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+Pj4gwqAg
b2JqLSQoQ09ORklHX0NETlNfSTNDX01BU1RFUinCoMKgwqDCoMKgwqDCoCArPSBpM2MtbWFzdGVy
LWNkbnMubwo+Pj4gK29iai0kKENPTkZJR19JM0NfUUNPTV9HRU5JKcKgwqDCoMKgwqDCoMKgICs9
IGkzYy1xY29tLWdlbmkubwo+Pj4gwqAgb2JqLSQoQ09ORklHX0RXX0kzQ19NQVNURVIpwqDCoMKg
wqDCoMKgwqAgKz0gZHctaTNjLW1hc3Rlci5vCj4+PiDCoCBvYmotJChDT05GSUdfQVNUMjYwMF9J
M0NfTUFTVEVSKcKgwqDCoCArPSBhc3QyNjAwLWkzYy1tYXN0ZXIubwo+Pj4gwqAgb2JqLSQoQ09O
RklHX1NWQ19JM0NfTUFTVEVSKcKgwqDCoMKgwqDCoMKgICs9IHN2Yy1pM2MtbWFzdGVyLm8KPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvaTNjLXFjb20tZ2VuaS5jIGIvZHJpdmVy
cy9pM2MvbWFzdGVyLyAKPj4+IGkzYy1xY29tLWdlbmkuYwo+PiBbLi5dCj4+PiArCj4+PiArc3Ry
dWN0IGdlbmlfaTNjX2kyY19kZXZfZGF0YSB7Cj4+PiArwqDCoMKgIHUzMiBpYmlfa2VlcGluZzvC
oCAvKiBQbGFuIHRvIHNhdmUgSUJJIGluZm9ybWF0aW9uLCBrZWVwIGFzIGR1bW15IAo+Pj4gZm9y
IG5vdyAqLwo+Pgo+PiBDb21taXQgbWVzc2FnZSBzYXlzIHRoYXQgUVVQIGRvZXNuJ3Qgc3VwcG9y
dCBJQkksIHNvIHdoYXQgaXMgdGhpcz8KPj4KPiBObywgaSBtZWFudCB0byBzYXkgSTNDIGRyaXZl
ciBkb2Vzbid0IHN1cHBvcnQgSUJJIGFsb25nIHdpdGggSG90LUpvaW4uIEkgCj4gaGF2ZSBlbmhh
bmNlZCB0aGUgY29tbWl0IGxvZyB0byBtYWtlIGl0IGNsZWFyLgo+IAo+PiBBbHNvLCB3aHkgImtl
ZXAgYXMgZHVtbXkiPwo+Pgo+IFJlbW92ZWQgaXQgYXMgd2UgYXJlIG5vdCB1c2luZyBpdC4KPiAK
Pj4+ICt9Owo+Pj4gKwo+PiBbLi5dCj4+PiArc3RhdGljIHZvaWQgcWNvbV9nZW5pX2kzY19jb25m
KHN0cnVjdCBnZW5pX2kzY19kZXYgKmdpM2MsIGVudW0gCj4+PiBpM2NfYnVzX3BoYXNlIGJ1c19w
aGFzZSkKPj4+ICt7Cj4+PiArwqDCoMKgIGNvbnN0IHN0cnVjdCBnZW5pX2kzY19jbGtfc2V0dGlu
Z3MgKmNsa19pZHggPSBnaTNjLT5jbGtfY2ZnOwo+Pj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIGZy
ZXE7Cj4+PiArwqDCoMKgIHUzMiB2YWwsIGRmc19pZHg7Cj4+PiArwqDCoMKgIGludCByZXQ7Cj4+
PiArCj4+PiArwqDCoMKgIGlmIChidXNfcGhhc2UgPT0gT1BFTl9EUkFJTl9NT0RFKQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGNsa19pZHggPSBnaTNjLT5jbGtfb2RfY2ZnOwo+Pj4gKwo+Pj4gK8KgwqDC
oCByZXQgPSBnZW5pX3NlX2Nsa19mcmVxX21hdGNoKCZnaTNjLT5zZSwgY2xrX2lkeC0+Y2xrX3Ny
Y19mcmVxLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmRm
c19pZHgsICZmcmVxLCBmYWxzZSk7Cj4+PiArwqDCoMKgIGlmIChyZXQpCj4+PiArwqDCoMKgwqDC
oMKgwqAgZGZzX2lkeCA9IDA7Cj4+PiArCj4+PiArwqDCoMKgIHdyaXRlbF9yZWxheGVkKGRmc19p
ZHgsIGdpM2MtPnNlLmJhc2UgKyBTRV9HRU5JX0NMS19TRUwpOwo+Pj4gKwo+Pj4gK8KgwqDCoCB2
YWwgPSBGSUVMRF9QUkVQKENMS19ESVZfVkFMVUVfTUFTSywgY2xrX2lkeC0+Y2xrX2Rpdik7Cj4+
PiArwqDCoMKgIHZhbCB8PSBTRVJfQ0xLX0VOOwo+Pj4gK8KgwqDCoCB3cml0ZWxfcmVsYXhlZCh2
YWwsIGdpM2MtPnNlLmJhc2UgKyBHRU5JX1NFUl9NX0NMS19DRkcpOwo+Pj4gKwo+Pj4gK8KgwqDC
oCB2YWwgPSBGSUVMRF9QUkVQKEkyQ19TQ0xfSElHSF9DT1VOVEVSX01BU0ssIGNsa19pZHgtIAo+
Pj4gPmkyY190X2hpZ2hfY250KTsKPj4+ICvCoMKgwqAgdmFsIHw9IEZJRUxEX1BSRVAoSTJDX1ND
TF9MT1dfQ09VTlRFUl9NQVNLLCBjbGtfaWR4LSAKPj4+ID5pMmNfdF9sb3dfY250KTsKPj4+ICvC
oMKgwqAgdmFsIHw9IEZJRUxEX1BSRVAoSTJDX1NDTF9DWUNMRV9DT1VOVEVSX01BU0ssIGNsa19p
ZHgtIAo+Pj4gPmkyY190X2N5Y2xlX2NudCk7Cj4+PiArwqDCoMKgIHdyaXRlbF9yZWxheGVkKHZh
bCwgZ2kzYy0+c2UuYmFzZSArIFNFX0kyQ19TQ0xfQ09VTlRFUlMpOwo+Pj4gKwo+Pj4gK8KgwqDC
oCB3cml0ZWxfcmVsYXhlZChjbGtfaWR4LT5pM2NfdF9jeWNsZV9jbnQsIGdpM2MtPnNlLmJhc2Ug
KyAKPj4+IFNFX0kzQ19TQ0xfQ1lDTEUpOwo+Pj4gK8KgwqDCoCB3cml0ZWxfcmVsYXhlZChjbGtf
aWR4LT5pM2NfdF9oaWdoX2NudCwgZ2kzYy0+c2UuYmFzZSArIAo+Pj4gU0VfSTNDX1NDTF9ISUdI
KTsKPj4+ICsKPj4+ICvCoMKgwqAgd3JpdGVsX3JlbGF4ZWQoTV9JQklfSVJRX0lHTk9SRSwgZ2kz
Yy0+c2UuYmFzZSArIAo+Pj4gU0VfR0VOSV9IV19JUlFfSUdOT1JFX09OX0FDVElWRSk7Cj4+PiAr
Cj4+PiArwqDCoMKgIHZhbCA9IE1fSUJJX0lSUV9QQVJBTV9TVE9QX1NUQUxMIHwgTV9JQklfSVJR
X1BBUkFNXzdFOwo+Pj4gK8KgwqDCoCB3cml0ZWxfcmVsYXhlZCh2YWwsIGdpM2MtPnNlLmJhc2Ug
KyBTRV9HRU5JX0hXX0lSUV9DTURfUEFSQU1fMCk7Cj4+PiArCj4+PiArwqDCoMKgIHdyaXRlbF9y
ZWxheGVkKE1fSUJJX0lSUV9FTiwgZ2kzYy0+c2UuYmFzZSArIFNFX0dFTklfSFdfSVJRX0VOKTsK
Pj4KPj4gRG9uJ3QgeW91IHdhbnQgYSBub24tcmVsYXhlZCB3cml0ZSBoZXJlLCB0byBjbGFyaWZ5
IHRoYXQgdGhlIG9yZGVyaW5nIG9mCj4+IHRoaXMgd3JpdGUgYW5kIHRoZSBwcmV2aW91cyBhcmUg
c2lnbmlmaWNhbnQ/Cj4+Cj4gRG8geW91IG1lYW4gZm9yIElCSV9JUlFfRU4gb3IgdGhlIHdob2xl
IGZ1bmN0aW9uID8gSWYgeWVzLCB0aGVuIGkgY2FuIAo+IGNoYW5nZSB0byBlbnN1cmUgbm8gcmUt
b3JkZXJpbmcuIEJ1dCBpIGRvbid0IHNlZSByZW9yZGVyaW5nIGZvciBjb21wbGV0ZSAKPiBmdW5j
dGlvbiBpcyByZXF1aXJlZC4KPj4KPj4gQXMgYWJvdmUsIHRoZSBjb21taXQgbWVzc2FnZSBzYXlz
IHRoZSBjb250cm9sbGVyIGRvZXNuJ3QgZG8gSUJJLCBzbyB3aHkKPj4gYXJlIHdlIGVuYWJsaW5n
IElCSSBpbnRlcnJ1cHRzPyAoSnVzdCBndWVzc2luZyBiYXNlZCBvbiB0aGUgSVJRIG5hbWVzKQo+
Pgo+IFllcywgY29tbWl0IG1lc3NhZ2Ugc2F5cyByaWdodGx5Lgo+IFdlIGFyZSBlbmFibGluZyBq
dXN0IHRvIGVuc3VyZSBJM0MgY29udHJvbGxlciB3b3JrcyB3aXRoIElCSSBjb250cm9sbGVyIAo+
IGVuYWJsZWQuIEFuZCB0aGF0J3MgbWFuZGF0b3J5IHBlciBIVyBwcm9ncmFtbWluZyBzZXF1ZW5j
ZSBhcyB3ZSBkb24ndCAKPiBkaXNhYmxlIElCSSBjb250cm9sbGVyIGV2ZW4gd2UgZG9uJ3QgdXNl
IElCSSBmZWF0dXJlcyBsaWtlIElCSSBpbnRlcnJ1cHQuCj4+PiArfQo+Pj4gKwo+PiBbLi5dCj4+
PiArc3RhdGljIGludCBnZW5pX2kzY19tYXN0ZXJfYXR0YWNoX2kyY19kZXYoc3RydWN0IGkyY19k
ZXZfZGVzYyAqZGV2KQo+Pj4gK3sKPj4+ICvCoMKgwqAgc3RydWN0IGdlbmlfaTNjX2kyY19kZXZf
ZGF0YSAqZGF0YTsKPj4+ICsKPj4+ICvCoMKgwqAgZGF0YSA9IGt6YWxsb2Moc2l6ZW9mKCpkYXRh
KSwgR0ZQX0tFUk5FTCk7Cj4+PiArwqDCoMKgIGlmICghZGF0YSkKPj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gLUVOT01FTTsKPj4+ICsKPj4+ICvCoMKgwqAgaTJjX2Rldl9zZXRfbWFzdGVyX2Rh
dGEoZGV2LCBkYXRhKTsKPj4KPj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwsIHRoZSBtYXN0ZXJfZGF0
YSBpcyBwcml2YXRlIHRvIHRoZSBjb250cm9sbGVyCj4+IGRyaXZlciwgYW5kIHRoZSBvbmx5IHRo
aW5nIEkgY2FuIGZpbmQgeW91IGRvIHdpdGggaXQgdG8gZnJlZSBpdCBhZ2FpbiBvbgo+PiBkZXRh
Y2guCj4+Cj4+IEFtIEkgbWlzc2luZyBzb21ldGhpbmcgb3IgY2FuIHRoZXNlIDQgb3B0aW9uYWwg
ZnVuY3Rpb25zIGJlIHJlbW92ZWQ/Cj4+Cj4gWWVzLCByaWdodCBub3cgdGhlc2UgZnVuY3Rpb25z
IGNhbiBiZSByZW1vdmVkIGFzIGl0IGRvZXNuJ3QgZG8gYW55dGhpbmcuCj4gSSBoYWQga2VwdCBp
dCB0aGVyZSB0byBhZGQgc29tZXRoaW5nIHJlYWxseSByZXF1aXJlZCBpbiBmdXR1cmUuCj4+PiAr
Cj4+PiArwqDCoMKgIHJldHVybiAwOwo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgdm9pZCBnZW5p
X2kzY19tYXN0ZXJfZGV0YWNoX2kyY19kZXYoc3RydWN0IGkyY19kZXZfZGVzYyAqZGV2KQo+Pj4g
K3sKPj4+ICvCoMKgwqAgc3RydWN0IGdlbmlfaTNjX2kyY19kZXZfZGF0YSAqZGF0YSA9IGkyY19k
ZXZfZ2V0X21hc3Rlcl9kYXRhKGRldik7Cj4+PiArCj4+PiArwqDCoMKgIGkyY19kZXZfc2V0X21h
c3Rlcl9kYXRhKGRldiwgTlVMTCk7Cj4+PiArwqDCoMKgIGtmcmVlKGRhdGEpOwo+Pj4gK30KPj4+
ICsKPj4+ICtzdGF0aWMgaW50IGdlbmlfaTNjX21hc3Rlcl9hdHRhY2hfaTNjX2RldihzdHJ1Y3Qg
aTNjX2Rldl9kZXNjICpkZXYpCj4+PiArewo+Pj4gK8KgwqDCoCBzdHJ1Y3QgZ2VuaV9pM2NfaTJj
X2Rldl9kYXRhICpkYXRhOwo+Pj4gKwo+Pj4gK8KgwqDCoCBkYXRhID0ga3phbGxvYyhzaXplb2Yo
KmRhdGEpLCBHRlBfS0VSTkVMKTsKPj4+ICvCoMKgwqAgaWYgKCFkYXRhKQo+Pj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiAtRU5PTUVNOwo+Pj4gKwo+Pj4gK8KgwqDCoCBpM2NfZGV2X3NldF9tYXN0
ZXJfZGF0YShkZXYsIGRhdGEpOwo+Pj4gKwo+Pj4gK8KgwqDCoCByZXR1cm4gMDsKPj4+ICt9Cj4+
PiArCj4+PiArc3RhdGljIHZvaWQgZ2VuaV9pM2NfbWFzdGVyX2RldGFjaF9pM2NfZGV2KHN0cnVj
dCBpM2NfZGV2X2Rlc2MgKmRldikKPj4+ICt7Cj4+PiArwqDCoMKgIHN0cnVjdCBnZW5pX2kzY19p
MmNfZGV2X2RhdGEgKmRhdGEgPSBpM2NfZGV2X2dldF9tYXN0ZXJfZGF0YShkZXYpOwo+Pj4gKwo+
Pj4gK8KgwqDCoCBpM2NfZGV2X3NldF9tYXN0ZXJfZGF0YShkZXYsIE5VTEwpOwo+Pj4gK8KgwqDC
oCBrZnJlZShkYXRhKTsKPj4+ICt9Cj4+PiArCj4+Cj4+IFJlZ2FyZHMsCj4+IEJqb3JuCj4+Cj4g
CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
