Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BB6606A31E
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Nov 2026 19:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dLAlHO2L;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uk5rV/l5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YBfo9n5X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MghXtlHegCVopKc8WMfQy8gFMZpqhA+NdF88+mmKD08=; b=dLAlHO2LK9bZNWbkx1dvrrW3Gt
	4+fiVCDkznoJuO9Vmslg6TQYPSzluMiuu+FlECT66olSXrWdQQ9X+7/UFuXPwtdHxcxinrPkQkatm
	NOc0i6IL5Gp104Ca3e5cd9dRe+vD/EKQRZ4stg4mSy5UgZ9DoAIvV7SxW4Bx7NyV2TD+H8geKvfFD
	wawGCNlGDqRM7ZFYUCpzX4bNQ6hgwMxbvwBIEoPgnxBRjVU+5/BabRDqfY+5ogNHEqzbjyZow6jhB
	xIBWrHmCCa2hv3jfbelnxN5eadK9s2OkuPlouAF9vSjgqODljxFSxetUscUxvPKvReMLUoShkLitd
	wHxf12Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfWc-0000000EOq0-1wgO;
	Thu, 26 Nov 2026 19:52:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfWZ-0000000EOpG-3Z1M
	for linux-i3c@lists.infradead.org;
	Thu, 26 Nov 2026 19:52:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGbxI4595613
	for <linux-i3c@lists.infradead.org>; Thu, 26 Nov 2026 19:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8OXmQtoklj2Udyf3/V72AhLNiiEKED83MO9ZViqbF4w=; b=Uk5rV/l5aNW/Vhz2
	ysXYe3MP6uzNTmXihkV/k751kqmOZyFRZeJndOedMGAtsbUGWTO3MJqX587jptAL
	giwfcUlymQPBdT4VWbipaEkFni2pu07pVM8MzF+lB7yQOnUuoMjTO47gJj6z8m2C
	21cetFkiFubZeBl2xL04m4HzgXItqDTT9cxTuzFizMg8ZbuLKvSb9GVe9sRj67do
	fwSORcXJQyrr9Sr2785PueQt6o0H7OmPT8m/SeIJabHT6ZXBi3/F3Lfde1wn6Tyy
	mrLVdDsL+MHz7/J2wi4hvtesGYFcu+ZP1eZzHY3+NzBepSfuVml70+13bOB1P3nB
	VHRn6Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf90h79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Thu, 26 Nov 2026 19:52:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a65fca25so6426825eec.0
        for <linux-i3c@lists.infradead.org>; Thu, 26 Nov 2026 11:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795722774; x=1796327574; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OXmQtoklj2Udyf3/V72AhLNiiEKED83MO9ZViqbF4w=;
        b=YBfo9n5X+58w3v4XlJX0SxY8SET15KDT0fV3DA4rs4kkQdaNi8ve45DvLhuUiylp4c
         TpVkEjymop6+PlTTFSRG/C1l6SYFFzH3Z/TMSy3cXHDME4CgQdegprJe4CH8wnf0X1MU
         /kYS4V9Buq213RAuBOBWUdQSjeBLAFlOZzJtjqG/R0SvHVPyZk1KdwPy2h6A5kknJYWS
         HxBpVKlIgWMb2L1PxqZ7X+Ukcv4E3LDIVdY9oZ6YHLwaEIIyUQLwUY37c8I0EAj1PD6x
         qdz8CBNJ/P7QGMpb4IwXIovxbBGi1DUBcjz4mtreLNiLOu/Kwu0AkwsjsiFVvScuc6Pv
         mp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722774; x=1796327574;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OXmQtoklj2Udyf3/V72AhLNiiEKED83MO9ZViqbF4w=;
        b=D+73+UnYLSCxs46wuos0fE0xiueNw+YBhjCFJS42F+PQfe6KC8b8F00FoYReUY8Oiz
         3+KjmLO6uDDwMqdwVYrUQaiwxsnerhX6xg3E1GvttV3oVhrUCYM9whJRXiieiB1TTuhO
         4zEEW+B5i94fnC13dxwShiShbuGLCNQonX4q3Aig5tXiJVh67afyGTWAfjhL38O8cwNz
         myHef7SNrBTyuFdtTF8kAlw0BB7ja9WmCn+NUJSn2t29xY8OyAKBgX7dXaCIFIfSXLsV
         w/1ts2fpEfh9qAiLpqxFY+vgT4araBO2+hBAuFfBWqTDxMqCGJGy26VFoGWMbgiZrTi9
         NiPA==
X-Gm-Message-State: APuU4Z+3WglDWOQd5nFKfnHarvMncvySF2WKM4oXk0FGrJ7ntt3Puwja
	wezUiJ6PiI7vjkQn8KH+7hxuCsvucKSEu5R0DSEq7SaQmZVH7SyyziI5HBdKAgjKkCqv5TrYAha
	iVw88rsbLLvPke1neJ4q1Z6a0Yc8X7X+MXXmGuvoqlegKA/uz+oiC6Fhdtv0ywqWKkhnw
X-Gm-Gg: AZFdTZeobMUL+sbxS/1/mczA5xIosZI/nBzmtKvoVomb21mwamqZPL0biASvq/mhpkT
	bsjymGGNptlChNCJPMnEI4zFeIr+mrspWk6cis4Jy/dzinddF08M+CYAdOcqyNvvl7DHZhW9QnT
	nJGLXPze401AY3itdkklExGlMNfkNQxTwnlsF/OdI6GbAyfb2KE3gnQ6sFtWzqN64vXpf8jgQH2
	h6vc2gu5sNVxpcbt1DAcS2dUuRDad76nUs73htAMoJVk/ZaZeeEJDJo3ggjBK/4YaBL7KTzfEoG
	C7Z7o/WcNfPgBgYMjnVyt1BJEMudfypajE6CfHDYySO+Phkarp+d3pBnoMJWaqsrQxitUDGJClY
	xzWPctiJMJ+GDpH1vIxx2BfGTQ1QaUUjn6O1/Yj1ifaiw3iiBZr1CkkwjAl5uyM96AlIUUkUKAY
	yw3yau
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr30524043eec.23.1795722774071;
        Thu, 26 Nov 2026 11:52:54 -0800 (PST)
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr30524022eec.23.1795722773573;
        Thu, 26 Nov 2026 11:52:53 -0800 (PST)
Received: from [192.168.1.5] ([106.222.228.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm65040188eec.23.2026.11.26.11.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 11:52:53 -0800 (PST)
Message-ID: <f6154dbc-0ea1-494e-8c31-c0faa93add24@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 01:22:49 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: master: Disable slave events before RSTDAA
To: =?UTF-8?B?RGVmYSBMaSAo5p2O5b635Y+RKQ==?= <Defa.Li@mediatek.com>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
References: <6b079454.7734c9c0.2aca01.17e2SMTPIN_ADDED_BROKEN@mx.google.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <6b079454.7734c9c0.2aca01.17e2SMTPIN_ADDED_BROKEN@mx.google.com>
X-Proofpoint-ORIG-GUID: iKj0h8IVpJdJKTKFVHfvrkQFJGOzzJ3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3OCBTYWx0ZWRfX/GHJxULUszfE
 2Z36Pf6pUVUx02GvHWXR8Wxg9YJEQvYkG2ibldUgDtrzGU1URyuiDkvoNz2JNPTuWX03UUV6nDc
 4rzxEVa05snA0fK/eTxJDTKCG9q7RQ5kJaZzbM/a0u4rDXTLaYeZUnXbk7NvPgQXHHyJURNQRJC
 irx9Km6woCOZPGwWv4deMsvw7iMLysbZpGIMVQLDA6fJ03Ng5RQSl2v4KDT/2b9nIkcyui1sWvb
 F4pwsZGIXRmNXDb8u2jtx69oeQdRBf9WJXUSYSHR1BMyky1QzfpNxumgFac+hj/8+m+kDdAy+Hw
 1xGDBV0dGeH/GamMVUWgDDthwLlGctEQdsGGGUT8WvD/VVlavJ+u8WZCW1vvsAnyYwIluQ7XcUU
 KCBbqKb5I2B2CXAbRJphFBHKN0P8FXFj2E+1We9XyBXOsQ3zOnb5A36BF8qIKBBOhUxoMOqqXaz
 +g+zgxn0qgu2MhcIXdA==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b088e16 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=5paVSw64R4kEUMRm3sSMUA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=mpaa-ttXAAAA:8 a=EUspDBNiAAAA:8 a=fTKnqD0I0o4mAj6HKpEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3OCBTYWx0ZWRfX5X7Gy5cGtZ66
 T54a1Xa9DRdmoCNOYP4TGb7Yyuu/JW+5gQqd7eIaiRHuupTP4nXPyvQCrSugl7SDQRvkWF3ACWp
 SeWU3fm04FqEJyC4eI3FWMl9YHsY/iA=
X-Proofpoint-GUID: iKj0h8IVpJdJKTKFVHfvrkQFJGOzzJ3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_115255_914931_2FAD2CF4 
X-CRM114-Status: GOOD (  13.89  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAxMS8yNi8yMDI2IDc6MzcgQU0sIERlZmEgTGkgKOadjuW+t+WPkSkgd3JvdGU6CgpbLi4u
XQoKPj4gCj4+IFdoaWxlIHRoZSBzZXF1ZW5jZSB5b3Ugc3VnZ2VzdGVkIG1ha2luZyBzZW5zZSB0
byBtZSwgYnV0IGkgYW0KPj4gd29uZGVyaW5nCj4+IGJlZm9yZSBidXNfaW5pdCwgYXJlIHRoZXJl
IHJlYWxseSBhIHRhcmdldCBkZXZpY2UgZ2V0dGluZyBwb3dlcmVkIHVwCj4+IHdobwo+PiBjYW4g
Z2VuZXJhdGUgaG90am9pbiA/Cj4+IAo+PiBNWSB1bmRlcnN0YW5kaW5nIGlzLCBwb3N0IG1hc3Rl
ciByZWdpc3RyYXRpb24gYW5kIGJ1c19pbml0IG9ubHkKPj4gdGFyZ2V0Cj4+IGRldmljZXMgc2hv
dWxkIHN0YXJ0IGxpZmUsIGlzbid0IGl0ID8KPj4gCj4gCj4gVGhpcyBwYXRjaCBpcyBub3QgaW50
ZW5kZWQgdG8gYWRkcmVzcyBhbnkgdGFyZ2V0IGRldmljZSBiZWhhdmlvcnMgdGhhdAo+IG9jY3Vy
IGJlZm9yZSBidXNfaW5pdCBpdHNlbGYuCj4gCj4gT3VyIGFjdHVhbCBoYXJkd2FyZSB0ZXN0aW5n
IHJldmVhbGVkIHRoYXQgc29tZSB0YXJnZXQgZGV2aWNlcyB3aWxsCj4gYWN0aXZlbHkgdHJpZ2dl
ciBhIEhvdC1Kb2luIHJlcXVlc3Qgd2l0aGluIGEgc2hvcnQgd2luZG93IGFmdGVyCj4gcmVjZWl2
aW5nIHRoZSBSU1REQUEgQ0NDLiBCeSBzZW5kaW5nIHRoZSBicm9hZGNhc3QgRElTRUMgZmlyc3Qs
IHdlCj4gZW5zdXJlIHRoYXQgbm8gc3VjaCBIb3QtSm9pbiByZXF1ZXN0cyBjYW4gYmUgZmlyZWQg
YWZ0ZXIgUlNUREFBLAo+IHN1Y2Nlc3NmdWxseSBwcmV2ZW50aW5nIHRoaXMgaXNzdWUuCj4gCkkg
c2VlLCBzbyBpdCdzIG5vdCBhIHRhcmdldCBkZXZpY2UgZmF1bHQgYnV0IGkgdGFrZSBpdCBhcyB2
YWxpZCBzY2VuYXJpbyAKZXZlbiBmcm9tIHRhcmdldCBzaWRlLgo+IFRoZXJlZm9yZSwgc2VuZGlu
ZyBicm9hZGNhc3QgRElTRUMgYmVmb3JlIFJTVERBQSBtYWtlcyB0aGUgZW50aXJlCj4gaW5pdGlh
bGl6YXRpb24gc2VxdWVuY2UgbXVjaCBtb3JlIHJvYnVzdC4KPiAKQWdyZWVkICEgTWFrZXMgc2Vu
c2UgdG8gbWUuCj4+IAo+PiA+IFNpZ25lZC1vZmYtYnk6IERlZmEgTGkgPGRlZmEubGlAbWVkaWF0
ZWsuY29tPgo+PiA+IC0tLQpSZXZpZXdlZC1ieTogTXVrZXNoIEt1bWFyIFNhdmFsaXlhIDxtdWtl
c2guc2F2YWxpeWFAb3NzLnF1YWxjb21tLmNvbT4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
